import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadingText(content: 'Help')),
      body: const Text('도움말 스크린 입니다.'),
    );
  }
}
