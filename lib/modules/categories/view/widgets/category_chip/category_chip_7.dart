import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../models/responses/category_model.dart';
import '../../../../../core/view/views.dart';

class CategoryChip7 extends StatelessWidget {
  final bool isSelected;
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryChip7({required this.category, required this.isSelected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
        height: 96.v,
        width: 72.v,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: isSelected ? AppColors.black : AppColors.white)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0.adaptSize),
                child: CustomImage(
                  image: category.imageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  color: isSelected ? AppColors.black : AppColors.gray400,
                ),
              ),
            ),
            VerticalSpace(AppSize.s4.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.adaptSize),
              child: CustomText(
                category.name,
                maxLines: 1,
                autoSized: true,
                style: TextStyle(
                  color: isSelected ? AppColors.black : AppColors.gray400,
                  fontSize: FontSize.s12.adaptSize,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
