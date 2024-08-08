import '../../../di_container.dart';
import '../controller/registration_controller.dart';
import 'package:get/get.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<RegistrationController>());
  }
}
