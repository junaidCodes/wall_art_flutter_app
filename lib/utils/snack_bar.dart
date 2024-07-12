import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  void showSnackBar(String message, Color? bgColor, Color? textColor) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
          backgroundColor: bgColor,
          content: Text(
            message,
            style: TextStyle(color: textColor),
          )),
    );
  }

  void unFocus() {
    FocusScope.of(this).unfocus();
  }
}
