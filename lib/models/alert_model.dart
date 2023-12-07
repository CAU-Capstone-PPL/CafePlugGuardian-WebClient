import 'package:webclient/models/date_time_model.dart';

class AlertModel {
  final int plugOffLogId, plugUseId, plugId;
  final String plugName, type;
  final DateTimeModel plugOffTime;
  final bool ownerCheck, isToggleOn;

  AlertModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugOffLogId = json['plugOffLogId'],
        plugUseId = json['plugUseId'],
        plugName = json['plugName'],
        type = json['type'],
        plugOffTime = DateTimeModel.fromJson(json['plugOffTime']),
        ownerCheck = json['ownerCheck'],
        isToggleOn = json['isToggleOn'];
}
