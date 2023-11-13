import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final void Function() onPressed;
  const CustomButton({
    super.key,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.main,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 5.0,
          minimumSize: const Size(150, 50),
        ),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }
}
