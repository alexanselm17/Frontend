import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonUtils {
  static showToast(String s, {int delayedTime = 3}) {
    Get.showSnackbar(
      GetSnackBar(
        message: s,
        duration: Duration(seconds: delayedTime),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        borderRadius: 8.0,
      ),
    );
  }

  static showErrorToast(String tittle, String message, {int delayTime = 3}) {
    Get.snackbar(
      tittle,
      message,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      duration: Duration(seconds: delayTime),
      isDismissible: false,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
