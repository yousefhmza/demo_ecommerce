import '../../../di_container.dart';
import '../controller/choose_on_map_controller.dart';
import 'package:get/get.dart';

class ChooseOnMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<ChooseOnMapController>());
  }
}
