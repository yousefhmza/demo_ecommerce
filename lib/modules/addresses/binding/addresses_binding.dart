import '../controller/addresses_controller.dart';
import 'package:get/get.dart';
import '../../../di_container.dart';

class AddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<AddressesController>());
  }
}
