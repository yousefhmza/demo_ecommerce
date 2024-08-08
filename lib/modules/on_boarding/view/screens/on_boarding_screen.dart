import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/on_boarding_controller.dart';

class OnBoardingScreen extends GetWidget<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(AppSize.s16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      textColor: AppColors.primary,
                      text: AppStrings.lblLanguage.tr,
                      onPressed: () => Get.toNamed(Routes.languageScreen),
                    ),
                    const HorizontalSpace(AppSize.s8),
                    Container(height: AppSize.s40, width: AppSize.s1, color: AppColors.gray400),
                    const HorizontalSpace(AppSize.s8),
                    CustomTextButton(
                      text: AppStrings.skip.tr,
                      onPressed: () async {
                        await controller.saveOnBoardingSeen();
                        Get.offAllNamed(Routes.loginScreen);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => OnBoardingItem(
                    image: controller.pages[index].image,
                    title: controller.pages[index].title,
                    desc: controller.pages[index].desc,
                  ),
                  controller: controller.pageController,
                  itemCount: controller.pages.length,
                ),
              ),
              const VerticalSpace(AppSize.s32),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.pages.length,
                effect: ScrollingDotsEffect(
                  spacing: AppSize.s12,
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.primary.withOpacity(0.42),
                  activeDotScale: 1,
                  dotHeight: AppSize.s12,
                  dotWidth: AppSize.s12,
                ),
              ),
              const VerticalSpace(AppSize.s32),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.showBackButton.value)
                        Expanded(
                          child: CustomButton(
                            isOutlined: true,
                            textColor: AppColors.primary,
                            text: AppStrings.lblBack.tr,
                            onPressed: () => controller.pageController.previousPage(
                              duration: Time.t450ms,
                              curve: Curves.easeInOut,
                            ),
                          ),
                        ),
                      if (controller.showBackButton.value) const HorizontalSpace(AppSize.s16),
                      Expanded(
                        child: CustomButton(
                          text: AppStrings.lblNext.tr,
                          onPressed: () async {
                            if (controller.pageController.page == 2.0) {
                              await controller.saveOnBoardingSeen();
                              Get.offAllNamed(Routes.loginScreen);
                            } else {
                              controller.pageController.nextPage(duration: Time.t450ms, curve: Curves.easeInOut);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpace(AppSize.s64),
            ],
          ),
        ),
      ),
    );
  }
}
