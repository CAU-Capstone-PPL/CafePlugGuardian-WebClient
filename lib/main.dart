import 'package:flutter/material.dart';
import 'package:webclient/screens/alert_screen.dart';
import 'package:webclient/screens/help_screen.dart';
import 'package:webclient/screens/home_screen.dart';
import 'package:webclient/screens/login_page.dart';
import 'package:webclient/screens/pin_input_screen.dart';
import 'package:webclient/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cafe_plug_guardian_web_client',
      theme: ThemeData(
        fontFamily: 'Gmarket',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.main),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(
              plugId: 1,
            ),
        '/pinInput': (context) => const PinInputScreen(),
        '/alert': (context) => const AlertScreen(),
        '/help': (context) => const HelpScreen(),
      },
    );
  }
}
