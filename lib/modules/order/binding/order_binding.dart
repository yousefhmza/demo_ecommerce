import '../../../di_container.dart';
import '../controller/order_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<OrderController>());
  }
}
