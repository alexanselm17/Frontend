import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/constants/initial_bindings.dart';
import 'package:shop0koa_frontend/view/authentication/onboard_screen.dart';
import 'package:shop0koa_frontend/view/screens/navigation.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const NavigationPage(),
      routes: const {},
    );
  }
}
