import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/utils.dart';
import '../widgets/drawer_option_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/utils/globals.dart';
import '../../../../core/view/views.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              currentUser.value == null
                  ? const NotLoggedInComponent()
                  : InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.accountScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                        child: Row(
                          children: [
                            CustomImage(
                              image: currentUser.value!.profileImageUrl,
                              height: AppSize.s48,
                              width: AppSize.s48,
                              borderRadius: AppSize.s250,
                            ),
                            const HorizontalSpace(AppSize.s12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(currentUser.value!.name, style: CustomTextStyles.titleMediumSemiBold_1),
                                  CustomText(
                                    currentUser.value!.email,
                                    style: CustomTextStyles.bodyMediumGray60001,
                                    maxLines: 1,
                                    autoSized: true,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              if (currentUser.value != null) const VerticalSpace(AppSize.s32),
              DrawerOptionItem(
                text: AppStrings.lblAddresses.tr,
                icon: Icons.location_on_outlined,
                onTap: () => Utils.invokeIfAuthenticated(
                  callback: () {
                    Get.back();
                    Get.toNamed(Routes.addressesScreen, arguments: {"from_checkout_screen": false});
                  },
                ),
              ),
              DrawerOptionItem(
                text: AppStrings.lblMyOrders.tr,
                icon: Icons.shopping_cart_checkout,
                onTap: () => Utils.invokeIfAuthenticated(
                  callback: () {
                    Get.back();
                    Get.toNamed(Routes.myOrdersScreen);
                  },
                ),
              ),
              DrawerOptionItem(
                text: AppStrings.lblNotifications.tr,
                icon: Icons.notifications_active_outlined,
                onTap: () => Utils.invokeIfAuthenticated(
                  callback: () {
                    Get.back();
                  },
                ),
              ),
              DrawerOptionItem(
                text: AppStrings.lblLanguage.tr,
                icon: Icons.language,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.languageScreen);
                },
              ),
              DrawerOptionItem(
                text: AppStrings.msgTermsConditions.tr,
                icon: Icons.request_page_outlined,
                onTap: () {
                  Get.back();
                },
              ),
              DrawerOptionItem(
                text: AppStrings.lblAboutUs.tr,
                icon: Icons.document_scanner,
                onTap: () {
                  Get.back();
                },
              ),
              if (currentUser.value != null)
                DrawerOptionItem(
                  text: AppStrings.lblSignOut.tr,
                  icon: Icons.logout,
                  color: AppColors.error,
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => ConfirmationDialog(
                      title: AppStrings.msgSureSignOut.tr,
                      onYes: () => Get.toNamed(Routes.loginScreen),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
