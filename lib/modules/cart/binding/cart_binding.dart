import '../controller/shopping_cart_controller.dart';

import '../../../di_container.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<CartController>());
  }
}
