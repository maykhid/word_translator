import 'package:flutter/material.dart'
    show Colors, Text, ScaffoldMessenger, SnackBar, BuildContext;
import 'package:fluttertoast/fluttertoast.dart';

class Notifiers {
  static void showSnackbar(
      {required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.purple,
      ),
    );
  }

  static void showToast(String text, [Toast? toastLength]) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: toastLength,
      textColor: Colors.white,
      backgroundColor: Colors.purple,
    );
  }
}
