import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/provider/catalogueProvider.dart';
import 'package:shop0koa_frontend/view/authentication/onboard_screen.dart';
import './view/screens/screens.dart';
import './util.dart';
import './theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Lato");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => CatalogueProvider()),
        ],
        child: MaterialApp(
          scaffoldMessengerKey: messengerKey,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: brightness == Brightness.light ? theme.light() : theme.dark(),
          home: const OnBoardScreen(),
          routes: {
            ProductAnalytics.routeName: (context) => const ProductAnalytics(),
            OrdersPage.routeName: (context) => const OrdersPage(),
            NavigationPage.routeName: (context) => const NavigationPage(),
            AddProduct.routeName: (context) => const AddProduct(isEdit: false),
            SignupPage.routeName: (context) => const SignupPage(),
            LoginPage.routeName: (context) => const LoginPage(),
            ConfirmPin.routeName: (context) => const ConfirmPin(),
            NewPin.routeName: (context) => const NewPin(),
            VerifyBusiness.routeName: (context) => const VerifyBusiness(),
            Started.routeName: (context) => const Started(),
            Withdraw.routeName: (context) => const Withdraw(),
          },
        ));
  }
}
