import '../../core/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/resources/resources.dart';

ThemeData get getLightTheme => lightTheme();

ThemeData lightTheme() {
  bool isAr = true;

  return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.white,
      canvasColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
        secondaryContainer: AppColors.secondary,
        surfaceTint: Colors.white,
        onPrimary: AppColors.textPrimary,
        onPrimaryContainer: AppColors.textSecondary,
      ),

      /// Badge
      badgeTheme: const BadgeThemeData(backgroundColor: AppColors.black),

      /// Bottom sheet
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.white),

      /// Slider theme
      sliderTheme: const SliderThemeData(trackHeight: 1, valueIndicatorColor: AppColors.gray200),

      /// Appbar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: AppSize.s0,
        scrolledUnderElevation: AppSize.s0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),

      /// Tabbar theme
      // tabBarTheme: TabBarTheme(
      //   indicatorColor: AppColors.primary,
      //   indicatorSize: TabBarIndicatorSize.tab,
      //   unselectedLabelColor: AppColors.unselectedTab,
      //   unselectedLabelStyle: TextStyle(
      //     fontWeight: FontWeightManager.regular,
      //     fontSize: FontSize.s14,
      //     fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
      //   ),
      //   labelColor: AppColors.black,
      //   labelStyle: TextStyle(
      //     fontWeight: FontWeightManager.regular,
      //     fontSize: FontSize.s14,
      //     fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
      //   ),
      // ),

      /// Divider theme
      // dividerColor: AppColors.divider,

      /// Progress indicator theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary),

      /// Icon theme
      iconTheme: const IconThemeData(color: AppColors.black),

      /// Divider theme
      dividerTheme: const DividerThemeData(thickness: 1, space: 1, color: AppColors.gray100),

      /// Text theme
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.regular,
        ),
        bodyMedium: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.regular,
        ),
        bodySmall: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.regular,
        ),
        displayMedium: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s40,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.bold,
        ),
        headlineLarge: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s32,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s26,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.bold,
        ),
        headlineSmall: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s24,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.bold,
        ),
        labelLarge: TextStyle(
          color: AppColors.primary,
          fontSize: FontSize.s12,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.bold,
        ),
        labelMedium: TextStyle(
          color: AppColors.primary,
          fontSize: FontSize.s10,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: FontSize.s20,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.regular,
        ),
        titleMedium: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s16,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.bold,
        ),
        titleSmall: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.englishFontFamily,
          fontWeight: FontWeightManager.medium,
        ),
      ),

      /// Text fields
      inputDecorationTheme: InputDecorationTheme(
        iconColor: AppColors.black,
        labelStyle: TextStyle(
          color: AppColors.black,
          fontSize: FontSize.s12,
          fontWeight: FontWeightManager.medium,
          fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        ),
        hintStyle: TextStyle(
          color: AppColors.textFieldBorder,
          fontSize: FontSize.s14,
          height: 1,
          fontWeight: FontWeightManager.regular,
          fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        ),
        contentPadding: const EdgeInsets.all(AppPadding.p10),
        errorStyle: TextStyle(
          fontSize: FontSize.s10,
          color: AppColors.error,
          fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        ),
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textFieldBorder, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textFieldBorder, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ));
}
