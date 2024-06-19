// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/main.dart';
import 'package:shop0koa_frontend/models/user/register.dart';
import 'package:shop0koa_frontend/models/user/user_model.dart';
import 'package:shop0koa_frontend/repository/authentication.dart';
import 'package:shop0koa_frontend/repository/sharedPreferences.dart';
import 'package:shop0koa_frontend/view/authentication/onboard_screen.dart';
import 'package:shop0koa_frontend/view/authentication/verify.dart';
import 'package:shop0koa_frontend/view/screens/navigation.dart';
import 'package:shop0koa_frontend/view/widgets/common.dart';

class AuthProvider with ChangeNotifier {
  final Auth auth = Auth();

  RegisterUser? _registerUser;
  RegisterUser? get registerUser => _registerUser;

  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController businessAddressController =
      TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessRegistrationNumberController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  Future login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await auth.login(email: email, password: password);
      if (response['status'] == 'success') {
        await getUser(userId: response['user']['id'], context: context);
        _user = UserModel.fromJson(response);
        CommonUtils.showToast('Logged in sucessfully');
        sharedpreferencesStorage.storeToken(_user!.accessToken!);

        Navigator.of(context).pushNamed(NavigationPage.routeName);
      } else {
        CommonUtils.showErrorToast(
            response['message'], 'Check your password and try again');
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future logOut({
    required BuildContext context,
    required String token,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await auth.logOUt(
        token: token,
      );
      if (response['message'] == 'Successfully logged out') {
        CommonUtils.showToast('Logged out sucessfully');
        sharedpreferencesStorage.removeToken();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardScreen()),
        );
        _isLoading = false;
      } else {
        CommonUtils.showErrorToast(response['message'], '');
        _isLoading = false;
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getUser({required int userId, required BuildContext context}) async {
    try {
      notifyListeners();
      var response = await auth.getUser(userId: userId);
      _user = UserModel.fromJson(response);
      if (_user!.accessToken != null) {
      } else {}
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future register({
    required BuildContext context,
    required String gender,
    required String url,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await auth.register(
        businessAddress: businessAddressController.text,
        businessName: businessNameController.text,
        businessRegistrationNumber: businessRegistrationNumberController.text,
        gender: gender,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        url: url,
        email: emailController.text,
        password: passwordController.text,
      );
      print(response['user']['id']);
      if (response['status'] == 'success') {
        await getUser(userId: response['user']['id'], context: context);
        print("gggggggggggg ${user!.user}");
        notifyListeners();
        CommonUtils.showToast('Registered sucessfully');
        navigatorKey.currentState!.pushNamed(VerifyBusiness.routeName);
      } else {
        CommonUtils.showToast(response['message']);
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future verifyBusines({
    required BuildContext context,
    required String kraUrl,
    required String permitUrl,
    required String natinalUrl,
    required int UserId,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await auth.vefiyBusiness(
        kraPin: kraUrl,
        businessPermit: permitUrl,
        natinalId: natinalUrl,
        userId: UserId,
      );
      CommonUtils.showToast('Business send sucessfully');
      Navigator.of(context).pushNamed(NavigationPage.routeName);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
