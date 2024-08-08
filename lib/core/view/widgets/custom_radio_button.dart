import '../../resources/resources.dart';
import '../../services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/theme.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final Function(bool value) onChanged;

  const CustomRadioButton({required this.isSelected, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: Container(
        padding: EdgeInsets.all(3.h),
        decoration: AppDecoration.outlinePrimary.copyWith(
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.gray400),
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Container(
          height: 11.adaptSize,
          width: 11.adaptSize,
          decoration: BoxDecoration(
            color: isSelected ? Get.theme.colorScheme.primary : AppColors.transparent,
            borderRadius: BorderRadius.circular(5.h),
          ),
        ),
      ),
    );
  }
}
