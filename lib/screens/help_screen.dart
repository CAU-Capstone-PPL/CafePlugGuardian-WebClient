import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadingText(content: 'Help')),
      body: const Text('도움말 스크린 입니다.'),
    );
  }
}
