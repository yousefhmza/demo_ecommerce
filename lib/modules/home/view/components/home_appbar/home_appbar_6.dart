import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../../../core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/view/views.dart';

class HomeAppbar6 extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar6({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      showDefaultBackButton: false,
      leadingWidth: MediaQuery.of(context).size.width / 2,
      leading: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p16.h),
        child: CustomText("LOGO", style: Get.theme.textTheme.headlineSmall),
      ),
      actions: [
        const CustomImage(
          image: AppIcons.search,
          width: AppSize.s28,
          height: AppSize.s28,
          borderRadius: AppSize.s250,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
