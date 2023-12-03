import 'package:webclient/models/time_model.dart';

class PlugDetatilModel {
  int plugId;
  String plugName, plugDescription;
  bool toggle, useStatus;
  TimeModel startTime, runningTime;
  double usedPower, assignPower, realTimePower;

  PlugDetatilModel(
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

  PlugDetatilModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        toggle = json['toggle'],
        useStatus = json['useStatus'],
        startTime = TimeModel.fromJson(json['startTime']),
        runningTime = TimeModel.fromJson(json['runningTime']),
        usedPower = json['usedPower'],
        assignPower = json['assignPower'],
        plugDescription = json['plugDescription'],
        realTimePower = json['realTimePower'];
}
