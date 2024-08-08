import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../widgets/address_card.dart';
import 'package:get/get.dart';

import '../../controller/addresses_controller.dart';
import 'package:flutter/material.dart';

class AddressesScreen extends GetWidget<AddressesController> {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblAddresses.tr),
      body: Obx(
        () {
          controller.addresses.value;
          return controller.isLoading.value
              ? const LoadingSpinner()
              : Padding(
                  key: UniqueKey(),
                  padding: const EdgeInsets.all(AppPadding.p24),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AddressCard(address: controller.addresses[index]),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.addresses.length,
                      ),
                      const Spacer(),
                      SafeArea(
                        child: CustomButton(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                AppStrings.lblAddNewAddress.tr,
                                style: const TextStyle(color: AppColors.white, fontWeight: FontWeightManager.bold),
                              ),
                              const HorizontalSpace(AppSize.s4),
                              const CustomIcon.svg(AppImages.imgAddButton),
                            ],
                          ),
                          onPressed: () async {
                            final address = await Get.toNamed(
                              Routes.addressFormScreen,
                              arguments: {"address": controller.addresses.isEmpty ? null : controller.addresses[0]},
                            );
                            if (address != null) {
                              controller.addresses.clear();
                              controller.addresses.add(address);
                              controller.addresses.refresh();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
