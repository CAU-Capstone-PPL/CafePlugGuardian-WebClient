class AlertModel {
  final String plugName, blockingTime;
  final int plugId;
  final bool check;

  AlertModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        blockingTime = json['blockingTime'],
        check = json['check'];
}
