import 'package:flutter/material.dart';
import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/models/time_model.dart';
import 'package:webclient/services/api_test.dart';

class PlugInformationProvider extends ChangeNotifier {
  PlugDetatilModel _plug = PlugDetatilModel(
    plugId: 0,
    plugName: '',
    onOff: 'Off',
    plugDescription: '로딩 중...',
    startTime: TimeModel(hours: 0, minutes: 0),
    runningTime: TimeModel(hours: 0, minutes: 0),
    assignPower: 0.0,
    usedPower: 0.0,
    realTimePower: 0.0,
  );
  bool _test = true;

  PlugDetatilModel? get plug => _plug;

  void updatePlug(int id) async {
    if (_test) {
      _plug = await ApiTest.testGetPlugById(id);
      print('updatePlug');
      _test = false;
    } else {
      _plug = await ApiTest.testGetPlugChangedById(id);
      print('updatePlug');
      _test = true;
    }
    notifyListeners();
  }
}
