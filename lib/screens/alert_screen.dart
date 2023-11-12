import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadingText(content: 'Alert')),
      body: const Text('알람 스크린 입니다.'),
    );
  }
}
