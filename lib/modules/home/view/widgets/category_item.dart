import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../categories/models/responses/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/view/views.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.roundedBorder10,
      onTap: () => Get.toNamed(Routes.categoryProductsScreen, arguments: {"category_name": category.name}),
      child: Container(
        width: 104.v,
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: 10.v,
        ),
        decoration: AppDecoration.outlineGray200.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(image: category.imageUrl, height: 48.adaptSize, width: 48.adaptSize),
            const VerticalSpace(AppSize.s6),
            CustomText(
              category.name,
              maxLines: 1,
              autoSized: true,
              style: CustomTextStyles.labelLargeCairoBlack900,
            ),
          ],
        ),
      ),
    );
  }
}
