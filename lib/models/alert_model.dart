import 'package:webclient/models/date_time_model.dart';

class AlertModel {
  final int plugId;
  final String plugName, type;
  final DateTimeModel plugOffTime;
  final bool ownerCheck, isToggleOn;

  AlertModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        type = json['type'],
        plugOffTime = DateTimeModel.fromJson(json['plugOffTime']),
        ownerCheck = json['ownerCheck'],
        isToggleOn = json['isToggleOn'];
}
