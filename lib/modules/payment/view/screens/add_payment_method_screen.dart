import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import '../../../../core/view/widgets/main_appbar.dart';
import '../widgets/payment_method_item.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../controller/add_payment_method_controller.dart';

class AddPaymentMethodScreen extends GetWidget<AddPaymentMethodController> {
  const AddPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.msgAddNewPayment.tr),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 12.v),
        child: Column(
          children: [
            PaymentMethodItem(image: AppImages.imgLogosVisa, isSelected: true),
            PaymentMethodItem(image: AppImages.imgFrameCyan900),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        height: 40.v,
        text: "lbl_continue".tr,
        margin: EdgeInsets.all(24),
        onPressed: () => Get.toNamed(Routes.addCardScreen),
      ),
    );
  }
}
