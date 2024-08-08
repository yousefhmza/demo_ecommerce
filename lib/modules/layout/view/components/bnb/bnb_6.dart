import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../controller/layout_controller.dart';
import '../../widgets/bnb_items/bnb_item6.dart';

class BNB6 extends GetWidget<LayoutController> {
  const BNB6({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        color: AppColors.white,
        padding: const EdgeInsets.all(AppPadding.p16).copyWith(bottom: AppPadding.p0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            controller.bnbItemsList.length,
            (index) => InkWell(
              onTap: () => controller.selectedIndex(index),
              child: BNBItem6(controller.bnbItemsList[index], isSelected: index == controller.selectedIndex.value),
            ),
          ),
        ),
      ),
    );
  }
}
