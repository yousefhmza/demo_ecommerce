import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../controller/layout_controller.dart';
import '../../widgets/bnb_items/bnb_item8.dart';

class BNB8 extends GetWidget<LayoutController> {
  const BNB8({super.key});

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
            (index) => Expanded(
              child: InkWell(
                onTap: () => controller.selectedIndex(index),
                child: BNBItem8(controller.bnbItemsList[index], isSelected: index == controller.selectedIndex.value),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
