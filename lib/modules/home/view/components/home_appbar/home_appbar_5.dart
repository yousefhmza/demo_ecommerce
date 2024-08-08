import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../../../core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/view/views.dart';

class HomeAppbar5 extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar5({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      showDefaultBackButton: false,
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Center(child: CustomImage(image: AppIcons.menu, height: 24.adaptSize, width: 24.adaptSize)),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            "Location",
            style: Get.theme.textTheme.titleSmall?.copyWith(
              color: AppColors.gray500,
              fontSize: FontSize.s12,
              fontWeight: FontWeightManager.regular,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomImage(
                image: AppIcons.location2,
                width: AppSize.s24,
                height: AppSize.s24,
              ),
              const HorizontalSpace(AppSize.s4),
              CustomText(
                "15th St., Ahmed Lotfy",
                style: Get.theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeightManager.medium,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        CustomImage(
          image: AppIcons.bell2,
          width: AppSize.s28,
          height: AppSize.s28,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
