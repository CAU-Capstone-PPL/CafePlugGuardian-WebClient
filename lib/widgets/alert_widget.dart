import 'package:flutter/material.dart';
import 'package:webclient/models/date_time_model.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class Alert extends StatelessWidget {
  final int plugId;
  final String plugName, type;
  final DateTimeModel plugOffTime;
  final bool ownerCheck, isToggleOn;

  const Alert(
      {super.key,
      required this.plugId,
      required this.plugName,
      required this.type,
      required this.plugOffTime,
      required this.ownerCheck,
      required this.isToggleOn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Opacity(
        opacity: isToggleOn ? 0.5 : 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/$type.png'),
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      type == 'Blocking'
                          ? const BoldText(content: '비허용 기기 연결')
                          : const BoldText(content: '전력량 소진'),
                    ],
                  ),
                  CaptionText(
                      content:
                          '${plugOffTime.date.toString()} ${plugOffTime.time.toString()}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: NormalText(
                        content: type == 'Blocking'
                            ? '현재 연결된 기기가 비허용 기기라서 전력이 차단되었습니다. 연결된 기기를 제거하고 연결 버튼을 눌러주세요.'
                            : '전력량을 모두 소진하셨습니다. 주문을 하셔서 영수증의 핀번호를 입력하여 전력량을 충전하세요.'),
                  ),
                ],
              ),
              type == 'Blocking'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSmallButton(
                            content: '피드백',
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const HeadingText(content: '피드백'),
                                  content: const SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        //추가
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('확인'),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        CustomSmallButton(
                            content: '다시 연결',
                            onPressed: () {
                              //다시 연결
                            })
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomSmallButton(
                            content: '충전',
                            onPressed: () {
                              //충전하는 곳으로 가기
                            })
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
