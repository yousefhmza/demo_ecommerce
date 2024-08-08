import '../../../../config/navigation/navigation.dart';
import '../../../../core/services/responsive_service.dart';
import '../../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';
import '../widgets/category_item.dart';

class HomeCategoriesComponent extends GetWidget<HomeController> {
  const HomeCategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.categories.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: RowWithTitle(
                    title: "lbl_categories".tr,
                    viewAllText: "lbl_view_all".tr,
                    onTap: () => Get.toNamed(
                      Routes.allCategoriesScreen,
                      arguments: {"categories": controller.categories},
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 104.v,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 8.h),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) => CategoryItem(controller.categories[index]),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
