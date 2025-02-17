import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/assets_path.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:shop0koa_frontend/view/screens/home_page.dart';
import 'package:shop0koa_frontend/view/screens/navigation.dart';
import 'package:shop0koa_frontend/view/screens/screens.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'LoginPage';
  const LoginPage({super.key});

  @override
  _ConfirmPinState createState() => _ConfirmPinState();
}

class _ConfirmPinState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TapGestureRecognizer _recognizer;
  String enteredPin = '';
  bool isPinVisible = false;
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _recognizer = TapGestureRecognizer()
      ..onTap = () => Navigator.of(context).pushNamed(SignupPage.routeName);
  }

  /// this widget will be used for each digit
  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.onSecondary),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (enteredPin.length < 4) {
                enteredPin += number.toString();
              }
            });
            if (enteredPin.length == 4) {
              Navigator.of(context).pushNamed(NavigationPage.routeName);
            }
          },
          child: Text(
            number.toString(),
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(
            image: const AssetImage(AssetsPath.logo),
            width: MediaQuery.of(context).size.width - 90,
          ),
          SizedBox(height: size.height * 0.03),
          const Text(
            'Enter PIN to login',
            style: TextStyle(
              fontSize: 20, // Adjust font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isPinVisible = !isPinVisible;
                    });
                  },
                  icon: Icon(
                    isPinVisible ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          /// pin code area
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              4,
              (index) {
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  width: size.width * 0.13,
                  height: size.width * 0.13,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            !isPinVisible ? AppColors.mainColor : Colors.white),
                    borderRadius: BorderRadius.circular(30.0),
                    color: index < enteredPin.length
                        ? isPinVisible
                            ? Colors.green
                            : Colors.white
                        : Colors.white,
                  ),
                  child: Center(
                    child: isPinVisible && index < enteredPin.length
                        ? Text(
                            enteredPin[index],
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : !isPinVisible && index < enteredPin.length
                            ? Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.mainColor,
                                ),
                              )
                            : null,
                  ),
                );
              },
            ),
          ),
          //SizedBox(height: size.height * 0.09),

          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => numButton(1 + 3 * i + index),
                ).toList(),
              ),
            ),

          /// 0 digit with back remove
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                numButton(0),
                IconButton(
                  onPressed: () {
                    if (enteredPin.isEmpty) return;
                    setState(() {
                      enteredPin =
                          enteredPin.substring(0, enteredPin.length - 1);
                    });
                  },
                  icon: Icon(
                    Icons.backspace,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            onTap: () {
              //TODO: make it pushReplacementNamed
              Navigator.of(context).pushNamed(NavigationPage.routeName);
            },
            text: 'Login',
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Have an account?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: 'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.purple),
                  recognizer: _recognizer,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
