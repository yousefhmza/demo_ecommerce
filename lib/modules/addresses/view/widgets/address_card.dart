import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../controller/addresses_controller.dart';
import '../../models/responses/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/view/views.dart';

class AddressCard extends GetWidget<AddressesController> {
  final Address address;

  const AddressCard({required this.address, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.fromCheckoutScreen) Get.back(result: address);
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address.address, style: CustomTextStyles.labelLargeBlack900_1.copyWith(color: AppColors.black)),
                SizedBox(height: 2.v),
                Text(
                  address.fullName,
                  style: Get.theme.textTheme.bodySmall!.copyWith(color: AppColors.black),
                )
              ],
            ),
          ),
          const HorizontalSpace(AppSize.s16),
          Obx(
            () => controller.deletingAddressNumber.value == address.id
                ? const LoadingSpinner(hasSmallRadius: true)
                : InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                        title: AppStrings.msgSureDeletingAddress.tr,
                        onYes: () => controller.deleteAddress(address.id),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(AppPadding.p8),
                      child: CustomIcon.svg(AppImages.imgIconTrash2),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
