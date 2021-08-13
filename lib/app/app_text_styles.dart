import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle textWhite(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textBlack(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.black,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textPrimary(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.primary,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textDarkPrimary(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.darkPrimary,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textAccent(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.accent,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textSemiWhite(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textSemiBlack(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.black,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textSemiPrimary(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.primary,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textSemiDarkPrimary(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.darkPrimary,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textSemiAccent(double fontSize) {
    return GoogleFonts.notoSans(
      color: AppColors.accent,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }
}
