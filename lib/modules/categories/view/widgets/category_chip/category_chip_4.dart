import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';

import '../../../models/responses/category_model.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class CategoryChip4 extends StatelessWidget {
  final bool isSelected;
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryChip4({required this.category, required this.isSelected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CustomImage(
            image: category.imageUrl,
            fit: BoxFit.contain,
            height: AppSize.s22.adaptSize,
            width: AppSize.s22.adaptSize,
            color: isSelected ? AppColors.black : AppColors.gray400,
          ),
          HorizontalSpace(AppSize.s4.h),
          CustomText(
            category.name,
            style: TextStyle(
              color: isSelected ? AppColors.black : AppColors.gray400,
              fontSize: FontSize.s12.adaptSize,
              fontWeight: FontWeightManager.medium,
            ),
          ),
        ],
      ),
    );
  }
}
