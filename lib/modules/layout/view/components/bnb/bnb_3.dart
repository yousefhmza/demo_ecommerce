import '../../../../../core/resources/resources.dart';
import '../../../controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/bnb_items/bnb_item3.dart';

class BNB3 extends GetWidget<LayoutController> {
  const BNB3({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        color: AppColors.white,
        padding: const EdgeInsets.all(AppPadding.p16).copyWith(bottom: AppPadding.p0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            controller.bnbItemsList.length,
            (index) => Expanded(
              child: InkWell(
                onTap: () => controller.selectedIndex(index),
                child: BNBItem3(controller.bnbItemsList[index], isSelected: index == controller.selectedIndex.value),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
