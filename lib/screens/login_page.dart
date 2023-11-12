import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadingText(content: 'Login')),
      body: const Text('로그인 스크린 입니다.'),
    );
  }
}
