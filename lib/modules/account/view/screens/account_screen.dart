import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/utils/validators.dart';
import '../components/pick_profile_image_component.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/view/views.dart';
import '../../../regions/views/components/regions_component.dart';
import '../../controller/account_controller.dart';
import 'package:flutter/material.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblAccount.tr),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p24),
            child: Column(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => Center(
                    child: PickProfileImageComponent(
                      icon: const CustomIcon(Icons.camera, color: AppColors.white, size: AppSize.s12),
                      image: controller.editAccountBody.image,
                      onPickImage: (image) => setState(() => controller.editAccountBody.copyWith(image: image)),
                    ),
                  ),
                ),
                VerticalSpace(24.v),
                CustomTextField(
                  initialValue: controller.editAccountBody.fullName,
                  hintText: AppStrings.lblFullName.tr,
                  suffix: CustomImage(image: AppImages.imgIconUser, height: 24.adaptSize, width: 24.adaptSize),
                  validator: Validators.nameValidator,
                  onChanged: (value) => controller.editAccountBody.copyWith(fullName: value),
                ),
                VerticalSpace(24.v),
                CustomTextField(
                  initialValue: controller.editAccountBody.email,
                  hintText: AppStrings.msgMohamedaliGmailCom.tr,
                  keyBoardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  suffix: CustomImage(image: AppImages.imgIconMail, height: 24.adaptSize, width: 24.adaptSize),
                  validator: Validators.emailValidator,
                  onChanged: (value) => controller.editAccountBody.copyWith(email: value),
                ),
                VerticalSpace(24.v),
                RegionsComponent(
                  cityInitId: controller.editAccountBody.cityId,
                  countryInitId: controller.editAccountBody.countryId,
                  stateInitId: controller.editAccountBody.stateId,
                  onChangeCountry: (country) => controller.editAccountBody.copyWith(countryId: country.id),
                  onChangeState: (state) => controller.editAccountBody.copyWith(stateId: state.id),
                  onChangeCity: (city) => controller.editAccountBody.copyWith(cityId: city.id),
                ),
                VerticalSpace(24.v),
                CustomTextField(
                  initialValue: controller.editAccountBody.zipCode,
                  hintText: AppStrings.lblPostalCode.tr,
                  validator: Validators.required,
                  onChanged: (value) => controller.editAccountBody.copyWith(zipCode: value),
                ),
                VerticalSpace(24.v),
                CustomTextField(
                  initialValue: controller.editAccountBody.mobile,
                  hintText: AppStrings.lblPhone.tr,
                  validator: (value) => Validators.mobileNumberValidator(value),
                  keyBoardType: TextInputType.phone,
                  onChanged: (value) => controller.editAccountBody.copyWith(mobile: value),
                ),
                SizedBox(height: 32.v),
                Obx(
                  () => CustomButton(
                    isLoading: controller.isEditingAccount.value,
                    text: AppStrings.confirm.tr.toUpperCase(),
                    buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.editAccount();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
