import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';

class FollowingListItem extends StatelessWidget {
  const FollowingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p24),
      child: Row(
        children: [
          const CustomImage(image: AppImages.imgSimpleIconsSony),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s6),
              color: AppColors.red500.withOpacity(0.05),
            ),
            child: CustomText(
              AppStrings.lblUnfollow.tr,
              style: TextStyle(fontSize: FontSize.s10,fontWeight: FontWeightManager.bold,color: AppColors.red500),
            ),
          )
        ],
      ),
    );
  }
}
