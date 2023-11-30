import 'package:flutter/material.dart';
import 'package:webclient/services/api_service.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  late final _pinNumber;
  final TextEditingController _pinNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pinNumber = ApiService.issuedPinNumber(1);
  }

  void _onNextPressed() async {
    int pinNumber = int.parse(_pinNumberController.text);
    try {
      if (await ApiService.chargePower(1, pinNumber)) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      final errorMessage = e.toString();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const HeadingText(content: 'Error'),
          content: BoldText(content: errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
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
              children: [
                FutureBuilder(
                  future: _pinNumber,
                  builder: (context, snapshot) =>
                      BoldText(content: '${snapshot.data}'),
                ),
                const SizedBox(
                  height: 40,
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
      ),
    );
  }
}
