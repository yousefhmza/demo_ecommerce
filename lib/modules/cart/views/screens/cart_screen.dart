import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/utils/globals.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/view/views.dart';
import '../components/empty_cart_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/theme.dart';
import '../../controller/shopping_cart_controller.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.getCartProducts());
    return Column(
      children: [
        MainAppbar(
          title: "lbl_cart".tr,
          showDefaultBackButton: false,
          actions: [
            Obx(
              () => controller.cartProductsList.isEmpty
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => ConfirmationDialog(
                          title: AppStrings.msgSureClearingCart.tr,
                          onYes: () => controller.clearCart(),
                        ),
                      ),
                      child: const CustomImage(image: AppImages.imgIconTrash),
                    ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: CustomScrollView(
              slivers: [
                const VerticalSpace.sliver(AppSize.s16),
                Obx(
                  () => controller.cartProductsList.isEmpty
                      ? const SliverFillRemaining(hasScrollBody: false, child: EmptyCartComponent())
                      : SliverList.separated(
                          key: UniqueKey(),
                          separatorBuilder: (context, index) => const VerticalSpace(AppSize.s16),
                          itemCount: controller.cartProductsList.length,
                          itemBuilder: (context, index) =>
                              settings.getCartItem(cartProduct: controller.cartProductsList[index]),
                        ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      const VerticalSpace(AppSize.s24),
                      Obx(
                        () => controller.totalPrice.value == 0.0
                            ? const SizedBox.shrink()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_total_products".tr, style: CustomTextStyles.labelLargeBlack900),
                                  Text(
                                    "${AppStrings.usd.tr} ${controller.totalPrice.value.toStringAsFixed(2)}",
                                    style: Get.theme.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                      ),
                      Obx(
                        () => controller.cartProductsList.isEmpty
                            ? const SizedBox.shrink()
                            : CustomButton(
                                margin: const EdgeInsets.only(top: AppSize.s24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      "lbl_continuer_order".tr,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeightManager.bold,
                                        fontSize: FontSize.s14,
                                      ),
                                    ),
                                    CustomImage(
                                      image: AppImages.imgArrowright,
                                      height: 25.adaptSize,
                                      width: 25.adaptSize,
                                    )
                                  ],
                                ),
                                onPressed: () => Utils.invokeIfAuthenticated(
                                  callback: () async {
                                    final orderedSuccessfully = await Get.toNamed(
                                      Routes.orderScreen,
                                      arguments: {
                                        "products": controller.cartProductsList,
                                        "subtotal": controller.totalPrice.value
                                      },
                                    );
                                    if (orderedSuccessfully != null && orderedSuccessfully) {
                                      await controller.clearCart();
                                      Get.toNamed(Routes.successfulOrderScreen);
                                    }
                                  },
                                ),
                              ),
                      ),
                      SizedBox(height: 23.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
