import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/services/data_test.dart';

class ApiTest {
  static Future<PlugDetatilModel> testGetPlugById(String id) async {
    Map<String, dynamic> plugDataById =
        dummyDataPlugDetail.firstWhere((e) => e['plugId'] == id);
    return PlugDetatilModel.fromJson(plugDataById);
  }
}
