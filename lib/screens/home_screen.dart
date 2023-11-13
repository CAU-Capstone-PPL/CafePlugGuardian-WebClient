import 'package:flutter/material.dart';
import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/services/api_test.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';
import 'package:webclient/widgets/page_entry_button_widget.dart';

class HomeScreen extends StatefulWidget {
  final String plugId;
  const HomeScreen({super.key, required this.plugId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PlugDetatilModel> plug;

  @override
  void initState() {
    super.initState();
    plug = ApiTest.testGetPlugById(widget.plugId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const HeadingText(
          content: 'NickName님',
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
                      Navigator.pushNamed(context, '/help');
                    })),
            FutureBuilder(
              future: plug,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.text, width: 1.5),
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
                                children: [
                                  NormalText(
                                      content:
                                          '플러그 ID: ${snapshot.data!.plugId}'),
                                  BoldText(content: snapshot.data!.plugName),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage('assets/smartPlug.png'),
                                      width: 100,
                                    ),
                                  ),
                                  BoldText(content: snapshot.data!.onOff),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.plugDescription,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const NormalText(content: '누적 전력소모량'),
                                  TitleText(
                                      content: '${snapshot.data!.usedPower} W'),
                                  const NormalText(content: '할당된 전력량'),
                                  TitleText(
                                      content:
                                          '${snapshot.data!.assignPower} W'),
                                  const NormalText(content: '현재 전력 소모량'),
                                  TitleText(
                                      content:
                                          '${snapshot.data!.realTimePower} W'),
                                  const NormalText(content: '플러그 사용 시작 시각'),
                                  TitleText(content: snapshot.data!.startTime),
                                  const NormalText(content: '플러그 사용 시간'),
                                  TitleText(
                                      content:
                                          '${snapshot.data!.runningTime} h'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            PageEntryButton(
              content: '전원이 Off가 되었다면? 여길 클릭!',
              onTap: () {
                Navigator.pushNamed(context, '/alert');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  content: '충전하러 가기',
                  onPressed: () {
                    Navigator.pushNamed(context, '/pinInput');
                  },
                ),
                CustomButton(
                  content: '사용 종료하기',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
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

class Button extends StatelessWidget {
  final String content;
  final void Function() onTap;
  const Button({
    super.key,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.center,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.text, width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: AppColor.background,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BoldText(
              content: content,
            ),
          ),
        ),
      ),
    );
  }
}
