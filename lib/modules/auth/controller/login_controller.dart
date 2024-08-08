import '../../../core/utils/globals.dart';
import '../models/requests/login_body.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../repositories/auth_repo.dart';
import '../../../core/utils/alerts.dart';
import '../../../config/navigation/navigation.dart';

class LoginController extends GetxController {
  final AuthRepo _authRepo;

  LoginController(this._authRepo);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginBody loginBody = LoginBody();
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading(true);
    final result = await _authRepo.login(loginBody);
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
