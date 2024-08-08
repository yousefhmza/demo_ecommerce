import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../controller/my_orders_controller.dart';
import '../../models/responses/order_model.dart';
import '../widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends GetWidget<MyOrdersController> {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblMyOrders.tr),
      body: PaginatedListView<OrderModel>(
        fetchData: (page) => controller.getMyOrders(page: page),
        child: (index) => OrderItem(controller.myOrders[index]),
        onListItemsChange: (orders) => controller.myOrders(orders),
        padding: const EdgeInsets.all(AppPadding.p24),
        separator: (index) => const VerticalSpace(AppSize.s32),
      ),
    );
  }
}
