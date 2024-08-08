import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import '../../../regions/views/components/regions_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../config/theme/theme.dart';
import '../../../../core/utils/validators.dart';
import '../../controller/registration_controller.dart';

class RegistrationScreen extends GetWidget<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 27.v),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: AppStrings.lblFullName.tr,
                    suffix: CustomImage(image: AppImages.imgIconUser, height: 24.adaptSize, width: 24.adaptSize),
                    validator: Validators.nameValidator,
                    onChanged: (value) => controller.registerBody.copyWith(fullName: value),
                  ),
                  VerticalSpace(24.v),
                  CustomTextField(
                    hintText: AppStrings.lblUserName.tr,
                    suffix: CustomImage(image: AppImages.imgIconUser, height: 24.adaptSize, width: 24.adaptSize),
                    validator: Validators.nameValidator,
                    onChanged: (value) => controller.registerBody.copyWith(userName: value),
                  ),
                  VerticalSpace(24.v),
                  CustomTextField(
                    hintText: AppStrings.msgMohamedaliGmailCom.tr,
                    keyBoardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    suffix: CustomImage(image: AppImages.imgIconMail, height: 24.adaptSize, width: 24.adaptSize),
                    validator: Validators.emailValidator,
                    onChanged: (value) => controller.registerBody.copyWith(email: value),
                  ),
                  VerticalSpace(24.v),
                  RegionsComponent(
                    onChangeCountry: (country) => controller.registerBody.copyWith(countryId: country.id.toString()),
                    onChangeState: (state) => controller.registerBody.copyWith(stateId: state.id.toString()),
                    onChangeCity: (city) => controller.registerBody.copyWith(cityId: city.id.toString()),
                  ),
                  VerticalSpace(24.v),
                  CustomTextField(
                    hintText: AppStrings.lblPostalCode.tr,
                    validator: Validators.required,
                    onChanged: (value) => controller.registerBody.copyWith(zipCode: value),
                  ),
                  VerticalSpace(24.v),
                  CustomTextField(
                    hintText: AppStrings.lblPhone.tr,
                    validator: (value) => Validators.mobileNumberValidator(value),
                    keyBoardType: TextInputType.phone,
                    onChanged: (value) => controller.registerBody.copyWith(mobile: value),
                  ),
                  VerticalSpace(24.v),
                  Obx(
                    () => CustomTextField(
                      hintText: AppStrings.lbl3.tr,
                      keyBoardType: TextInputType.visiblePassword,
                      suffix: InkWell(
                        onTap: () => controller.showPassword.value = !controller.showPassword.value,
                        child: CustomImage(
                          image: controller.showPassword.value ? AppImages.imgViewhidelight : AppImages.imgViewlight,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                      validator: Validators.passwordValidator,
                      obscureText: !controller.showPassword.value,
                      onChanged: (value) => controller.registerBody.copyWith(password: value),
                    ),
                  ),
                  SizedBox(height: 24.v),
                  Obx(
                    () => CustomTextField(
                      hintText: AppStrings.msgReTypePassword.tr,
                      textInputAction: TextInputAction.done,
                      keyBoardType: TextInputType.visiblePassword,
                      suffix: InkWell(
                        onTap: () =>
                            controller.showPasswordConfirmation.value = !controller.showPasswordConfirmation.value,
                        child: CustomImage(
                          image: controller.showPasswordConfirmation.value
                              ? AppImages.imgViewhidelight
                              : AppImages.imgViewlight,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                      validator: (input) =>
                          Validators.passwordConfirmationValidator(input, controller.registerBody.password),
                      obscureText: !controller.showPasswordConfirmation.value,
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Obx(
                    () => CustomButton(
                      isLoading: controller.isLoading.value,
                      text: AppStrings.lblCreateAccount.tr.toUpperCase(),
                      buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.register();
                      },
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Container(
                    width: 307.h,
                    margin: EdgeInsets.symmetric(horizontal: 9.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.msgByPressingOnButton2.tr,
                            style: CustomTextStyles.labelMediumBlack900Medium,
                          ),
                          WidgetSpan(
                            child: InkWell(
                              onTap: () => Get.toNamed(Routes.termsAndConditionsScreen),
                              child: CustomText(
                                AppStrings.msgTermsConditions.tr,
                                style: CustomTextStyles.labelMediumMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40.v),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: AppStrings.msgAlreadyHaveAn2.tr, style: Get.theme.textTheme.bodyMedium),
                          TextSpan(
                            text: AppStrings.lblLogin.tr,
                            style:
                                CustomTextStyles.titleSmallPrimaryBold.copyWith(decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
