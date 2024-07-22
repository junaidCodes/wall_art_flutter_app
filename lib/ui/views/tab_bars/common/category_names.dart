import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/ui/views/on_boarding/common/text_button.dart';
import 'package:wall_art/utils/app_colors.dart';

Widget categoryNames(String title, String sub, void Function() onPress) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.whiteColor),
        ),
        TexttButton(
            googleFonts: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400),
            text: sub,
            onPressed: onPress)
      ],
    ),
  );
}
