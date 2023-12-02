import 'package:flutter/material.dart';
import 'package:webclient/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  int? _maileage;

  UserModel? get user => _user;
  int? get mailleage => _maileage;

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
