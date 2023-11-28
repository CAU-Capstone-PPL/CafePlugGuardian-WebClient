import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/provider/plug_information_provider.dart';
import 'package:webclient/provider/user_provider.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';
import 'package:webclient/widgets/page_entry_button_widget.dart';
import 'package:webclient/widgets/plug_power_info.dart';

class HomeScreen extends StatefulWidget {
  final int plugId;
  const HomeScreen({super.key, required this.plugId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
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
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        title: AppBarText(
          content: context.read<UserProvider>().user?.userName ?? '아무개씨',
        ),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 400,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text, width: 1.5),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                .onOff),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          context
                              .read<PlugInformationProvider>()
                              .plug!
                              .plugDescription,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    PlugPowerInfomattion(
                      assignPower: context
                          .watch<PlugInformationProvider>()
                          .plug!
                          .assignPower,
                      usedPower: context
                          .watch<PlugInformationProvider>()
                          .plug!
                          .usedPower,
                      realTimePower: context
                          .watch<PlugInformationProvider>()
                          .plug!
                          .realTimePower,
                      startTime: context
                          .watch<PlugInformationProvider>()
                          .plug!
                          .startTime
                          .toString(),
                      runningTime: context
                          .watch<PlugInformationProvider>()
                          .plug!
                          .runningTime
                          .toString(),
                    ),
                  ],
                ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
