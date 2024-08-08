import '../../config/navigation/navigation.dart';
import '../resources/resources.dart';
import 'globals.dart';
import 'package:get/get.dart';

import '../view/views.dart';

class Utils {
  static void invokeIfAuthenticated({required Function callback, Function? beforeAuthCallback}) {
    if (currentUser.value != null) {
      callback();
    } else {
      Get.dialog(
        ConfirmationDialog(
          title: AppStrings.notLoggedInDesc.tr,
          onYes: () {
            if (beforeAuthCallback != null) beforeAuthCallback();
            Get.toNamed(Routes.loginScreen);
          },
          cancellationText: AppStrings.cancel.tr,
          confirmationText: AppStrings.lblLogin.tr,
        ),
      );
    }
  }
}
