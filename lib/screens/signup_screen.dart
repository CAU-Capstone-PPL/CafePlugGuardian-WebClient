import 'package:flutter/material.dart';
import 'package:webclient/services/api_service.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _userAccountController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPwController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const HeadingText(content: 'Sign Up'),
        backgroundColor: AppColor.background,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/smartPlug.png'),
                width: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const HeadingText(content: 'Sign Up'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _userAccountController,
                decoration: const InputDecoration(
                  labelText: 'User Account',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _userNameController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Nickname',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _userPwController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                content: 'Sign Up',
                onPressed: () async {
                  String userAccount = _userAccountController.text;
                  String userPw = _userPwController.text;
                  String userName = _userNameController.text;
                  if (await ApiService.singUp(userAccount, userName, userPw)) {
                    Navigator.pop(context);
                  } else {
                    print('회원가입 오류!');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
