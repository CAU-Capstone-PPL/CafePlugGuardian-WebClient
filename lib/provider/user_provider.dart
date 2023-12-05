import 'package:flutter/material.dart';
import 'package:webclient/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final int _plugId = 101;
  UserModel? _user;
  int? _maileage;
  bool _isUnMember = true;

  UserModel? get user => _user;
  int? get mailleage => _maileage;
  int get plugId => _plugId;
  bool get isUnMember => _isUnMember;

  bool get isAuthenticated => _user != null;

  void login(UserModel user) {
    _user = user;
    _isUnMember = false;
    notifyListeners();
  }

  void logout() {
    _user = null;
    _isUnMember = true;
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
