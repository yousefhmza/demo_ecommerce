import '../../../../config/navigation/navigation.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/utils/globals.dart';
import '../../../../core/utils/utils.dart';
import '../widgets/option_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppbar(title: AppStrings.lblSettings.tr, showDefaultBackButton: false),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentUser.value == null
                    ? const NotLoggedInComponent()
                    : Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                          child: Row(
                            children: [
                              CustomImage(
                                image: currentUser.value!.profileImageUrl,
                                height: 75.adaptSize,
                                width: 75.adaptSize,
                                borderRadius: AppSize.s250,
                              ),
                              HorizontalSpace(AppSize.s12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(currentUser.value!.name, style: CustomTextStyles.titleMediumSemiBold_1),
                                    const VerticalSpace(AppSize.s4),
                                    Text(currentUser.value!.email, style: CustomTextStyles.bodyMediumGray60001)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: 24.v),
                const Divider(color: AppColors.gray300),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.h, vertical: AppPadding.p16.h)
                      .copyWith(bottom: AppPadding.p0),
                  child: CustomText(AppStrings.lblGeneral.tr, style: CustomTextStyles.bodyMediumGray60001),
                ),
                OptionItem(
                  text: AppStrings.msgAccountSettings.tr,
                  onTap: () => Utils.invokeIfAuthenticated(callback: () => Get.toNamed(Routes.accountScreen)),
                ),
                OptionItem(
                  text: AppStrings.lblMyOrders.tr,
                  onTap: () => Utils.invokeIfAuthenticated(callback: () => Get.toNamed(Routes.myOrdersScreen)),
                ),
                OptionItem(
                  text: AppStrings.lblAddresses.tr,
                  onTap: () => Utils.invokeIfAuthenticated(
                    callback: () => Get.toNamed(Routes.addressesScreen, arguments: {"from_checkout_screen": false}),
                  ),
                ),
                OptionItem(
                  text: AppStrings.lblNotifications.tr,
                  onTap: () => Utils.invokeIfAuthenticated(callback: () {}),
                ),
                OptionItem(
                  text: AppStrings.lblLanguage.tr,
                  onTap: () => Get.toNamed(Routes.languageScreen),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.h, vertical: AppPadding.p16.h)
                      .copyWith(bottom: AppPadding.p0),
                  child: CustomText(AppStrings.lblLegal.tr, style: CustomTextStyles.bodyMediumGray60001),
                ),
                OptionItem(
                  text: AppStrings.msgTermsConditions.tr,
                  onTap: () => Get.toNamed(Routes.termsAndConditionsScreen),
                ),
                OptionItem(
                  text: AppStrings.lblAboutUs.tr,
                  showDivider: currentUser.value != null,
                  onTap: () {},
                ),
                if (currentUser.value != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.h, vertical: AppPadding.p16.h)
                        .copyWith(bottom: AppPadding.p0),
                    child: CustomText(AppStrings.lblPrivate.tr, style: CustomTextStyles.bodyMediumGray60001),
                  ),
                if (currentUser.value != null)
                  OptionItem(
                    text: AppStrings.lblSignOut.tr,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                        title: AppStrings.msgSureSignOut.tr,
                        onYes: () => Get.offAllNamed(Routes.loginScreen),
                      ),
                    ),
                    showDivider: false,
                    isBold: true,
                    color: AppColors.red500,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
