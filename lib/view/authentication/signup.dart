import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/view/account/account.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(Withdraw());
          },
        ),
        title:
            Text("Sign Up", style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 15.0),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: "First Name*",
                              icon: Icon(Icons.person),
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              validator: (value) {},
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomTextField(
                              labelText: 'Last Name*',
                              icon: Icon(Icons.person),
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              validator: (value) {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Business Name*",
                        icon: Icon(Icons.business_outlined),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "License No.*",
                        icon: Icon(Icons.edit_document),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Select Location*",
                        icon: Icon(Icons.location_city),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Email Address",
                        icon: Icon(Icons.email),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Phone Number*",
                        icon: Icon(Icons.phone),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Create Password(Min.8 Char)*",
                        icon: Icon(Icons.visibility),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Repeat Password*",
                        icon: Icon(Icons.visibility),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          child: Text('Sign Up'),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Color(0xFF34C759),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Icon icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String) validator;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.keyboardType,
    required this.obscureText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: icon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

class TextField extends StatelessWidget {
  final String labelText;
  final Icon icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function validator;

  const TextField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.keyboardType,
    required this.obscureText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: icon,
      ),
    );
  }
}
