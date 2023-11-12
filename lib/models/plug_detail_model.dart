class PlugDetatilModel {
  final String plugId,
      plugName,
      onOff,
      startTime,
      runningTime,
      usedPower,
      assignPower,
      plugDescription,
      realTimePower;

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
