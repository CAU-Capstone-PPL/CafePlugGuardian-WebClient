import 'package:webclient/models/alert_model.dart';
import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/services/data_test.dart';

class ApiTest {
  static Future<PlugDetatilModel> testGetPlugById(int id) async {
    Map<String, dynamic> plugDataById =
        dummyDataPlugDetail.firstWhere((e) => e['plugId'] == id);
    return PlugDetatilModel.fromJson(plugDataById);
  }

  static Future<List<AlertModel>> tsetGetAlertList() async {
    List<AlertModel> alertInstance = [];
    const List<dynamic> alerts = dummyDataAlerts;
    alertInstance = alerts.map((alert) => AlertModel.fromJson(alert)).toList();
    return alertInstance;
  }
}
