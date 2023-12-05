import 'package:flutter/material.dart';
import 'package:webclient/models/alert_model.dart';
import 'package:webclient/services/api_service.dart';
import 'package:webclient/services/api_test.dart';

class AlertProvider extends ChangeNotifier {
  List<AlertModel> _alertList = [];
  final bool _test = true;

  List<AlertModel>? get alertList => _alertList;

  void updateAlert(int plugId) async {
    _alertList = await ApiService.getAlertListById(plugId);
    //_alertList = await ApiTest.testGetAlertListByPlugId(plugId);
    notifyListeners();
  }

  void onToggle(int plugId) async {
    if (await ApiService.patchPlugOn(plugId)) {
      updateAlert(plugId);
    } else {}
  }
}
