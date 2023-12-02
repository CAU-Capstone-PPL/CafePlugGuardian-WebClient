import 'package:webclient/models/date_model.dart';
import 'package:webclient/models/time_model.dart';

class DateTimeModel {
  final DateModel date;
  final TimeModel time;

  DateTimeModel({required this.date, required this.time});

  DateTimeModel.fromJson(Map<String, dynamic> json)
      : date = DateModel.fromJson(json['date']),
        time = TimeModel.fromJson(json['time']);
}
