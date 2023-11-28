import 'package:webclient/models/time_model.dart';

class PlugDetatilModel {
  String plugName, onOff, plugDescription;
  TimeModel startTime, runningTime;
  int plugId;
  double usedPower, assignPower, realTimePower;

  PlugDetatilModel(
      {required this.plugId,
      required this.plugName,
      required this.onOff,
      required this.plugDescription,
      required this.startTime,
      required this.runningTime,
      required this.assignPower,
      required this.realTimePower,
      required this.usedPower});

  PlugDetatilModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        onOff = json['onOff'],
        startTime = TimeModel.fromJson(json['startTime']),
        runningTime = TimeModel.fromJson(json['runningTime']),
        usedPower = json['usedPower'],
        assignPower = json['assignPower'],
        plugDescription = json['plugDescription'],
        realTimePower = json['realTimePower'];
}
