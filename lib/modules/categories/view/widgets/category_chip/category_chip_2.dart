import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../models/responses/category_model.dart';
import '../../../../../core/view/views.dart';

class CategoryChip2 extends StatelessWidget {
  final bool isSelected;
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryChip2({required this.category, required this.isSelected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        height: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.transparent,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Row(
          children: [
            CustomImage(
              image: category.imageUrl,
              fit: BoxFit.contain,
              height: AppSize.s22.adaptSize,
              width: AppSize.s22.adaptSize,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
            HorizontalSpace(AppSize.s6.h),
            CustomText(
              category.name,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.black,
                fontSize: FontSize.s12.adaptSize,
                fontWeight: FontWeightManager.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
