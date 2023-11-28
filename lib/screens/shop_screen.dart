import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/provider/user_provider.dart';
import 'package:webclient/style.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int maileage = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const AppBarText(
          content: '상점',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.text, width: 1.5),
                color: AppColor.background,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(
                        content:
                            '${context.read<UserProvider>().user!.userName} 님'),
                    const NormalText(content: '사용 가능 하신 마일리지는 '),
                    Row(
                      children: [
                        TitleText(content: '$maileage'),
                        const NormalText(content: ' point입니다.'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
