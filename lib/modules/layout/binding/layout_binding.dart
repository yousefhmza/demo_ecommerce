import '../../cart/controller/shopping_cart_controller.dart';
import '../../home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../di_container.dart';
import '../../categories/controller/categories_controller.dart';
import '../controller/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<LayoutController>());
    Get.lazyPut(() => sl<CategoriesController>());
    Get.lazyPut(() => sl<HomeController>());
    Get.lazyPut(() => sl<CartController>());
  }
}