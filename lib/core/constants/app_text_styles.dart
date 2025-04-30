import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const extraSmallPinkUnderline = TextStyle(
    fontSize: 10,
    color: Colors.pinkAccent,
    decoration: TextDecoration.underline,
  );



  static final extraSmallGreyRegular = GoogleFonts.poppins(
      fontSize: 12,
      color: AppColors.textWhite,
      fontWeight: FontWeight.bold
  );


  static final extraSmallBlueUnderlineRegular = GoogleFonts.poppins(
    fontSize: 10,
    color: AppColors.blue,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.textGrey,
    decorationThickness: 0,              // Controls underline thickness
    height: 1.8,
    // height: 1.5,
  );

  static final extraSmallBlackBold = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
  );

  static final extraSmallBlackRegular = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textBlack,
  );

  static final headingBlack = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static final subHeadingBlack = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static final bodyBlack = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.textBlack,
  );

  static final extraSmallWhite = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textBlack,
  );

  static final headingWhite = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  static final subHeadingWhite = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static final bodyWhite = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.textWhite,
  );

  static final iconStyle = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.textWhite,
  );

}
