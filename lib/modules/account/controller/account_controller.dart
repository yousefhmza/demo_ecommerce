import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_strings.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../models/requests/edit_account_body.dart';
import '../repositories/account_repo.dart';

class AccountController extends GetxController {
  final AccountRepo _accountRepo;

  AccountController(this._accountRepo);

  late final EditAccountBody editAccountBody;
  RxBool isEditingAccount = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    editAccountBody = EditAccountBody(
      fullName: currentUser.value!.name,
      cityId: currentUser.value!.userCity.id == 0 ? null : currentUser.value!.userCity.id,
      countryId: currentUser.value!.userCountry.id == 0 ? null : currentUser.value!.userCountry.id,
      image: currentUser.value!.profileImageUrl.isNotEmpty ? currentUser.value!.profileImageUrl : null,
      mobile: currentUser.value!.mobile,
      stateId: currentUser.value!.userState.id == 0 ? null : currentUser.value!.userState.id,
      zipCode: currentUser.value!.postalCode,
      email: currentUser.value!.email,
    );
  }

  Future<void> editAccount() async {
    if (!formKey.currentState!.validate()) return;
    isEditingAccount(true);
    final result = await _accountRepo.editAccount(editAccountBody);
    result.fold(
      (failure) {
        Alerts.showSnackBar(message: failure.message);
        isEditingAccount(false);
      },
      (_) => getProfile(),
    );
  }

  Future<void> getProfile() async {
    isEditingAccount(true);
    final result = await _accountRepo.getProfile();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getProfile),
      (user) {
        Alerts.showToast(AppStrings.accountDataUpdatedSuccessfully.tr);
        currentUser(user);
        Get.back();
      },
    );
    isEditingAccount(false);
  }
}
