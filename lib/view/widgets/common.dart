import 'package:flutter/material.dart';
import '../../main.dart';

class CommonUtils {
  static showToast(String s, {int delayedTime = 3}) {
    messengerKey.currentState!.showSnackBar(SnackBar(
      content: Text(s),
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 16,
      //   vertical: 20,
      // ),
    ));
  }

  static showErrorToast(String title, String message, {int delayTime = 3}) {
    messengerKey.currentState!.showSnackBar(SnackBar(
      content: Text(title),
      backgroundColor: Colors.red,
    ));
  }
}
