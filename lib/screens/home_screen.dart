import 'package:flutter/material.dart';
import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/services/api_test.dart';
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
                          height: 350,
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  CaptionText(
                                    content: snapshot.data!.plugDescription,
                                  ),
                                ],
                              ),
                              PlugPowerInfo(
                                  assignPower: snapshot.data!.assignPower,
                                  usedPower: snapshot.data!.usedPower,
                                  realTimePower: snapshot.data!.realTimePower,
                                  startTime: snapshot.data!.startTime,
                                  runningTime: snapshot.data!.runningTime),
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
