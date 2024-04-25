import 'package:chat_gpt_app/utils/appcolors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Raleway',
    colorScheme: const ColorScheme.dark(
      primary: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.secondary,
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.fadedWhite,
  );
  static final lightTheme = ThemeData(
    fontFamily: 'Raleway',
    colorScheme: const ColorScheme.light(primary: AppColors.black),
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.fadedBlack,
  );
}
