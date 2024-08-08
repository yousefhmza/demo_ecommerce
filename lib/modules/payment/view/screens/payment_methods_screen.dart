import '../../../../config/navigation/routes.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../controller/payment_methods_controller.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends GetWidget<PaymentMethodsController> {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblPaymentMethods.tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.v),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 13.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImage(
                      image: AppImages.imgLogosVisa,
                      height: 16.v,
                      width: 48.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h, top: 2.v),
                      child: CustomText(
                        "lbl_7878".tr,
                        style: Get.theme.textTheme.bodyLarge!.copyWith(color: AppColors.black),
                      ),
                    ),
                    Spacer(),
                    CustomImage(image: AppImages.imgIconChevronLeft, height: 24.adaptSize, width: 24.adaptSize)
                  ],
                ),
              ),
            ),
            const Divider(height: AppSize.s1, color: AppColors.gray300),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 13.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImage(image: AppImages.imgFrameCyan900, height: 16.v, width: 48.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h, top: 2.v),
                      child: CustomText(
                        "lbl_7878".tr,
                        style: Get.theme.textTheme.bodyLarge!.copyWith(color: AppColors.black),
                      ),
                    ),
                    Spacer(),
                    CustomImage(image: AppImages.imgIconChevronLeft, height: 24.adaptSize, width: 24.adaptSize)
                  ],
                ),
              ),
            ),
            const Divider(height: AppSize.s1, color: AppColors.gray300),
            SizedBox(height: 32.v),
            CustomButton(
              margin: EdgeInsets.symmetric(horizontal: AppPadding.p24),
              text: AppStrings.msgAddNewPayment.tr,
              onPressed: () => Get.toNamed(Routes.addPaymentMethodScreen),
            ),
            SizedBox(height: 5.v)
          ],
        ),
      ),
    );
  }
}
