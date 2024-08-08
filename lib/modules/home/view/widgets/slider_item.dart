import '../../../../config/navigation/navigation.dart';
import '../../../../core/services/responsive_service.dart';
import '../../models/responses/slider_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class SliderItem extends StatelessWidget {
  final SliderItemModel slider;

  const SliderItem(this.slider, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p24, vertical: AppPadding.p16),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24, vertical: AppPadding.p16),
      decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  slider.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleLargeBlack900.copyWith(height: 1.36),
                ),
                const VerticalSpace(AppSize.s12),
                Text(
                  slider.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumLight,
                ),
                const VerticalSpace(AppSize.s12),
                InkWell(
                  onTap: () {
                    if (slider.category.isNotEmpty) {
                      Get.toNamed(Routes.categoryProductsScreen, arguments: {"category_name": slider.category});
                    } else if (slider.campaignId != 0) {
                      return;
                    }
                  },
                  child: Row(
                    children: [
                      Text(slider.buttonText, style: CustomTextStyles.titleSmallPrimary),
                      const HorizontalSpace(AppSize.s12),
                      CustomImage(
                        image: AppImages.imgIconArrowRight,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const HorizontalSpace(AppSize.s32),
          CustomImage(
            image: slider.image,
            height: 135.v,
            width: 117.h,
            alignment: AlignmentDirectional.centerEnd,
            borderRadius: AppSize.s16,
          ),
        ],
      ),
    );
  }
}
