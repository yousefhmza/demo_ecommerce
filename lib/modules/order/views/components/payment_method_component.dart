import '../../../../core/services/payment/paypal_payment.dart';
import '../../controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../widgets/payment_method_widget.dart';

class PaymentMethodComponent extends GetWidget<OrderController> {
  const PaymentMethodComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.paymentGateways.isEmpty
          ? const SizedBox.shrink()
          : Theme(
              data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.zero,
                tilePadding: EdgeInsets.zero,
                title: CustomText(AppStrings.msgChoosePaymentMethod.tr, style: Get.theme.textTheme.titleMedium),
                children: [
                  StatefulBuilder(
                    builder: (context, setState) => GridView.builder(
                      padding: const EdgeInsets.only(top: AppPadding.p16),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: AppSize.s12,
                        crossAxisSpacing: AppSize.s12,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) => PaymentMethodWidget(
                        gateway: controller.paymentGateways[index],
                        isSelected: controller.orderBody.paymentGateway == controller.paymentGateways[index].name,
                        onTap: () {
                          switch (controller.paymentGateways[index].name) {
                            case "paypal":
                              controller.paymentService = PaypalPayment(controller.paymentGateways[index]);
                              break;
                            default:
                              controller.paymentService = null;
                              break;
                          }

                          setState(
                            () => controller.orderBody.copyWith(paymentGateway: controller.paymentGateways[index].name),
                          );
                        },
                      ),
                      itemCount: controller.paymentGateways.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
