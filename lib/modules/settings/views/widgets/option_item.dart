import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';

class OptionItem extends StatelessWidget {
  final String text;
  final Color? color;
  final bool showDivider;
  final bool isBold;
  final VoidCallback? onTap;

  const OptionItem({
    required this.text,
    this.showDivider = true,
    this.isBold = false,
    this.onTap,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.v),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: CustomText(
                    text,
                    style: Get.theme.textTheme.bodyLarge!.copyWith(
                      color: color ?? AppColors.black,
                      fontWeight: isBold ? FontWeightManager.bold : null,
                    ),
                  ),
                ),
                CustomImage(
                  image: AppImages.imgIconChevronLeft,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: color,
                )
              ],
            ),
          ),
          if (showDivider) const Divider(color: AppColors.gray300, height: AppSize.s1),
        ],
      ),
    );
  }
}
