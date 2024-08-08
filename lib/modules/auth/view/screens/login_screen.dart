import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import '../../controller/login_controller.dart';
import 'package:get/get.dart';

import '../../../../config/theme/custom_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/validators.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p24),
                child: Column(
                  children: [
                    const VerticalSpace(8),
                    Text("NIZK", style: Theme.of(context).textTheme.displayMedium),
                    Text("Nizk App", style: CustomTextStyles.titleSmallCairo),
                    const VerticalSpace(46),
                    Text(AppStrings.lblHello.tr, style: Theme.of(context).textTheme.headlineSmall),
                    const VerticalSpace(18),
                    CustomTextField(
                      keyBoardType: TextInputType.emailAddress,
                      hintText: AppStrings.msgMohamedaliGmailCom.tr,
                      suffix: CustomImage(image: AppImages.imgIconMail, height: 24.adaptSize, width: 24.adaptSize),
                      validator: Validators.emailValidator,
                      onChanged: (value) => controller.loginBody.copyWith(email: value),
                    ),
                    const VerticalSpace(20),
                    Obx(
                      () => CustomTextField(
                        hintText: AppStrings.lblPassword.tr,
                        keyBoardType: TextInputType.visiblePassword,
                        suffix: InkWell(
                          onTap: () => controller.showPassword.value = !controller.showPassword.value,
                          child: CustomImage(
                            image: controller.showPassword.value ? AppImages.imgViewhidelight : AppImages.imgViewlight,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                        // validator: Validators.passwordValidator,
                        obscureText: !controller.showPassword.value,
                        onChanged: (value) => controller.loginBody.copyWith(password: value),
                      ),
                    ),
                    const VerticalSpace(22),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(AppStrings.msgForgotPassword.tr, style: Theme.of(context).textTheme.titleSmall),
                    ),
                    const VerticalSpace(22),
                    Obx(
                      () => CustomButton(
                        isLoading: controller.isLoading.value,
                        text: AppStrings.lblLogin.tr,
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.login();
                        },
                      ),
                    ),
                    const VerticalSpace(33),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.layoutScreen),
                      child: Text(AppStrings.msgContinueWithout.tr, style: CustomTextStyles.titleSmallSemiBold),
                    ),
                    const VerticalSpace(82),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 9, bottom: 6),
                          child: SizedBox(width: 106.h, child: const Divider(color: AppColors.black)),
                        ),
                        CustomText(AppStrings.lblOrLoginWith.tr, style: Theme.of(context).textTheme.titleSmall),
                        Padding(
                          padding: const EdgeInsets.only(top: 9, bottom: 6),
                          child: SizedBox(width: 106.h, child: const Divider(color: AppColors.black)),
                        )
                      ],
                    ),
                    const VerticalSpace(24),
                    CustomButton(
                      isOutlined: true,
                      color: AppColors.gray40001,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 12.h),
                            child: CustomImage(image: AppImages.imgSearch, height: 20.adaptSize, width: 20.adaptSize),
                          ),
                          CustomText(
                            AppStrings.msgLoginWithGoogle.tr,
                            style: Theme.of(context).textTheme.bodyMedium!,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    const VerticalSpace(42),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.registrationScreen),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: AppStrings.lblNewHere.tr, style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(
                              text: AppStrings.msgCreateNewAccount.tr,
                              style:
                                  CustomTextStyles.titleSmallPrimaryBold.copyWith(decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
