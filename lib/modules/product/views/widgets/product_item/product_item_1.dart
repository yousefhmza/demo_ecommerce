import '../../../../../config/navigation/navigation.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../models/responses/in_list_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../core/view/views.dart';

class ProductItem1 extends StatelessWidget {
  final InListProductModel product;
  final bool dynamicDimensions;

  const ProductItem1(this.product, {this.dynamicDimensions = false, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.productDetailsScreen, arguments: {"id": product.prodId}),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p12),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        width: dynamicDimensions ? double.infinity : AppSize.s150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: CustomImage(image: product.imgUrl, width: double.infinity)),
            SizedBox(height: AppSize.s12.v),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    product.title,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: CustomTextStyles.bodyMediumCairo,
                  ),
                  SizedBox(height: AppSize.s8.v),
                  Row(
                    children: [
                      if (product.discountPrice < product.price)
                        CustomText(
                          "USD ${product.discountPrice}",
                          style: CustomTextStyles.labelLargeCairoGray40002.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Padding(
                        padding: product.discountPrice < product.price ? EdgeInsets.only(left: 4.h) : EdgeInsets.zero,
                        child: CustomText(
                          "USD ${product.discountPrice < product.price ? product.discountPrice : product.price}",
                          style: CustomTextStyles.labelLargeCairo,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s8.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImage(
                        image: AppImages.imgFavoriteDuotone,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      const Spacer(),
                      CustomImage(
                        image: AppImages.imgStar,
                        height: AppSize.s14.adaptSize,
                        width: AppSize.s14.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(product.avgRatting.toStringAsFixed(1), style: CustomTextStyles.bodySmallCairo),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
