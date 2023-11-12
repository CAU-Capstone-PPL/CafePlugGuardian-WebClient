import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class PinInput extends StatelessWidget {
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(content: '핀 입력 스크린'),
      ),
      body: const Text('핀 입력 스크린 입니다.'),
    );
  }
}
