import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastX {
  static void showSnackbarError(String message, BuildContext context) {
    //showError(message, context);
    showToastError(message, context);
  }

  static void showSnackbarInfo(String message, BuildContext context) {
    //showInfo(message, context);
    showToastInfo(message, context);
  }

  static void showToastInfo(String message, BuildContext context) {
    Get.snackbar('INFO', message,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(milliseconds: 300),
        duration: Duration(milliseconds: 1000),
        backgroundColor: Theme.of(context).primaryColor,
        titleText: Text('INFO',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        messageText: Text(message,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: Colors.white)),
        borderRadius: 16);
  }

  static void showToastError(String message, BuildContext context) {
    Get.snackbar('ERROR', message,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        duration: Duration(milliseconds: 2000),
        backgroundColor: Theme.of(context).primaryColorDark,
        titleText: Text('ERROR',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        messageText: Text(message,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: Colors.white)),
        borderRadius: 16);
  }
}
