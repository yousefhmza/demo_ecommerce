import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../core/view/views.dart';
import '../../widgets/bnb_items/bnb_item2.dart';

class BNB2 extends GetWidget<LayoutController> {
  const BNB2({super.key});

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
          items: List.generate(controller.bnbItemsList.length, (index) => BNBItem2(controller.bnbItemsList[index])),
          onTap: (index) => controller.selectedIndex(index),
        ),
      ),
    );
  }
}
