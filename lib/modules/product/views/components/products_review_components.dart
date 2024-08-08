import '../../../../config/navigation/navigation.dart';
import '../../../../core/utils/sheets.dart';
import '../../../../core/utils/utils.dart';
import 'add_review_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../controller/product_detail_controller.dart';
import '../widgets/review_item.dart';

class ProductReviewsComponent extends GetWidget<ProductDetailsController> {
  const ProductReviewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                "${AppStrings.lblReviews102.tr} (${controller.product.value!.ratings.length})",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.regular,
                    ),
              ),
              const Spacer(),
              CustomButton(
                height: AppSize.s40,
                isOutlined: true,
                textColor: AppColors.primary,
                text: AppStrings.lblRateProduct.tr,
                onPressed: () => Utils.invokeIfAuthenticated(
                  callback: () => AppSheets.showBottomSheet(
                    context,
                    child: AddReviewSheet(product: controller.product.value!.product),
                  ),
                ),
              )
            ],
          ),
          ...List.generate(
            controller.product.value!.ratings.length > 2 ? 2 : controller.product.value!.ratings.length,
            (index) => Padding(
              padding: const EdgeInsets.only(top: AppPadding.p16),
              child: ReviewItem(controller.product.value!.ratings[index]),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () => Get.toNamed(
                Routes.productReviewsScreen,
                arguments: {"reviews": controller.product.value!.ratings},
              ),
              child: CustomText(
                AppStrings.msgViewAllReviews.tr,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
