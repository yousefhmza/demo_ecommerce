import '../../../config/navigation/navigation.dart';
import '../../resources/resources.dart';
import '../views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotLoggedInComponent extends StatelessWidget {
  const NotLoggedInComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        children: [
          CustomIcon(Icons.lock_person_rounded, size: AppSize.s72, color: AppColors.error),
          const VerticalSpace(AppSize.s8),
          CustomText(
            AppStrings.notLoggedIn.tr,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeightManager.bold),
          ),
          const VerticalSpace(AppSize.s4),
          CustomText(
            AppStrings.notLoggedInDesc.tr,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(AppSize.s8),
          CustomButton(
            text: AppStrings.lblLogin.tr,
            color: AppColors.black,
            onPressed: () {
              Get.back();
              Get.toNamed(Routes.loginScreen);
            },
          )
        ],
      ),
    );
  }
}
