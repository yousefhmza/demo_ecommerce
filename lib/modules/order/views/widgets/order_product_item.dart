import '../../../../core/extensions/color_extension.dart';
import '../../../../core/extensions/non_null_extensions.dart';
import '../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../../cart/models/requests/cart_product_model.dart';

class OrderProductItem extends StatelessWidget {
  final CartProduct product;

  const OrderProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 104.adaptSize,
          width: 104.adaptSize,
          padding: EdgeInsets.all(10.h),
          decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          child: CustomImage(image: product.thumbnail.orEmpty, height: 84.adaptSize, width: 84.adaptSize),
        ),
        const HorizontalSpace(AppSize.s16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(product.title.orEmpty, style: Get.theme.textTheme.bodyLarge),
              SizedBox(height: 3.v),
              Text(
                "${AppStrings.usd.tr} ${product.priceWithAttr ?? product.discountPrice}",
                style: CustomTextStyles.titleSmallPrimary,
              ),
              SizedBox(height: 6.v),
              if (product.color != null)
                Row(
                  children: [
                    Text(
                      AppStrings.lblColor.tr,
                      style: Get.theme.textTheme.bodySmall,
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
              SizedBox(height: 3.v),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text("x ${product.qty}", style: Get.theme.textTheme.bodyLarge),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
