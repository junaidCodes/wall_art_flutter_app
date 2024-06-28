import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  String text;

  VoidCallback onPressed;
  double height;
  double width;
  Color buttonColor;
  Color textColor;
  double fontSize;
  bool loading;

  PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 45,
    this.width = double.infinity, //370,
    this.buttonColor = Colors.amber,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        highlightElevation: 0,
        elevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.5),
            side: const BorderSide(color: Colors.blueAccent)),
        height: height,
        minWidth: width,
        color: buttonColor,
        // splashColor: AppColors.lightGrey,s
        // highlightColor: Colors.red,
        hoverColor: const Color.fromARGB(255, 46, 41, 27),
        onPressed: onPressed,
        child: loading
            ? const CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              )
            : Text(
                text,
                style: GoogleFonts.inter(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: textColor),
              ));
  }
}
