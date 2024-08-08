import 'package:get/get.dart';
import '../../../di_container.dart';
import '../controller/address_form_controller.dart';

class AddressFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<AddressFormController>());
  }
}
