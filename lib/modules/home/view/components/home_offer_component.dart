import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/view/views.dart';

class HomeOfferComponent extends StatelessWidget {
  const HomeOfferComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222.v,
      width: 326.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("lbl_offers".tr, style: CustomTextStyles.titleMediumSemiBold_1),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 206.v,
              width: 326.h,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 11.v),
                      decoration: AppDecoration.outlineBlack.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3.h, right: 9.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomImage(image: AppImages.imgUnsplashSGyabqtoxk, height: 93.v, width: 125.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 21.v),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText("lbl_shoes".tr, style: CustomTextStyles.bodySmall9),
                                      SizedBox(height: 5.v),
                                      CustomText("msg_nike_running_shoes".tr,
                                          style: CustomTextStyles.titleSmallSemiBold),
                                      SizedBox(height: 2.v),
                                      Row(
                                        children: [
                                          CustomText("lbl_usd_350".tr, style: Get.theme.textTheme.labelLarge),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: CustomText(
                                              "lbl_usd_550".tr,
                                              style: CustomTextStyles.labelLargeGray40002
                                                  .copyWith(decoration: TextDecoration.lineThrough),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 12.v),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 13.v, bottom: 9.v),
                                    child: Text("lbl_buy_now".tr, style: CustomTextStyles.titleSmallPrimary)),
                                CustomImage(
                                  image: AppImages.imgIconArrowRightPrimary20x20,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 23.h),
                                  child: TimeFrame(timeValue: "lbl_40".tr, timeUnit: "lbl_sec".tr),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: TimeFrame(timeValue: "lbl_19".tr, timeUnit: "lbl_mins".tr),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: TimeFrame(timeValue: "lbl_19".tr, timeUnit: "lbl_hours".tr),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: TimeFrame(timeValue: "lbl_5".tr, timeUnit: "lbl_days".tr),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 13.v),
                          SizedBox(
                            height: 4.v,
                            child: AnimatedSmoothIndicator(
                              activeIndex: 0,
                              count: 3,
                              effect: ScrollingDotsEffect(
                                spacing: 4,
                                activeDotColor: Get.theme.colorScheme.primary,
                                dotColor: AppColors.black,
                                dotHeight: 4.v,
                                dotWidth: 4.h,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.v)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 32.v,
                      width: 48.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: CustomText(
                        "lbl_15".tr,
                        style: CustomTextStyles.titleSmallWhiteA700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeFrame extends StatelessWidget {
  final String timeValue;
  final String timeUnit;

  const TimeFrame({required this.timeValue, required this.timeUnit, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 5.v),
      decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(timeValue, style: CustomTextStyles.labelLargeBlack900_1.copyWith(color: AppColors.black)),
          SizedBox(height: 1.v),
          Text(
            timeUnit,
            style: Get.theme.textTheme.labelMedium!.copyWith(color: Get.theme.colorScheme.primary),
          )
        ],
      ),
    );
  }
}
