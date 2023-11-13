import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const HeadingText(content: 'Login'),
        backgroundColor: AppColor.background,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String userId = _userIdController.text;
                String password = _passwordController.text;
                print('Username: $userId\nPassword: $password');
                Navigator.pushNamed(context, '/pinInput');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.main,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
