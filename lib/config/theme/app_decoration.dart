import '../../core/resources/resources.dart';
import '../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(color: AppColors.gray100);

  static BoxDecoration get fillGray10002 => BoxDecoration(color: AppColors.gray10002);

  static BoxDecoration get fillPrimary => BoxDecoration(color: Get.theme.colorScheme.primary);

  static BoxDecoration get fillWhiteA => BoxDecoration(color: AppColors.white);

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.07),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration get outlineBlack900 => BoxDecoration(
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.1),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(0, 1),
      ),
    ],
  );

  static BoxDecoration get outlineBlack9001 => BoxDecoration(
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.15),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(0, -1),
      ),
    ],
  );

  static BoxDecoration get outlineBlack9002 => BoxDecoration();

  static BoxDecoration get outlineBlack9003 => BoxDecoration();

  static BoxDecoration get outlineBlack9004 => BoxDecoration();

  static BoxDecoration get outlineBlack9005 => BoxDecoration(
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );

  static BoxDecoration get outlineBlueGrayC => BoxDecoration(
    color: Get.theme.colorScheme.primary.withOpacity(0.02),
    boxShadow: [
      BoxShadow(
        color: AppColors.blueGray5000c,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );

  static BoxDecoration get outlineBluegray5000c => BoxDecoration(
    color: AppColors.gray10002,
    boxShadow: [
      BoxShadow(
        color: AppColors.blueGray5000c,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );

  static BoxDecoration get outlineBluegray5000c1 => BoxDecoration(
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.blueGray5000c,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );

  static BoxDecoration get outlineGray => BoxDecoration(
    color: AppColors.white,
    border: Border.all(
      color: AppColors.gray40001,
      width: 1.h,
    ),
  );

  static BoxDecoration get outlineGray200 => BoxDecoration(
    border: Border.all(
      color: AppColors.gray200,
      width: 1.h,
    ),
  );

  static BoxDecoration get outlineGray40001 => BoxDecoration(
    border: Border.all(
      color: AppColors.gray40001,
      width: 1.h,
    ),
  );

  static BoxDecoration get outlinePrimary => BoxDecoration(
    border: Border.all(
      color: Get.theme.colorScheme.primary,
      width: 1.h,
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder20 => BorderRadius.circular(
    20.h,
  );

  static BorderRadius get circleBorder48 => BorderRadius.circular(
    48.h,
  );

  static BorderRadius get circleBorder52 => BorderRadius.circular(
    52.h,
  );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
    10.h,
  );

  static BorderRadius get roundedBorder15 => BorderRadius.circular(
    15.h,
  );

  static BorderRadius get roundedBorder37 => BorderRadius.circular(
    37.h,
  );

  static BorderRadius get roundedBorder5 => BorderRadius.circular(
    5.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
