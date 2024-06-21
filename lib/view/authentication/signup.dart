import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/provider/fileUploadProvider.dart';
import 'package:shop0koa_frontend/services/firebase.dart';
import 'package:shop0koa_frontend/view/authentication/login.dart';
import 'package:shop0koa_frontend/view/screens/screens.dart';
import 'package:shop0koa_frontend/view/widgets/Vertical_spacing.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'dart:io';

class SignupPage extends StatefulWidget {
  static const routeName = 'signUpPage';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late TapGestureRecognizer _gestureDetector;
  String? imageUrl;
  bool _isMale = false;
  bool _isFemale = false;
  bool _isAgreed = false;
  final Firebase firebase = Firebase();
  String? profileUrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _gestureDetector = TapGestureRecognizer()
      ..onTap = () => Navigator.of(context).pushNamed(LoginPage.routeName);
  }

  Future<void> _pickAndUploadImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      setState(() {
        imageUrl = pickedFile.path;
      });
      final fileUploadProvider =
          Provider.of<FileUploadProvider>(context, listen: false);
      profileUrl = await fileUploadProvider.uploadFile(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "First Name*",
                            controller: authProvider.firstNameController,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              } else if (!RegExp(r'^[a-zA-Z\s]*$')
                                  .hasMatch(value)) {
                                return 'Please enter only characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextField(
                            labelText: 'Last Name*',
                            controller: authProvider.lastNameController,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              } else if (!RegExp(r'^[a-zA-Z\s]*$')
                                  .hasMatch(value)) {
                                return 'Please enter only characters';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: "Business Name*",
                      controller: authProvider.businessNameController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your business name';
                        } else if (!RegExp(r'^[a-zA-Z\s]*$').hasMatch(value)) {
                          return 'Please enter only characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller:
                          authProvider.businessRegistrationNumberController,
                      labelText: "License No.*",
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your license number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select Location',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      items: <String>['Kenya', 'Tanzania', 'Uganda']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        authProvider.businessAddressController.text = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: "Email Address",
                      controller: authProvider.emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: authProvider.phoneNumberController,
                      labelText: "Phone Number*",
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!RegExp(r'^(07|01)\d{8}$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: authProvider.passwordController,
                      labelText: "Create Pin",
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return 'Pin must be 4 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors
                                    .grey), // Adjust border color as needed
                            borderRadius: BorderRadius.circular(
                                50.0), // Adjust border radius as needed
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Text('Male'),
                                  Checkbox(
                                    value: _isMale,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isMale = value!;
                                        _isFemale = !value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const VerticalDivider(color: Colors.black),
                              Row(
                                children: [
                                  const Text('Female'),
                                  Checkbox(
                                    value: _isFemale,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isFemale = value!;
                                        _isMale = !value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Consumer<FileUploadProvider>(
                            builder: (context, fileUploadProvider, child) {
                              return imageUrl != null
                                  ? fileUploadProvider.uploadProgress > 0
                                      ? Column(
                                          children: [
                                            LinearProgressIndicator(
                                                value: fileUploadProvider
                                                    .uploadProgress),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${(fileUploadProvider.uploadProgress * 100).toStringAsFixed(2)}%'),
                                          ],
                                        )
                                      : CircleAvatar(
                                          radius: 50,
                                          backgroundImage: FileImage(
                                            File(imageUrl!),
                                          ),
                                        )
                                  : const Icon(
                                      Icons.person,
                                      size: 80,
                                    );
                            },
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Profile Picture',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () => _pickAndUploadImage(context),
                                child: const Text(
                                  'Upload',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isAgreed,
                          onChanged: (bool? value) {
                            setState(() {
                              _isAgreed = value!;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            'I agree with the terms and conditions',
                            style: TextStyle(
                                fontSize: 14), // Adjust font size as needed
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: authProvider.isLoading
                          ? const Center(
                              child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator()))
                          : CustomButton(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await authProvider.register(
                                    context: context,
                                    gender: _isMale ? "male" : "female",
                                    url: profileUrl ?? '',
                                  );
                                  Navigator.of(context)
                                      .pushNamed(VerifyBusiness.routeName);
                                }
                              },
                              text: "Sign Up",
                            ),
                    ),
                    const VerticalSpacing(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Have an account?',
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(
                            text: 'Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.purple),
                            recognizer: _gestureDetector,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier(true);

  CustomTextField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNotifier,
      builder: (context, value, child) {
        return TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText ? value : false,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffixIcon: obscureText
                ? IconButton(
                    icon:
                        Icon(!value ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => _obscureTextNotifier.value = !value,
                  )
                : null,
          ),
          validator: validator,
        );
      },
    );
  }
}
