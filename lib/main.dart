import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/view/authentication/onboard_screen.dart';
import './view/screens/screens.dart';
import './util.dart';
import './theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Lato");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const OnBoardScreen(),
      routes: {
        ProductAnalytics.routeName: (context) => const ProductAnalytics(),
        OrdersPage.routeName: (context) => const OrdersPage(),
        NavigationPage.routeName: (context) => const NavigationPage(),
        AddProduct.routeName: (context) => const AddProduct(),
        SignupPage.routeName: (context) => const SignupPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        ConfirmPin.routeName: (context) => const ConfirmPin(),
        NewPin.routeName: (context) => const NewPin(),
        VerifyBusiness.routeName: (context) => const VerifyBusiness(),
        Started.routeName: (context) => const Started(),
      },
    );
  }
}
