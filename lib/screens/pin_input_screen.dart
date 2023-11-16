import 'dart:math';
import 'package:flutter/material.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

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
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const HeadingText(
          content: '핀 번호를 입력하세요',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Random PIN Number: $_testNumber',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const HeadingText(content: '핀 번호를 입력하시면\n전력량이 충전됩니다'),
              const SizedBox(height: 20.0),
              TextField(
                controller: _pinNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter the PIN number',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      content: '돌아가기',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  CustomButton(content: '충전하기', onPressed: _onNextPressed),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
