import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../../../core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/globals.dart';
import '../../../../../core/view/views.dart';

class HomeAppbar1 extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      showDefaultBackButton: false,
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Center(
          child: CustomImage(image: AppIcons.menuVariant, height: 24.adaptSize, width: 24.adaptSize),
        ),
      ),
      title: CustomText("LOGO", style: Get.theme.textTheme.headlineSmall),
      actions: [
        if (currentUser.value != null)
          CustomImage(
            image: currentUser.value!.profileImageUrl,
            width: AppSize.s36,
            height: AppSize.s36,
            borderRadius: AppSize.s250,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
