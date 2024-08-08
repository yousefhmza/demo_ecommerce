import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class EmptyCartComponent extends StatelessWidget {
  const EmptyCartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        Lottie.asset(AppLotties.emptyCart, width: AppSize.s150, height: AppSize.s150),
        const VerticalSpace(AppSize.s8),
        CustomText(AppStrings.msgYourCartIsEmpty.tr),
        const Spacer(),
      ],
    );
  }
}
