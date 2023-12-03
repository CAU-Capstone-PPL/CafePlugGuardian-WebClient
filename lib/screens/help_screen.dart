import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          title: const AppBarText(content: '서비스 매뉴얼'),
          backgroundColor: AppColor.background,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(content: '전력량 충전하는 법'),
                NormalText(content: '   1. 충전하러 가기 버튼 클릭'),
                NormalText(content: '   2. 영수증에 출력되어 있는 PIN번호를 입력.'),
                CaptionText(content: '       - PIN번호 유효기간은 1시간이니 유의하시길 바랍니다.'),
                NormalText(content: '   3. 충전하기 버튼 클릭.'),
                BoldText(content: '   그러면 충전 완료!'),
                SizedBox(
                  height: 20,
                ),
                TitleText(content: '사용 도중 플러그가 Off가 되었을 때'),
                NormalText(content: '   원인1) 할당 받은 전력량을 모두 소모한 경우'),
                NormalText(content: '      - 전력량을 재충전한 후 on 버튼 클릭!'),
                NormalText(content: '   원인2) 비허용기기를 꽂아 자동으로 Off된 경우'),
                NormalText(content: '      - 꽂은 기기를 제거하신 후 on 버튼 클릭!'),
                SizedBox(
                  height: 20,
                ),
                TitleText(content: '사용 종료하는 법'),
                NormalText(content: '   "사용 종료하기" 버튼 클릭'),
                CaptionText(content: '      - 회원이시라면 남은 전력량에 따라 마일리지가 적립됩니다.'),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
