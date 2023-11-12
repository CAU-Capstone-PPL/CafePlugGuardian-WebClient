import 'package:flutter/material.dart';
import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/services/api_test.dart';
import 'package:webclient/style.dart';

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
      appBar: AppBar(
        title: const HeadingText(
          content: 'CafeNickName에 오신걸 환영합니다!',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: plug,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingText(content: '플러그 정보'),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 400,
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
          ],
        ),
      ),
    );
  }
}
