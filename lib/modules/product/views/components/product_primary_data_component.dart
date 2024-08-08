import '../../../../core/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../controller/product_detail_controller.dart';

class ProductPrimaryDataComponent extends GetWidget<ProductDetailsController> {
  const ProductPrimaryDataComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> colors =
        controller.product.value!.product.color.map((e) => e.colorCode).toList().toSet().toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: CustomText(
                  controller.product.value!.product.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        height: 1,
                        fontWeight: FontWeightManager.bold,
                        fontSize: FontSize.s32,
                      ),
                ),
              ),
              const HorizontalSpace(AppSize.s8),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    if (controller.product.value!.product.salePrice < controller.product.value!.product.price)
                      CustomText(
                        "${AppStrings.usd.tr} ${controller.product.value!.product.price.toStringAsFixed(1)}",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              fontSize: FontSize.s12,
                              color: AppColors.gray500,
                            ),
                      ),
                    CustomText(
                      "${AppStrings.usd.tr} ${controller.product.value!.product.salePrice.toStringAsFixed(1)}",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeightManager.bold,
                            fontSize: FontSize.s16,
                            color: AppColors.primary,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomIcon.svg(AppImages.imgStar, size: AppSize.s20),
                        const HorizontalSpace(AppSize.s4),
                        CustomText(
                          controller.product.value!.avgRating.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeightManager.semiBold,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const HorizontalSpace(AppSize.s8),
              CustomIcon.svg(AppImages.imgFavoriteLight),
            ],
          ),
          const VerticalSpace(AppSize.s16),
          Row(
            children: [
              CustomText(
                AppStrings.lblColors.tr,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: FontSize.s16),
              ),
              const Spacer(),
              ...List.generate(
                colors.length,
                (index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: AppPadding.p8),
                  child: CircleAvatar(radius: AppSize.s8, backgroundColor: HexColor.fromHex(colors[index])),
                ),
              ),
            ],
          ),
          const Divider(height: AppSize.s48, indent: AppPadding.p20, endIndent: AppPadding.p20),
        ],
      ),
    );
  }
}
