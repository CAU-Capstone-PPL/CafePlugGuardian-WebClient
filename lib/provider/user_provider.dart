import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webclient/models/user_model.dart';
import 'package:webclient/services/api_service.dart';

class UserProvider extends ChangeNotifier {
  int? _plugId;
  UserModel? _user;
  int _maileage = 0;
  //bool _isUnMember = false;
  bool _isUnUser = true;
  String? _unMemberName;

  UserModel? get user => _user;
  int get mailleage => _maileage;
  int? get plugId => _plugId;
  //bool get isUnMember => _isUnMember;
  bool get isUnUser => _isUnUser;
  bool get isAuthenticated => _user != null;
  String? get unMemberName => _unMemberName;

  void login(UserModel user) {
    _user = user;
    //_isUnMember = false;
    _isUnUser = false;
    notifyListeners();
  }

  void unMemberlogin() {
    //비회원
    _isUnUser = false;
    Random random = Random();
    _unMemberName = '손님 ${random.nextInt(9999) + 1}';
    notifyListeners();
  }

  void logout() {
    _user = null;
    _isUnUser = false;
    _unMemberName = null;
    notifyListeners();
  }

  void getMaileage() async {
    _maileage = await ApiService.getMileage(_user!.token, 1);
    notifyListeners();
  }

  void consumeMileage(int menuId) async {
    if (await ApiService.consumeMileage(_user!.token, menuId)) {
      getMaileage();
    } else {
      print('마일리지 연동 실패');
    }
    notifyListeners();
  }

  void gainMileage() async {
    if (await ApiService.testPatchMileage(_user!.userId, 1, 100)) {
      getMaileage();
    } else {
      print('마일리지 추가 실패');
    }
  }

  /*void updatePlugId(int plugId) {
    _plugId = plugId;
    notifyListeners();
  }*/
}
