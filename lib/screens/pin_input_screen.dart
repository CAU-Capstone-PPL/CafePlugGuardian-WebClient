import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webclient/screens/home_screen.dart';
import 'package:webclient/style.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  int _testNumber = 0;
  final TextEditingController _pinNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  void _generateRandomNumber() {
    setState(() {
      _testNumber = Random()
          .nextInt(10000); // Generates a random number between 0 and 9999
    });
  }

  void _onNextPressed() {
    String inputText = _pinNumberController.text;
    bool isTargetPageInStack = false;
    // Check if the target route is in the stack
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).popUntil((route) {
        if (route.settings.name == '/home') {
          isTargetPageInStack = true;
          return true;
        }
        return false;
      });
    }

    if (isTargetPageInStack) {
      Navigator.maybePop(context);
    } else {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Random Number: $_testNumber',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _pinNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter the number',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Button(
                    content: '돌아가기',
                    onTap: () {
                      Navigator.pop(context);
                    }),
                Button(content: '입력', onTap: _onNextPressed),
              ],
            )
          ],
        ),
      ),
    );
  }
}
