import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.white,
      primaryColorDark: AppColors.black,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: AppColors.black, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.black, fontSize: 18),
        bodyLarge: TextStyle(color: AppColors.black, fontSize: 20),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: AppColors.black
        ),
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.black,),
      ));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.black,
      primaryColorDark: AppColors.white,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: AppColors.white, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.white, fontSize: 18),
        bodyLarge: TextStyle(color: AppColors.white, fontSize: 20),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: AppColors.white
        ),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.black,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.white,),
      ));
}
