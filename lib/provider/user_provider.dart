import 'package:flutter/material.dart';
import 'package:webclient/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final int _plugId = 101;
  UserModel? _user;
  int? _maileage;

  UserModel? get user => _user;
  int? get mailleage => _maileage;
  int get plugId => plugId;

  bool get isAuthenticated => _user != null;

  void login(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  void updateMaileage(int num) {
    _maileage = num;
    notifyListeners();
  }

  void getMaileage() {
    _maileage = 300;
    notifyListeners();
  }
}
