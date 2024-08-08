import '../../resources/resources.dart';
import '../views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/theme.dart';

class RowWithTitle extends StatelessWidget {
  final String title;
  final String? viewAllText;
  final VoidCallback? onTap;

  const RowWithTitle({required this.title, this.viewAllText, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(title, style: CustomTextStyles.titleMediumSemiBold_1.copyWith(color: AppColors.black)),
        const Spacer(),
        if (onTap != null && viewAllText != null)
          InkWell(
            onTap: onTap,
            child: CustomText(
              viewAllText!,
              style: Get.theme.textTheme.labelLarge!.copyWith(
                decoration: TextDecoration.underline,
                color: Get.theme.colorScheme.primary,
              ),
            ),
          )
      ],
    );
  }
}
