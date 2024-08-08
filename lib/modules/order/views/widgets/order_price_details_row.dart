import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/resources/resources.dart';

class OrderPriceDetailsRow extends StatelessWidget {
  final String title;
  final String price;

  const OrderPriceDetailsRow({required this.title, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: 0.8,
          child: CustomText(
            title,
            style: CustomTextStyles.labelLargeBlack900.copyWith(color: AppColors.black.withOpacity(0.56)),
          ),
        ),
        CustomText(
          "${AppStrings.usd.tr} $price",
          style: Get.theme.textTheme.titleMedium!.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
