import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/models/date_time_model.dart';
import 'package:webclient/provider/alert_provider.dart';
import 'package:webclient/services/api_service.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class Alert extends StatefulWidget {
  final int plugUseId, plugOffLogId, plugId;
  final String plugName, type;
  final DateTimeModel plugOffTime;
  final bool ownerCheck, isToggleOn;

  const Alert(
      {super.key,
      required this.plugId,
      required this.plugOffLogId,
      required this.plugUseId,
      required this.plugName,
      required this.type,
      required this.plugOffTime,
      required this.ownerCheck,
      required this.isToggleOn});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == 'Blocking') {
      return Opacity(
        opacity: widget.isToggleOn ? 0.5 : 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: NotAllowAlert(
              plugId: widget.plugId,
              plugOffTime: widget.plugOffTime,
              plugOffLogId: widget.plugOffLogId,
            ),
          ),
        ),
      );
    }
    return Opacity(
      opacity: widget.ownerCheck ? 0.5 : 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: PowerExhaustAlert(
            plugId: widget.plugId,
            plugOffTime: widget.plugOffTime,
            plugOffLogId: widget.plugOffLogId,
          ),
        ),
      ),
    );
  }
}

class PowerExhaustAlert extends StatelessWidget {
  int plugId;
  DateTimeModel plugOffTime;
  int plugOffLogId;

  PowerExhaustAlert(
      {super.key,
      required this.plugId,
      required this.plugOffTime,
      required this.plugOffLogId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Image(
                  image: AssetImage('assets/PowerLimit.png'),
                  width: 20,
                ),
                SizedBox(width: 10),
                BoldText(content: '전력량 소진'),
              ],
            ),
            CaptionText(
                content:
                    '${plugOffTime.date.toString()} ${plugOffTime.time.toString()}'),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NormalText(
                  content:
                      '전력량을 모두 소진하셨습니다. 주문을 하셔서 영수증의 핀번호를 입력하여 전력량을 충전하세요.'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomSmallButton(
                content: '충전',
                onPressed: () {
                  //충전하는 곳으로 가기
                  try {
                    ApiService.patchCustomerCheck(plugOffLogId);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/pinInput');
                  } catch (e) {
                    final errorMessage = e.toString();
                    _showErrorSnackBar(context, errorMessage);
                  }
                })
          ],
        ),
      ],
    );
  }
}

class NotAllowAlert extends StatelessWidget {
  int plugId;
  DateTimeModel plugOffTime;
  int plugOffLogId;
  NotAllowAlert(
      {super.key,
      required this.plugId,
      required this.plugOffTime,
      required this.plugOffLogId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Image(
                  image: AssetImage('assets/Blocking.png'),
                  width: 20,
                ),
                SizedBox(width: 10),
                BoldText(content: '비허용 기기 연결')
              ],
            ),
            CaptionText(
                content:
                    '${plugOffTime.date.toString()} ${plugOffTime.time.toString()}'),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NormalText(
                  content:
                      '현재 연결된 기기가 비허용 기기라서 전력이 차단되었습니다. 연결된 기기를 제거하고 연결 버튼을 눌러주세요.'),
            ),
          ],
        ),
        Row(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('확인'),
                        ),
                      ],
                    ),
                  );
                }),
            CustomSmallButton(
              content: '다시 연결',
              onPressed: () {
                try {
                  ApiService.patchCustomerCheck(plugOffLogId);
                  ApiService.patchPlugOn(plugId);
                  context.read<AlertProvider>().updateAlert(plugId);
                  Navigator.pop(context);
                } catch (e) {
                  final errorMessage = e.toString();
                  _showErrorSnackBar(context, errorMessage);
                }
              },
            )
          ],
        )
      ],
    );
  }
}

void _showErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    ),
  );
}
