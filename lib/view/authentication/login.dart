// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/view/authentication/Pendingpage.dart';
import 'package:shop0koa_frontend/view/authentication/signup.dart';
import 'package:shop0koa_frontend/view/authentication/verify.dart';
import 'package:shop0koa_frontend/view/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'LoginPage';

  LoginPage({super.key});
  GlobalKey<FormState> signInformKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: signInformKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Enter email',
                    obscureText: false,
                    field: 'Email',
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: paswordController,
                    hintText: 'Enter Password',
                    obscureText: true,
                    field: 'Password',
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  authProvider.isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          child: ElevatedButton(
                            onPressed: () {
                              authProvider.login(
                                email: emailController.text,
                                password: paswordController.text,
                                context: context,
                              );
                            },
                            child: const Text('Login'),
                          ),
                        ),

                  const SizedBox(height: 20),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //         onTap: null,
                  //         child: const SquareTile(
                  //             imagePath: AssetsPath.googleLogo)),
                  //     const SizedBox(width: 25),
                  //     const SquareTile(imagePath: AssetsPath.appleLogo)
                  //   ],
                  // ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(SignupPage.routeName),
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
