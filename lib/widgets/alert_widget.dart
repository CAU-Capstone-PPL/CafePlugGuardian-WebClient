import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class Alert extends StatelessWidget {
  final int plugId;
  final String plugName;
  final String blockingTime;
  const Alert({
    super.key,
    required this.plugId,
    required this.plugName,
    required this.blockingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage('assets/alert.png'),
                    width: 30,
                  ),
                  const Text(
                    '허용하지 않는\n기기연결',
                    style: TextStyle(fontSize: 16),
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text('plugId: $plugId'),
                    Text(plugName),
                    Text(blockingTime),
                  ])
                ],
              ),
              /*Text(
                '$plugName에서 비정상적인 전자기기가 $blockingTime에 감지되었습니다.',
                style: const TextStyle(
                  color: AppColor.text,
                  fontSize: 16,
                ),
              ),*/
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColor.text,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
