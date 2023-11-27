import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webclient/models/user_model.dart';

class ApiService {
  static const String baseUrl = 'http://43.202.29.19/api';

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
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Error();
    }
    final dynamic json = jsonDecode(response.body);
    UserModel result = UserModel.fromJson(json['result']);

    return result;
  }

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
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Error();
    }
    final dynamic json = jsonDecode(response.body);

    return json['success'];
  }
}
