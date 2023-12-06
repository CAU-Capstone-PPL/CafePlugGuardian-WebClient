import 'package:webclient/models/time_model.dart';

class PlugDetailModel {
  int plugId;
  String plugName, plugDescription;
  bool toggle, useStatus;
  TimeModel startTime, runningTime;
  double usedPower, assignPower, realTimePower;

  PlugDetailModel(
      {required this.plugId,
      required this.plugName,
      required this.toggle,
      required this.useStatus,
      required this.plugDescription,
      required this.startTime,
      required this.runningTime,
      required this.assignPower,
      required this.realTimePower,
      required this.usedPower});

  PlugDetailModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        toggle = json['toggle'],
        useStatus = json['useStatus'],
        startTime = TimeModel.fromJson(json['startTime']),
        runningTime = TimeModel.fromJson(json['runningTime']),
        usedPower = json['usedPower'].toDouble(),
        assignPower = json['assignPower'].toDouble(),
        plugDescription = json['plugDescription'],
        realTimePower = json['realTimePower'].toDouble();
}
