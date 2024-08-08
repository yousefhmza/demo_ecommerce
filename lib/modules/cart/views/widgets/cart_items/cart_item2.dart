import '../../../../../core/extensions/non_null_extensions.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../models/requests/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/extensions/color_extension.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/shopping_cart_controller.dart';

class CartItem2 extends GetWidget<CartController> {
  final CartProduct product;

  const CartItem2(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray200),
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      child: Row(
        children: [
          CustomImage(
            image: product.thumbnail.orEmpty,
            width: AppSize.s90,
            height: AppSize.s90,
            borderRadius: AppSize.s6,
          ),
          const HorizontalSpace(AppSize.s8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        product.title.orEmpty,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeightManager.semiBold),
                      ),
                    ),
                    const HorizontalSpace(AppSize.s8),
                    InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => ConfirmationDialog(
                          title: AppStrings.msgSureRemoveFromCart.tr,
                          onYes: () =>
                              controller.deleteProduct(product.productId.orZero, product.attributesHash.orEmpty),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.h),
                        child: CustomImage(image: AppImages.imgIconTrash2, height: 20.adaptSize, width: 20.adaptSize),
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(AppSize.s4),
                if (product.size != null)
                  CustomText(
                    "${AppStrings.lblSize.tr}: ${product.size}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
                  ),
                if (product.size == null && product.color != null)
                  Row(
                    children: [
                      CustomText(
                        AppStrings.lblColor.tr,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
                      ),
                      Container(
                        height: 13.adaptSize,
                        width: 13.adaptSize,
                        margin: EdgeInsets.only(left: 8.h),
                        decoration: BoxDecoration(
                          color: HexColor.fromHex(product.color!),
                          borderRadius: BorderRadius.circular(6.h),
                        ),
                      ),
                    ],
                  ),
                if (product.size == null && product.color == null) const VerticalSpace(AppSize.s16),
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        "${AppStrings.usd.tr} ${product.priceWithAttr ?? product.discountPrice}",
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s6),
                        border: Border.all(color: AppColors.gray200),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                controller.decreaseQuantity(product.productId!, product.attributesHash.orEmpty),
                            child: CustomImage(image: AppImages.imgIconMinus),
                          ),
                          const HorizontalSpace(AppSize.s32),
                          CustomText(
                            product.qty.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: FontSize.s16, fontWeight: FontWeightManager.bold),
                          ),
                          const HorizontalSpace(AppSize.s32),
                          InkWell(
                            onTap: () =>
                                controller.increaseQuantity(product.productId!, product.attributesHash.orEmpty),
                            child: CustomImage(image: AppImages.imgIconPlus),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
