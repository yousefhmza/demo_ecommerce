import '../../../../core/extensions/color_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../models/requests/search_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../categories/view/components/categories_dropdown_component.dart';
import '../../controllers/search_controller.dart' as sc;

class FilterBottomSheet extends GetWidget<sc.SearchController> {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.searchCriteria.value == null) controller.getSearchCriteria();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(AppStrings.filterBy.tr, style: Theme.of(context).textTheme.titleMedium),
        const VerticalSpace(AppSize.s24),
        CategoriesDropDownComponent(
          categoryInitId: controller.searchBody.value.categoryId,
          subCategoryInitId: controller.searchBody.value.subCategoryId,
          childCategoryInitId: controller.searchBody.value.childCategoryId,
          onChangeCategory: (category) =>
              controller.searchBody.value.copyWith(categoryId: category.id, category: category.name),
          onChangeSubcategory: (subCategory) =>
              controller.searchBody.value.copyWith(subCategoryId: subCategory.id, subCategory: subCategory.name),
          onChangeChildCategory: (childCategory) => controller.searchBody.value
              .copyWith(childCategoryId: childCategory.id, childCategory: childCategory.name),
        ),
        const VerticalSpace(AppSize.s24),
        Obx(
          () => controller.searchCriteria.value == null
              ? const SizedBox.shrink()
              : StatefulBuilder(
                  builder: (context, setState) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(AppStrings.lblColor.tr),
                      const VerticalSpace(AppSize.s6),
                      Wrap(
                        spacing: AppSize.s8,
                        runSpacing: AppSize.s8,
                        children: List.generate(
                          controller.searchCriteria.value!.allColors.length,
                          (index) {
                            final color = controller.searchCriteria.value!.allColors[index];
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() => controller.searchBody.value.copyWith(color: color.name));
                                  },
                                  child: CircleAvatar(
                                    radius: AppSize.s16,
                                    backgroundColor: HexColor.fromHex(color.colorCode),
                                  ),
                                ),
                                if (controller.searchBody.value.color == color.name)
                                  const CustomIcon(Icons.check, color: AppColors.white),
                              ],
                            );
                          },
                        ),
                      ),
                      const VerticalSpace(AppSize.s24),
                      CustomText(AppStrings.lblSize.tr),
                      const VerticalSpace(AppSize.s6),
                      Wrap(
                        spacing: AppSize.s8,
                        runSpacing: AppSize.s8,
                        children: List.generate(
                          controller.searchCriteria.value!.allSizes.length,
                          (index) {
                            final size = controller.searchCriteria.value!.allSizes[index];
                            final bool isSelected = controller.searchBody.value.size == size.sizeCode;
                            return GestureDetector(
                              onTap: () {
                                setState(() => controller.searchBody.value.copyWith(size: size.sizeCode));
                              },
                              child: Container(
                                width: AppSize.s32,
                                height: AppSize.s32,
                                alignment: AlignmentDirectional.center,
                                decoration: ShapeDecoration(
                                  color: isSelected ? AppColors.primary : AppColors.white,
                                  shape: CircleBorder(
                                    side: BorderSide(color: isSelected ? AppColors.primary : AppColors.gray500),
                                  ),
                                ),
                                child: CustomText(
                                  size.sizeCode,
                                  style: TextStyle(color: isSelected ? AppColors.white : AppColors.black),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const VerticalSpace(AppSize.s24),
                    ],
                  ),
                ),
        ),
        CustomText(AppStrings.priceRange.tr),
        StatefulBuilder(
          builder: (context, setState) => RangeSlider(
            values: RangeValues(
              controller.searchBody.value.fromPrice ?? 0,
              controller.searchBody.value.toPrice ?? 2000,
            ),
            max: 2000,
            divisions: 20,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.grey.withOpacity(0.2),
            labels: RangeLabels(
              controller.searchBody.value.fromPrice?.round().toString() ?? "",
              controller.searchBody.value.toPrice?.round().toString() ?? "",
            ),
            onChanged: (RangeValues values) {
              controller.searchBody.value.copyWith(fromPrice: values.start, toPrice: values.end);
              setState(() {});
            },
          ),
        ),
        CustomText(AppStrings.rating.tr),
        RatingBar.builder(
          initialRating: controller.searchBody.value.rating ?? 0,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          glowColor: AppColors.ratingStar,
          itemPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
          itemSize: AppSize.s32,
          unratedColor: AppColors.gray300,
          itemBuilder: (context, index) => const CustomIcon.svg(AppImages.imgStar),
          onRatingUpdate: (value) => controller.searchBody.value.copyWith(rating: value),
        ),
        const VerticalSpace(AppSize.s24),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                isOutlined: true,
                textColor: AppColors.primary,
                text: AppStrings.clear.tr,
                onPressed: () {
                  controller.searchBody(SearchBody());
                  Get.back();
                },
              ),
            ),
            const HorizontalSpace(AppSize.s12),
            Expanded(
              child: CustomButton(
                text: AppStrings.apply.tr,
                onPressed: () {
                  controller.searchBody(controller.searchBody.value.copyNew(controller.searchBody.value));
                  Get.back();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
