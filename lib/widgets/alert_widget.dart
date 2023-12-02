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
    return Opacity(
      opacity: isToggleOn == false ? 1 : 0.5,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(10),
          color: AppColor.background,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoldText(content: '비허용 기기가 감지되어 전원을 off합니다.'),
                  NormalText(
                    content: blockingTime,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  check == false
                      ? CustomButton(content: '다시 on', onPressed: () {})
                      : CustomButton(content: '확인 완료', onPressed: () {})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
