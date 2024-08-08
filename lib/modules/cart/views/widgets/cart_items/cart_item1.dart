import '../../../../../core/extensions/non_null_extensions.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../models/requests/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../core/extensions/color_extension.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/shopping_cart_controller.dart';

class CartItem1 extends GetWidget<CartController> {
  final CartProduct product;

  const CartItem1(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppSize.s112,
          width: AppSize.s112,
          margin: EdgeInsets.only(bottom: 8.v),
          padding: EdgeInsets.all(10.h),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: CustomImage(image: product.thumbnail.orEmpty, height: double.infinity, width: double.infinity),
        ),
        const HorizontalSpace(AppSize.s16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.title.orEmpty,
                      style: Get.theme.textTheme.bodyLarge,
                    ),
                  ),
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
              SizedBox(height: 3.v),
              Text(
                "${AppStrings.usd.tr} ${product.priceWithAttr ?? product.discountPrice}",
                style: CustomTextStyles.titleSmallPrimary,
              ),
              SizedBox(height: 7.v),
              Row(
                children: [
                  Text(
                    AppStrings.lblColor.tr,
                    style: Get.theme.textTheme.bodySmall,
                  ),
                  if (product.color != null)
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
              SizedBox(height: 3.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomIconButton(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    padding: EdgeInsets.all(2.h),
                    onTap: () => controller.decreaseQuantity(product.productId!, product.attributesHash.orEmpty),
                    child: CustomImage(image: AppImages.imgIconMinus),
                  ),
                  const HorizontalSpace(AppSize.s16),
                  Text(product.qty.toString(), style: Get.theme.textTheme.bodyLarge),
                  const HorizontalSpace(AppSize.s16),
                  CustomIconButton(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    padding: EdgeInsets.all(2.h),
                    onTap: () => controller.increaseQuantity(product.productId!, product.attributesHash.orEmpty),
                    child: CustomImage(image: AppImages.imgIconPlus),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
