import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/view/authentication/signup.dart';
import 'package:shop0koa_frontend/view/authentication/login_page.dart';

class Started extends StatelessWidget {
  const Started({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset('assets/images/logo.png',
                    height: 200, width: 200),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF30BA53),
              ),
              onPressed: () {
                Get.to(() => SignupPage()); // Navigate to Sign Up page
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF30BA53),
              ),
              onPressed: () {
                Get.to(() => const LoginPage()); // Navigate to Login page
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
