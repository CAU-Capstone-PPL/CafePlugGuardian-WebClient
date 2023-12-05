import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/provider/plug_information_provider.dart';
import 'package:webclient/provider/user_provider.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';
import 'package:webclient/widgets/page_entry_button_widget.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  final int plugId;
  const HomeScreen({super.key, required this.plugId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  late String name;

  @override
  void initState() {
    super.initState();
    _startTimer();
    if (context.read<UserProvider>().isAuthenticated) {
      name = context.read<UserProvider>().user!.userName;
    } else if (context.read<UserProvider>().isUnMember) {
      Random random = Random();

      name = '손님 ${random.nextInt(9999) + 1}';
    }
    //plug = ApiPlug.getPlugById(widget.id);
  }

  void _startTimer() {
    context.read<PlugInformationProvider>().updatePlug(widget.plugId);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      context.read<PlugInformationProvider>().updatePlug(widget.plugId);
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fillRatio =
        context.watch<PlugInformationProvider>().plug!.assignPower == 0.0
            ? context.watch<PlugInformationProvider>().plug!.assignPower
            : context.watch<PlugInformationProvider>().plug!.usedPower /
                context.watch<PlugInformationProvider>().plug!.assignPower;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        title: AppBarText(
          content: name,
        ),
        actions: [
          if (context.read<UserProvider>().isAuthenticated)
            IconButton(
              onPressed: () {
                _stopTimer();
                Navigator.pushNamed(context, '/shop')
                    .then((_) => _startTimer());
              },
              icon: const Icon(
                Icons.coffee,
                size: 40,
              ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: PageEntryButton(
                    content: '사용법을 읽어주세요!',
                    onTap: () {
                      _stopTimer();
                      Navigator.pushNamed(context, '/help')
                          .then((_) => _startTimer());
                    })),
            Container(
              height: 350,
              decoration: BoxDecoration(
                //border: Border.all(color: AppColor.text, width: 1.5),
                color: AppColor.background,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NormalText(content: '플러그 ID: ${widget.plugId}'),
                        BoldText(
                            content: context
                                .read<PlugInformationProvider>()
                                .plug!
                                .plugName),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage('assets/smartPlug.png'),
                            width: 100,
                          ),
                        ),
                        BoldText(
                            content: context
                                    .watch<PlugInformationProvider>()
                                    .plug!
                                    .toggle
                                ? 'On'
                                : 'Off'),
                        CustomSmallButton(
                            content: context
                                    .watch<PlugInformationProvider>()
                                    .plug!
                                    .toggle
                                ? 'Off'
                                : 'On',
                            onPressed: () {
                              if (context
                                  .watch<PlugInformationProvider>()
                                  .plug!
                                  .toggle) {
                                //ApiPlug.patchPlugOff(widget.id);
                              } else {
                                //ApiPlug.patchPlugOn(widget.id);
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        CaptionText(
                          content: context
                              .read<PlugInformationProvider>()
                              .plug!
                              .plugDescription,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: 170,
                              height: 170,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                              ),
                            ),
                            Container(
                              width: 170,
                              height: 170,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CustomPaint(
                                painter: CircularGraphPainter(ratio: fillRatio),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.background,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CaptionText(content: '실시간 전력량'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TitleText(
                                        content:
                                            '${context.watch<PlugInformationProvider>().plug!.realTimePower}'),
                                    const CaptionText(content: ' W'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const NormalText(content: '총 전력량'),
                            const SizedBox(width: 10),
                            BoldText(
                                content:
                                    '${context.watch<PlugInformationProvider>().plug!.assignPower}'),
                            const SizedBox(width: 2),
                            const CaptionText(content: 'Wh'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const NormalText(content: '남은 전력량'),
                            const SizedBox(width: 10),
                            BoldText(
                                content:
                                    '${context.watch<PlugInformationProvider>().plug!.assignPower - context.watch<PlugInformationProvider>().plug!.usedPower}'),
                            const SizedBox(width: 2),
                            const CaptionText(content: 'Wh'),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                            '사용시간 ${context.watch<PlugInformationProvider>().plug!.runningTime}'),
                        Text(
                            '시작시간 ${context.watch<PlugInformationProvider>().plug!.startTime}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PageEntryButton(
              content: '전원이 Off가 되었다면? 여길 클릭!',
              onTap: () {
                _stopTimer();
                Navigator.pushNamed(context, '/alert')
                    .then((_) => _startTimer());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  content: '충전하러 가기',
                  onPressed: () {
                    _stopTimer();
                    Navigator.pushNamed(context, '/pinInput')
                        .then((_) => _startTimer());
                  },
                ),
                CustomButton(
                  content: '사용 종료하기',
                  onPressed: () {
                    if (context.read<UserProvider>().isAuthenticated) {
                      _stopTimer();
                      Navigator.pushNamed(context, '/maileage')
                          .then((_) => _startTimer());
                    } else {
                      _stopTimer();
                      Navigator.pushNamed(context, '/end');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color _getColor(double fillRatio) {
  if (fillRatio >= 0.8) {
    return Colors.red;
  } else if (fillRatio >= 0.6) {
    return Colors.yellow;
  } else {
    return AppColor.main;
  }
}

class CircularGraphPainter extends CustomPainter {
  final double ratio;

  CircularGraphPainter({required this.ratio});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _getColor(ratio)
      ..style = PaintingStyle.fill;

    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * ratio;

    Path path = Path()
      ..moveTo(centerX, centerY)
      ..lineTo(centerX, centerY - radius)
      ..arcTo(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
          startAngle, sweepAngle, false)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
