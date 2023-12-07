import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webclient/models/alert_model.dart';
import 'package:webclient/models/menu_model.dart';
import 'package:webclient/models/plug_detail_model.dart';
import 'package:webclient/models/user_model.dart';

class ApiService {
  static const String baseUrl = 'http://43.202.29.19/api';

  //로그인
  static Future<UserModel> postLogin(String userAccount, String userPw) async {
    final url = Uri.parse('$baseUrl/user/login');
    Map<String, dynamic> data = {
      'userAccount': userAccount,
      'userPw': userPw,
    };
    final body = jsonEncode(data);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    UserModel result = UserModel.fromJson(json['result']);

    return result;
  }

  //회원가입
  static Future<bool> singUp(
      String userAccount, String userName, String userPw) async {
    final url = Uri.parse('$baseUrl/user/signUp');
    Map<String, dynamic> data = {
      'userAccount': userAccount,
      'userName': userName,
      'userPw': userPw,
    };
    final body = jsonEncode(data);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);

    return json['success'];
  }

  //핀 번호 발급
  static Future<int> issuedPinNumber(int cafeId) async {
    final url = Uri.parse('$baseUrl/cafe/$cafeId/pin');
    final response = await http.post(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    final Map<String, dynamic> json = jsonDecode(response.body);

    return json['result']['pinNumber'];
  }

  //플러그 1개 정보
  static Future<PlugDetailModel> getPlugById(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/info');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    final Map<String, dynamic> body = jsonDecode(response.body);

    return PlugDetailModel.fromJson(body['result']);
  }

  //토글 on
  static Future<bool> patchPlugOn(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/turnOn');
    final response = await http.patch(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }

  //토클 off
  static Future<bool> patchPlugOff(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/turnOff');
    final response = await http.patch(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }

  //플러그 고객 사용
  static Future<bool> chargePower(int plugId, int pinNumber) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/use');
    final body = {'pinNumber': pinNumber};
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final Map<String, dynamic> json = jsonDecode(response.body);

    return json['success'];
  }

  //플러그 사용 종료
  static Future<bool> stopService(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/stop');
    final response = await http.patch(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }

  //손님용 웹 플러그 차단 로그 (get)
  static Future<List<AlertModel>> getAlertListById(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/plugOffLog');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic body = jsonDecode(response.body);
    final List<dynamic> alerts = body['result'];
    final List<AlertModel> alertInstance =
        alerts.map((alert) => AlertModel.fromJson(alert)).toList();

    return alertInstance;
  }

  //마일리지 확인
  static Future<int> getMileage(String token, int plugId) async {
    final url = Uri.parse('$baseUrl/mileage?plugId=$plugId');
    final response = await http.get(url, headers: {'Authorization': token});

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['result']['mileage'];
  }

  //마일리지 사용
  static Future<bool> consumeMileage(String token, int menuId) async {
    final url = Uri.parse('$baseUrl/mileage?menuId=$menuId');

    final response = await http.patch(url,
        headers: {'Content-Type': 'application/json', 'Authorization': token});

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }

  //마일리지 부여 테스트
  static Future<bool> testPatchMileage(
      int userId, int cafeId, int mileage) async {
    final url = Uri.parse('$baseUrl/mileage/testGain');
    final body = {
      "userId": userId,
      "cafeId": cafeId,
      "mileage": mileage,
    };

    final response = await http.patch(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }

  //get 사장님 상점 메뉴 리스트
  static Future<List<MenuModel>> getMenuList(int plugId) async {
    final url = Uri.parse('$baseUrl/mileage/menu?plugId=$plugId');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic body = jsonDecode(response.body);
    final List<dynamic> menuList = body['result'];
    final List<MenuModel> menuInstance =
        menuList.map((alert) => MenuModel.fromJson(alert)).toList();

    return menuInstance;
  }
}
