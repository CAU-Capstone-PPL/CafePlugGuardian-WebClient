import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/models/user_model.dart';
import 'package:webclient/provider/user_provider.dart';
import 'package:webclient/screens/signup_screen.dart';
import 'package:webclient/services/api_service.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userAccountController = TextEditingController();
  final TextEditingController _userPwController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const HeadingText(content: 'Login'),
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
              const HeadingText(content: 'Cafe Plug Guardian'),
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
                controller: _userPwController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CaptionText(content: '아직 회원이 아니신가요?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: const CaptionText(content: '회원가입 하러 가기')),
                ],
              ),
              CustomButton(
                content: 'Login',
                onPressed: () async {
                  try {
                    String userAccount = _userAccountController.text;
                    String userPw = _userPwController.text;
                    UserModel user =
                        await ApiService.postLogin(userAccount, userPw);
                    context.read<UserProvider>().login(user);
                    _userAccountController.clear();
                    _userPwController.clear();
                    Navigator.pushNamed(context, '/pinInput')
                        .then((_) => context.read<UserProvider>().logout());
                  } catch (e) {
                    final errorMessage = e.toString();
                    _showErrorSnackBar(context, errorMessage);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    context.read<UserProvider>().unMemberlogin();
                    Navigator.pushNamed(context, '/pinInput');
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const BoldText(
                    content: '비회원으로 이용할래요',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
