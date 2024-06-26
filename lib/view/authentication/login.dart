// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/view/authentication/signup.dart';
import 'package:shop0koa_frontend/view/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'LoginPage';

  LoginPage({super.key});
  GlobalKey<FormState> signInformKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);

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
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 10),

                  // password textfield with validator for no more than 4 digits
                  MyTextField(
                    controller: paswordController,
                    keyboardType: TextInputType.number,
                    hintText: 'Enter Password',
                    obscureText: true,
                    field: 'Password',
                    validator: (value) {
                      if (value != null && value.length > 4) {
                        return 'Password cannot be more than 4 digits';
                      }
                      return null;
                    },
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

                  const SizedBox(height: 20),
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
