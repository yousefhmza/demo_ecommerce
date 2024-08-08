import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/responses/order_model.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;

  const OrderItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "${AppStrings.lblOrderNo.tr} ${order.id}",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(),
              ),
              CustomText(
                "${AppStrings.lblOnDelivery.tr} ${DateFormat.yMEd().format(order.createdAt)}",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p4),
          decoration: BoxDecoration(
            // color: order.status.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: CustomText(
            order.status.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}
