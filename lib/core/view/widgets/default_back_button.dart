import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../views.dart';

class DefaultBackButton extends StatelessWidget {
  final String icon;
  final bool isOutlined;

  const DefaultBackButton({
    this.icon = AppImages.imgArrowLeft,
    this.isOutlined = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Center(child: CustomImage(image: icon, width: AppSize.s28, height: AppSize.s28)),
    );
  }
}
