import '../controller/my_orders_controller.dart';
import 'package:get/get.dart';

import '../../../di_container.dart';

class MyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<MyOrdersController>());
  }
}