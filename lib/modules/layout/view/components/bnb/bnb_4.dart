import '../../../../../core/resources/resources.dart';
import '../../../controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/bnb_items/bnb_item3.dart';
import '../../widgets/bnb_items/bnb_item4.dart';

class BNB4 extends GetWidget<LayoutController> {
  const BNB4({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        color: AppColors.white,
        padding: const EdgeInsets.all(AppPadding.p16).copyWith(bottom: AppPadding.p0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            controller.bnbItemsList.length,
            (index) => InkWell(
              onTap: () => controller.selectedIndex(index),
              child: BNBItem4(controller.bnbItemsList[index], isSelected: index == controller.selectedIndex.value),
            ),
          ),
        ),
      ),
    );
  }
}
