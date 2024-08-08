import '../models/requests/register_body.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/navigation/navigation.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../repositories/auth_repo.dart';

class RegistrationController extends GetxController {
  final AuthRepo _authRepo;

  RegistrationController(this._authRepo);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegisterBody registerBody = RegisterBody();
  RxBool showPassword = false.obs;
  RxBool showPasswordConfirmation = false.obs;
  RxBool isLoading = false.obs;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    isLoading(true);
    final result = await _authRepo.register(registerBody);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (user) {
        currentUser(user);
        Get.offAllNamed(Routes.layoutScreen);
      },
    );
    isLoading(false);
  }
}
