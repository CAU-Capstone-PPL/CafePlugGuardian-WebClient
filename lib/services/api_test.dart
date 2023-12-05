import 'package:webclient/models/alert_model.dart';
import 'package:webclient/models/menu_model.dart';
import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/services/data_test.dart';

class ApiTest {
  static Future<PlugDetailModel> testGetPlugById(int id) async {
    Map<String, dynamic> plugDataById =
        dummyDataPlugDetail.firstWhere((e) => e['plugId'] == id);
    return PlugDetailModel.fromJson(plugDataById);
  }

  static Future<PlugDetailModel> testGetPlugChangedById(int id) async {
    Map<String, dynamic> plugDataById =
        dummyDataChanged.firstWhere((e) => e['plugId'] == id);
    return PlugDetailModel.fromJson(plugDataById);
  }

  static Future<List<MenuModel>> testGetMenu() async {
    List<MenuModel> menuList =
        cafeMenuData.map((menu) => MenuModel.fromJson(menu)).toList();
    return menuList;
  }

  static Future<List<AlertModel>> testGetAlertListByPlugId(int plugId) async {
    List<AlertModel> alertInstance =
        testGetAlertList.map((alert) => AlertModel.fromJson(alert)).toList();

    return alertInstance;
  }
}
