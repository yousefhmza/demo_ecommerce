import '../../controller/order_controller.dart';
import '../../models/requests/shipping_cost_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../config/theme/theme.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class OrderAddressComponent extends GetWidget<OrderController> {
  const OrderAddressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => InkWell(
        onTap: () async {
          final result = await Get.toNamed(Routes.addressesScreen, arguments: {"from_checkout_screen": true});
          if (result == null) return;
          final ShippingCostBody shippingCostBody = ShippingCostBody(
            stateId: result.stateId,
            cityId: result.cityId,
            countryId: result.countryId,
            productIds: controller.products.map((e) => e.productId!).toList(),
          );
          controller.orderBody.copyWith(address: result);
          setState(() {});
          controller.getShippingCost(shippingCostBody);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomIcon.svg(AppImages.imgUnion),
            const HorizontalSpace(AppSize.s10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(AppStrings.lblDeliverTo.tr, style: Get.theme.textTheme.bodySmall),
                  if (controller.orderBody.address != null) const VerticalSpace(AppSize.s2),
                  if (controller.orderBody.address != null)
                    CustomText(controller.orderBody.address!.address, style: CustomTextStyles.labelLargeBlack900_1)
                ],
              ),
            ),
            const HorizontalSpace(AppSize.s8),
            const CustomIcon.svg(AppImages.imgIconChevronLeft)
          ],
        ),
      ),
    );
  }
}
