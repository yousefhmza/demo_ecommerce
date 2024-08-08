import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';

class SuccessfulOrderScreen extends StatelessWidget {
  const SuccessfulOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(image: AppImages.imgSuccessfulIllustration, height: 274.v, width: 300.h),
              SizedBox(height: 51.v),
              CustomText(AppStrings.msgYourOrderIsSuccessfully.tr, style: Get.theme.textTheme.titleMedium),
              SizedBox(height: 30.v),
              CustomButton(
                text: AppStrings.lblReviewOrder.tr,
                onPressed: () {},
              ),
              SizedBox(height: 16.v),
              CustomButton(
                isOutlined: true,
                textColor: AppColors.primary,
                text: AppStrings.lblGoBackHome.tr,
                onPressed: () => Get.offAllNamed(Routes.layoutScreen),
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }
}
