import '../../../../../core/resources/resources.dart';
import '../../../controller/layout_controller.dart';
import '../../widgets/bnb_items/bnb_item1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BNB1 extends GetWidget<LayoutController> {
  const BNB1({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: Theme.of(context).copyWith(splashColor: AppColors.transparent),
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          items: List.generate(controller.bnbItemsList.length, (index) => BNBItem1(controller.bnbItemsList[index])),
          onTap: (index) => controller.selectedIndex(index),
        ),
      ),
    );
  }
}
