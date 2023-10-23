import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilityToast {
  void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red.withOpacity(0.7),
      textColor: Colors.white,
      timeInSecForIosWeb: 10,
      webBgColor: "linear-gradient(to right, #f52525, #f52525)",
      webPosition: "left",
    );
  }

	void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green.withOpacity(0.7),
      textColor: Colors.white,
      timeInSecForIosWeb: 5,
      webBgColor: "linear-gradient(to right, #00b16b, #00b16b)",
      webPosition: "left",
    );
  }
}