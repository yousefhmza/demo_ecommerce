import '../../../../core/services/responsive_service.dart';
import '../../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/globals.dart';
import '../../../../core/view/views.dart';

class HomeFeaturedComponent extends GetWidget<HomeController> {
  const HomeFeaturedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.featuredProducts.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                SizedBox(height: 29.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: RowWithTitle(
                    title: "lbl_most_sale".tr,
                    viewAllText: "lbl_view_all".tr,
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 12.v),
                SizedBox(
                  height: settings.productListViewHeight,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 16.h),
                    itemCount: controller.featuredProducts.length,
                    itemBuilder: (context, index) =>
                        settings.getProductItem(product: controller.featuredProducts[index]),
                  ),
                ),
              ],
            ),
    );
  }
}
