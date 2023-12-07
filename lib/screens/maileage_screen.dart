import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/provider/plug_information_provider.dart';
import 'package:webclient/provider/user_provider.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/custom_button_widget.dart';

class MaileageScreen extends StatefulWidget {
  const MaileageScreen({super.key});

  @override
  State<MaileageScreen> createState() => _MaileageScreenState();
}

class _MaileageScreenState extends State<MaileageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText(content: '현재 마일리지:'),
                      HeadingText(
                          content: '${context.read<UserProvider>().mailleage}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText(content: '남은 전력량에 따른 마일리지:'),
                      HeadingText(
                          content:
                              '${(context.read<PlugInformationProvider>().plug.assignPower - context.read<PlugInformationProvider>().plug.usedPower).toInt()}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText(content: '종료 후 나의 마일리지:'),
                      HeadingText(
                          content:
                              '${context.read<UserProvider>().mailleage + (context.read<PlugInformationProvider>().plug.assignPower - context.read<PlugInformationProvider>().plug.usedPower)}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              content: '적립 후 종료하기',
              onPressed: () {
                context.read<UserProvider>().consumeMaileage(context
                        .read<UserProvider>()
                        .mailleage +
                    (context.read<PlugInformationProvider>().plug.assignPower -
                            context
                                .read<PlugInformationProvider>()
                                .plug
                                .usedPower)
                        .toInt());
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
