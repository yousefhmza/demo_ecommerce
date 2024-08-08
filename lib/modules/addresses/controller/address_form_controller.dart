import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../models/requests/address_body.dart';
import '../models/responses/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repos/addresses_repo.dart';

class AddressFormController extends GetxController {
  final AddressesRepo _addressesRepo;

  AddressFormController(this._addressesRepo);

  late final TextEditingController addressTextController;
  Address? address;
  late final AddressBody addressBody;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    address = Get.arguments["address"];
    addressBody = AddressBody(
      address: address?.address,
      countryId: address?.countryId ?? currentUser.value!.userCountry.id,
      cityId: address?.cityId ?? currentUser.value!.userCity.id,
      email: address?.email ?? currentUser.value!.email,
      fullName: address?.fullName,
      phone: address?.phone ?? currentUser.value!.mobile,
      postalCode: address?.postCode ?? currentUser.value!.postalCode,
      shippingAddressName: address?.fullName,
      stateId: address?.stateId ?? currentUser.value!.userState.id,
      userId: address?.userId ?? currentUser.value!.id,
    );
    addressTextController = TextEditingController(text: addressBody.address);
  }

  Future<void> addOrUpdateAddress() async {
    isLoading(true);
    final result = await _addressesRepo.addOrUpdateAddress(addressBody: addressBody);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (address) => Get.back(result: address),
    );
    isLoading(false);
  }
}
