import 'package:flutter/material.dart';

import '../../core/resources/resources.dart';
import 'light_theme.dart';

class CustomTextStyles {
  // Body style
  static get bodyLargeCairo => getLightTheme.textTheme.bodyLarge!.cairo;

  static get bodyLargeWhiteA700 => getLightTheme.textTheme.bodyLarge!.copyWith(color: AppColors.white);

  static get bodyMediumCairo => getLightTheme.textTheme.bodyMedium!.cairo;

  static get bodyMediumCairoGray40001 => getLightTheme.textTheme.bodyMedium!.cairo.copyWith(color: AppColors.gray40001);

  static get bodyMediumDMSans => getLightTheme.textTheme.bodyMedium!.dMSans;

  static get bodyMediumGray40001 => getLightTheme.textTheme.bodyMedium!.copyWith(color: AppColors.gray40001);

  static get bodyMediumGray60001 => getLightTheme.textTheme.bodyMedium!.copyWith(color: AppColors.gray60001);

  static get bodyMediumLight => getLightTheme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.semiBold);

  static get bodyMediumPrimary =>
      getLightTheme.textTheme.bodyMedium!.copyWith(color: getLightTheme.colorScheme.primary);

  static get bodyMediumWhiteA700 => getLightTheme.textTheme.bodyMedium!.copyWith(color: AppColors.white);

  static get bodySmall9 => getLightTheme.textTheme.bodySmall!.copyWith(fontSize: FontSize.s9);

  static get bodySmallCairo => getLightTheme.textTheme.bodySmall!.cairo;

  static get bodySmallGray600 =>
      getLightTheme.textTheme.bodySmall!.copyWith(color: AppColors.gray600, fontSize: FontSize.s10);

  static get bodySmallGray60001 => getLightTheme.textTheme.bodySmall!.copyWith(color: AppColors.gray60001);

  // Headline style
  static get headlineSmall_1 => getLightTheme.textTheme.headlineSmall!;

  // Inter text style
  static get interWhiteA700 =>
      const TextStyle(color: AppColors.white, fontSize: FontSize.s4, fontWeight: FontWeight.w400).inter;

  // Label text style
  static get labelLargeBlack900 =>
      getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.black.withOpacity(0.56));

  static get labelLargeBlack900Medium =>
      getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.black, fontWeight: FontWeightManager.medium);

  static get labelLargeBlack900SemiBold =>
      getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.black, fontWeight: FontWeightManager.semiBold);

  static get labelLargeBlack900_1 => getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.black);

  static get labelLargeCairo => getLightTheme.textTheme.labelLarge!.cairo;

  static get labelLargeCairoBlack900 => getLightTheme.textTheme.labelLarge!.cairo.copyWith(color: AppColors.black);

  static get labelLargeCairoGray40002 => getLightTheme.textTheme.labelLarge!.cairo.copyWith(color: AppColors.gray40002);

  static get labelLargeCairoGray500 => getLightTheme.textTheme.labelLarge!.cairo
      .copyWith(color: AppColors.gray500, fontWeight: FontWeightManager.medium);

  static get labelLargeCairo_1 => getLightTheme.textTheme.labelLarge!.cairo;

  static get labelLargeDMSansBlack900 => getLightTheme.textTheme.labelLarge!.dMSans.copyWith(color: AppColors.black);

  static get labelLargeGray40001 =>
      getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.gray40001, fontWeight: FontWeightManager.medium);

  static get labelLargeGray40002 => getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.gray40002);

  static get labelLargeGray50 => getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.gray50);

  static get labelLargeGray600 =>
      getLightTheme.textTheme.labelLarge!.copyWith(color: AppColors.gray600, fontWeight: FontWeightManager.medium);

  static get labelLargeSemiBold => getLightTheme.textTheme.labelLarge!.copyWith(fontWeight: FontWeightManager.semiBold);

  static get labelMediumAmber400 => getLightTheme.textTheme.labelMedium!.copyWith(color: AppColors.amber400);

  static get labelMediumBlack900 => getLightTheme.textTheme.labelMedium!
      .copyWith(color: AppColors.black, fontSize: FontSize.s11, fontWeight: FontWeightManager.medium);

  static get labelMediumBlack900Medium => getLightTheme.textTheme.labelMedium!
      .copyWith(color: AppColors.black, fontSize: FontSize.s11, fontWeight: FontWeightManager.medium);

  static get labelMediumCairoGray600 => getLightTheme.textTheme.labelMedium!.cairo
      .copyWith(color: AppColors.gray600, fontWeight: FontWeightManager.medium);

  static get labelMediumMedium =>
      getLightTheme.textTheme.labelMedium!.copyWith(fontSize: FontSize.s11, fontWeight: FontWeightManager.medium);

  static get labelMediumRedA700 => getLightTheme.textTheme.labelMedium!.copyWith(color: AppColors.redA700);

  // Title text style
  static get titleLargeBlack900 => getLightTheme.textTheme.titleLarge!
      .copyWith(color: AppColors.black, fontSize: FontSize.s22, fontWeight: FontWeightManager.bold);

  static get titleLargeCairoBlack900 => getLightTheme.textTheme.titleLarge!.cairo
      .copyWith(color: AppColors.black, fontSize: FontSize.s22, fontWeight: FontWeightManager.bold);

  static get titleMediumMedium => getLightTheme.textTheme.titleMedium!.copyWith(fontWeight: FontWeightManager.medium);

  static get titleMediumPrimary =>
      getLightTheme.textTheme.titleMedium!.copyWith(color: getLightTheme.colorScheme.primary);

  static get titleMediumPrimarySemiBold => getLightTheme.textTheme.titleMedium!
      .copyWith(color: getLightTheme.colorScheme.primary, fontWeight: FontWeightManager.semiBold);

  static get titleMediumRedA700 =>
      getLightTheme.textTheme.titleMedium!.copyWith(color: AppColors.redA700, fontWeight: FontWeightManager.semiBold);

  static get titleMediumSemiBold =>
      getLightTheme.textTheme.titleMedium!.copyWith(fontWeight: FontWeightManager.semiBold);

  static get titleMediumSemiBold_1 =>
      getLightTheme.textTheme.titleMedium!.copyWith(fontWeight: FontWeightManager.semiBold);

  static get titleMediumWhiteA700 => getLightTheme.textTheme.titleMedium!.copyWith(color: AppColors.white);

  static get titleMedium_1 => getLightTheme.textTheme.titleMedium!;

  static get titleSmallBold => getLightTheme.textTheme.titleSmall!.copyWith(fontWeight: FontWeightManager.bold);

  static get titleSmallCairo => getLightTheme.textTheme.titleSmall!.cairo.copyWith(fontWeight: FontWeightManager.bold);

  static get titleSmallCairoBold =>
      getLightTheme.textTheme.titleSmall!.cairo.copyWith(fontWeight: FontWeightManager.bold);

  static get titleSmallCairoPrimary => getLightTheme.textTheme.titleSmall!.cairo
      .copyWith(color: getLightTheme.colorScheme.primary, fontWeight: FontWeightManager.bold);

  static get titleSmallCairoRedA700 => getLightTheme.textTheme.titleSmall!.cairo
      .copyWith(color: AppColors.redA700, fontWeight: FontWeightManager.semiBold);

  static get titleSmallPrimary => getLightTheme.textTheme.titleSmall!
      .copyWith(color: getLightTheme.colorScheme.primary, fontWeight: FontWeightManager.bold);

  static get titleSmallPrimaryBold => getLightTheme.textTheme.titleSmall!
      .copyWith(color: getLightTheme.colorScheme.primary, fontWeight: FontWeightManager.bold);

  static get titleSmallPrimary_1 =>
      getLightTheme.textTheme.titleSmall!.copyWith(color: getLightTheme.colorScheme.primary);

  static get titleSmallSemiBold => getLightTheme.textTheme.titleSmall!.copyWith(fontWeight: FontWeightManager.semiBold);

  static get titleSmallWhiteA700 =>
      getLightTheme.textTheme.titleSmall!.copyWith(color: AppColors.white, fontWeight: FontWeightManager.bold);
}

extension on TextStyle {
  TextStyle get dMSans => copyWith(fontFamily: FontConstants.dmSans);

  TextStyle get inter => copyWith(fontFamily: FontConstants.inter);

  TextStyle get cairo => copyWith(fontFamily: FontConstants.cairo);
}
