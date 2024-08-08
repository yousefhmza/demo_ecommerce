import 'package:get/get.dart';

import '../../../di_container.dart';
import '../controller/category_products_controller.dart';

class CategoryProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<CategoryProductsController>());
  }
}