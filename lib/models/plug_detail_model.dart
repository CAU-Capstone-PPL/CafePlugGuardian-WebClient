class PlugDetatilModel {
  final String plugName, onOff, startTime, runningTime, plugDescription;

  final int plugId, usedPower, assignPower, realTimePower;

  PlugDetatilModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        onOff = json['onOff'],
        startTime = json['startTime'],
        runningTime = json['runningTime'],
        usedPower = json['usedPower'],
        assignPower = json['assignPower'],
        plugDescription = json['plugDescription'],
        realTimePower = json['realTimePower'];
}
