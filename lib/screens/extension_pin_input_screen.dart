import 'package:flutter/material.dart';
import 'package:webclient/services/api_service.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class ExtensionPinInputScreen extends StatefulWidget {
  const ExtensionPinInputScreen({super.key});

  @override
  State<ExtensionPinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<ExtensionPinInputScreen> {
  int _pinNumber = 0;
  final TextEditingController _pinNumberController = TextEditingController();
  final TextEditingController _countController = TextEditingController();

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

  void _onNextPressed() async {
    String pinString = _pinNumberController.text.trim();
    if (pinString.isEmpty) {
      _showErrorSnackBar(context, 'Please enter a pin number.');
      return;
    } else if (!RegExp(r'^[0-9]+$').hasMatch(pinString)) {
      _showErrorSnackBar(context, 'Please enter a valid number.');
      return;
    }
    int pinNumber = int.parse(pinString);
    try {
      if (await ApiService.extendChargePower(1, pinNumber)) {
        Navigator.pop(context);
      }
    } catch (e) {
      final errorMessage = e.toString();
      _showErrorSnackBar(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        title: const HeadingText(
          content: '핀 번호를 입력하세요',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _countController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: '메뉴 개수',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(12.0),
                        ),
                      ),
                    ),
                    CustomButton(
                        content: '발급',
                        onPressed: () async {
                          String countString = _countController.text.trim();
                          if (countString.isEmpty) {
                            _showErrorSnackBar(
                                context, 'Please enter a count.');
                            return;
                          } else if (!RegExp(r'^[0-9]+$')
                              .hasMatch(countString)) {
                            _showErrorSnackBar(
                                context, 'Please enter a valid number.');
                            return;
                          }
                          int count = int.parse(countString);
                          try {
                            _pinNumber =
                                await ApiService.issuedPinNumber(1, count);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Generated Pin: $_pinNumber')),
                            );
                          } catch (e) {
                            final errorMessage = e.toString();
                            _showErrorSnackBar(context, errorMessage);
                          }
                        }),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(height: 20.0),
                const HeadingText(
                    content: '주문하시고 영수증에 출력된\n핀 번호를 입력하시면\n전력량이 충전됩니다'),
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
      ),
    );
  }
}
