import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/constants/initial_bindings.dart';
import 'package:shop0koa_frontend/view/authentication/signup.dart';
import 'package:shop0koa_frontend/view/account/account.dart';
import 'package:shop0koa_frontend/view/authentication/verify.dart';
import 'package:shop0koa_frontend/view/product/product.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SignupPage(),
      getPages: [
        // Define your routes here
        GetPage(name: '/', page: () => SignupPage()),
        GetPage(name: '/authentication', page: () => Withdraw()),
        GetPage(name: '/verify', page: () => Business()),
        GetPage(name: '/product', page: () => ProductPage()), // Add this line
      ],
    );
  }
}
