import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/utils/alerts.dart';
import '../components/order_address_component.dart';
import '../components/payment_method_component.dart';
import '../widgets/order_price_details_row.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/view/views.dart';
import '../../controller/order_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/order_product_item.dart';

class OrderScreen extends GetWidget<OrderController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblContinueOrder.tr),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24, vertical: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: AppSize.s10.v),
                itemCount: controller.orderBody.products.length,
                itemBuilder: (context, index) => OrderProductItem(controller.orderBody.products[index]),
              ),
              VerticalSpace(AppSize.s24.v),
              const Divider(height: AppSize.s1, color: AppColors.gray200),
              VerticalSpace(AppSize.s24.v),
              OrderAddressComponent(),
              VerticalSpace(AppSize.s24.v),
              const Divider(height: AppSize.s1, color: AppColors.gray200),
              PaymentMethodComponent(),
              const VerticalSpace(AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: AppStrings.lblPromoCode.tr,
                      controller: controller.couponController,
                      prefix: const CustomIcon.svg(AppImages.imgFireflyFillTicket),
                    ),
                  ),
                  const HorizontalSpace(AppSize.s12),
                  Obx(
                    () => CustomButton(
                      isLoading: controller.isApplyingCoupon.value,
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28, vertical: AppPadding.p12),
                      text: AppStrings.lblApply.tr,
                      buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                      onPressed: controller.applyCoupon,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(AppSize.s20),
              CustomTextField(
                hintText: AppStrings.lblNotes.tr,
                minLines: 1,
                maxLines: 5,
                onChanged: (value) => controller.orderBody.copyWith(message: value),
                textInputAction: TextInputAction.done,
              ),
              const VerticalSpace(AppSize.s20),
              Obx(
                () {
                  controller.shippingCost.value;
                  final num shippingFees = controller.shippingCost.value?.defaultShippingOptions.options.cost ?? 0;
                  final num couponDiscount = controller.couponDiscount.value;
                  final num total = shippingFees + controller.subtotal - couponDiscount;
                  return Column(
                    children: [
                      OrderPriceDetailsRow(
                        title: AppStrings.lblSubtotal.tr,
                        price: controller.subtotal.toStringAsFixed(2),
                      ),
                      const VerticalSpace(AppSize.s10),
                      OrderPriceDetailsRow(title: AppStrings.lblTaxes.tr, price: "0"),
                      const VerticalSpace(AppSize.s10),
                      OrderPriceDetailsRow(title: AppStrings.discount.tr, price: couponDiscount.toStringAsFixed(2)),
                      const VerticalSpace(AppSize.s10),
                      OrderPriceDetailsRow(
                        title: AppStrings.lblDeliveryFees.tr,
                        price: shippingFees.toStringAsFixed(2),
                      ),
                      const VerticalSpace(AppSize.s10),
                      OrderPriceDetailsRow(title: AppStrings.lblTotal.tr, price: total.toStringAsFixed(2)),
                      const VerticalSpace(AppSize.s16),
                      Obx(
                        () => CustomButton(
                          isLoading: controller.isLoading.value,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                AppStrings.lblContinueOrder.tr,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeightManager.bold,
                                    ),
                              ),
                              const CustomIcon.svg(AppImages.imgArrowright)
                            ],
                          ),
                          onPressed: () {
                            final String? errorMessage = controller.orderBody.validate();
                            if (errorMessage != null) {
                              Alerts.showToast(errorMessage);
                              return;
                            }
                            controller.createOrder();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
