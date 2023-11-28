import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class PlugPowerInfomattion extends StatelessWidget {
  double assignPower, usedPower, realTimePower;
  String startTime, runningTime;

  PlugPowerInfomattion({
    super.key,
    required this.assignPower,
    required this.usedPower,
    required this.realTimePower,
    required this.startTime,
    required this.runningTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const NormalText(content: '사용 가능 전력량'),
        TitleText(content: '${assignPower - usedPower} Wh'),
        const NormalText(content: '할당 전력량'),
        TitleText(content: '$assignPower Wh'),
        const NormalText(content: '누적 전력소모량'),
        TitleText(content: '$usedPower Wh'),
        const NormalText(content: '실시간 전력 소모량'),
        TitleText(content: '$realTimePower W'),
        const NormalText(content: '플러그 사용 시작 시각'),
        TitleText(content: startTime),
        const NormalText(content: '플러그 사용 시간'),
        TitleText(content: '$runningTime h'),
      ],
    );
  }
}
