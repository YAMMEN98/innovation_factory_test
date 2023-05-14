import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovation_factory_test/src/core/styles/app_text_style.dart';

import 'app_colors.dart';

/// Light theme
final ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    // shadowColor: AppColors.lightGray,
    color: AppColors.white,
    elevation: 2,
    toolbarTextStyle: TextTheme(
      titleLarge: AppTextStyle.textStyleBlack14,
    ).titleLarge,
    titleTextStyle: TextTheme(
      titleLarge: AppTextStyle.textStyleBlack14,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  fontFamily: GoogleFonts.montserrat().fontFamily,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  iconTheme: const IconThemeData(color: AppColors.black, size: 25),
  textTheme: TextTheme(
    headlineLarge: AppTextStyle.textStyleBlack30,
    displayMedium: AppTextStyle.textStyleBlack28,
    headlineMedium: AppTextStyle.textStyleBlack24,
    headlineSmall: AppTextStyle.textStyleBlack20,
    titleLarge: AppTextStyle.textStyleBlack14,
    titleMedium: AppTextStyle.textStyleBlack13,
    titleSmall: AppTextStyle.textStyleBlack12,
    bodyLarge: AppTextStyle.textStyleBlack18,
    bodyMedium: AppTextStyle.textStyleBlack16,
    bodySmall: AppTextStyle.textStyleBlack14,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
    ),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10.sp,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.white, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.white, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.white, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.red, width: 1),
    ),
    errorMaxLines: 10,
    errorStyle: AppTextStyle.textStyleBlack13.copyWith(
      color: AppColors.red,
      fontWeight: FontWeight.normal,
    ),
  ),
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  appBarTheme: AppBarTheme(
    shadowColor: AppColors.white,
    color: AppColors.grayColor,
    elevation: 0,
    toolbarTextStyle: TextTheme(
      titleLarge: AppTextStyle.textStyleWhite14,
    ).bodyLarge,
    titleTextStyle: TextTheme(
      titleLarge: AppTextStyle.textStyleWhite14,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  fontFamily: GoogleFonts.montserrat().fontFamily,
  scaffoldBackgroundColor: AppColors.darkFontColor,
  iconTheme: const IconThemeData(color: AppColors.white, size: 25),
  textTheme: TextTheme(
    headlineLarge: AppTextStyle.textStyleWhite30,
    displayMedium: AppTextStyle.textStyleWhite28,
    headlineMedium: AppTextStyle.textStyleWhite24,
    headlineSmall: AppTextStyle.textStyleWhite20,
    titleLarge: AppTextStyle.textStyleWhite14,
    titleMedium: AppTextStyle.textStyleWhite13,
    titleSmall: AppTextStyle.textStyleWhite12,
    bodyLarge: AppTextStyle.textStyleWhite18,
    bodyMedium: AppTextStyle.textStyleWhite16,
    bodySmall: AppTextStyle.textStyleWhite14,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: 50.w,
        vertical: 12.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10.w,
    ),
    filled: true,
    fillColor: AppColors.grayColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.grayColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.grayColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.grayColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.sp),
      borderSide: const BorderSide(color: AppColors.red, width: 1),
    ),
    errorMaxLines: 10,
    errorStyle: AppTextStyle.textStyleWhite13.copyWith(
      color: AppColors.red,
      fontWeight: FontWeight.normal,
    ),
  ),
);
