import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/provider/user_provider.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class MaileageScreen extends StatelessWidget {
  const MaileageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor:
            AppColor.background, // Adjust the color based on your theme
        title: const AppBarText(
          content: '마일리지 적립',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeadingText(
                content:
                    '${context.read<UserProvider>().user!.userName} 님의 마일리지 현황'),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(content: '현재 마일리지:'),
                      HeadingText(content: '120'), // Adjust font size
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(content: '남은 전력량에 따른 마일리지:'),
                      HeadingText(content: '50'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(content: '종료 후 나의 마일리지:'),
                      HeadingText(content: '170'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              content: '적립 후 종료하기',
              onPressed: () {
                // 마일리지 적립 API 연결
                context.read<UserProvider>().logout();
                Navigator.pushNamed(context, '/end');
              },
            ),
          ],
        ),
      ),
    );
  }
}
