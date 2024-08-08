import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/view/views.dart';

class HomeAppbar3 extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar3({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      showDefaultBackButton: false,
      centerTitle: false,
      titleSpacing: AppSize.s0,
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Center(child: CustomImage(image: AppIcons.menuVariant, height: 24.adaptSize, width: 24.adaptSize)),
      ),
      title: CustomImage(image: AppIcons.bell, height: 24.adaptSize, width: 24.adaptSize),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
            Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButton<String>(
                items: [],
                onChanged: (value) {},
                padding: EdgeInsets.zero,
                isDense: true,
                underline: const SizedBox.shrink(),
                icon: const CustomImage(
                  image: AppIcons.dropDownArrow,
                  width: AppSize.s8,
                  height: AppSize.s8,
                ),
                hint: CustomText(
                  "15th St., Ahmed Lotfy",
                  style: Get.theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeightManager.medium,
                    color: AppColors.black,
                  ),
                ),
              ),
            )
          ],
        ),
        HorizontalSpace(AppSize.s10.h),
        if (currentUser.value != null)
          CustomImage(
            image: currentUser.value!.profileImageUrl,
            width: AppSize.s36.adaptSize,
            height: AppSize.s36.adaptSize,
            borderRadius: AppSize.s250,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
