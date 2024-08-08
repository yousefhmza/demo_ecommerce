import 'package:get/get.dart';

import '../../../di_container.dart';
import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<SearchController>());
  }
}