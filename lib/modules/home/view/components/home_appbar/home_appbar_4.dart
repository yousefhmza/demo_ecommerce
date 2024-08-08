import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/view/views.dart';

class HomeAppbar4 extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar4({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      showDefaultBackButton: false,
      title: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(AppSize.s6),
            onTap: () {},
            child: SizedBox(
              height: kToolbarHeight - AppSize.s12,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s6),
                    border: Border.all(color: AppColors.gray300),
                  ),
                  child: Center(
                    child: CustomImage(
                      image: AppIcons.bell2,
                      width: AppSize.s24.adaptSize,
                      height: AppSize.s24.adaptSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
          HorizontalSpace(AppSize.s12.h),
          Expanded(
            child: Container(
              height: kToolbarHeight - AppSize.s12,
              padding: const EdgeInsets.all(AppPadding.p4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s6),
                border: Border.all(color: AppColors.gray300),
              ),
              child: Row(
                children: [
                  CustomImage(
                    image: AppImages.imgArrowLeft,
                    width: AppSize.s20.adaptSize,
                    height: AppSize.s20.adaptSize,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          "Location",
                          style: Get.theme.textTheme.titleSmall?.copyWith(
                            color: AppColors.gray500,
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                        CustomText(
                          "15th St., Ahmed Lotfy",
                          style: Get.theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeightManager.medium,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalSpace(AppSize.s6.h),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s6),
                        color: AppColors.gray100,
                      ),
                      child: Center(
                        child: CustomImage(
                          image: AppIcons.location,
                          width: AppSize.s20.adaptSize,
                          height: AppSize.s20.adaptSize,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
