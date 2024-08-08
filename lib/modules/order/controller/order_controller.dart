import '../../../core/resources/resources.dart';
import '../../../core/services/payment/payment_service_interface.dart';
import '../../../core/utils/alerts.dart';
import '../models/requests/order_body.dart';
import '../models/responses/shipping_cost_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../cart/models/requests/cart_product_model.dart';
import '../models/requests/shipping_cost_body.dart';
import '../models/responses/payment_gateway_model.dart';
import '../repos/orders_repo.dart';

class OrderController extends GetxController {
  final OrdersRepo _ordersRepo;

  OrderController(this._ordersRepo);

  late final OrderBody orderBody;
  late final List<CartProduct> products;
  late num subtotal;

  RxBool isLoading = false.obs;
  RxBool isFetchingShippingCost = false.obs;
  RxBool isApplyingCoupon = false.obs;
  Rx<ShippingCostModel?> shippingCost = Rx(null);
  RxNum couponDiscount = RxNum(0);
  final TextEditingController couponController = TextEditingController();
  RxList<PaymentGateway> paymentGateways = RxList([]);
  PaymentServiceInterface? paymentService;

  @override
  void onInit() {
    super.onInit();
    products = Get.arguments["products"];
    subtotal = Get.arguments["subtotal"];
    orderBody = OrderBody(products: products);
    getPaymentGateways();
  }

  Future<void> createOrder() async {
    isLoading(true);
    final result = await _ordersRepo.createOrder(orderBody);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (order) {
        if (paymentService != null) {
          final num shippingFees = shippingCost.value?.defaultShippingOptions.options.cost ?? 0;
          paymentService!.pay(
            totalPrice: shippingFees + subtotal - couponDiscount.value,
            name: order.name,
            phone: order.phone,
            email: order.email,
            onPaymentSuccess: () => completeOrderPayment(order.id),
          );
        } else {
          Get.back(result: true);
        }
      },
    );
    isLoading(false);
  }

  Future<void> completeOrderPayment(int orderId) async {
    final result = await _ordersRepo.completeOrderPayment(orderId: orderId);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: () => completeOrderPayment(orderId)),
      (message) => Get.back(result: true),
    );
  }

  Future<void> getShippingCost(ShippingCostBody shippingCostBody) async {
    isFetchingShippingCost(true);
    final result = await _ordersRepo.getShippingCost(shippingCostBody);
    result.fold(
      (failure) => Alerts.showSnackBar(
        message: failure.message,
        onActionPressed: () => getShippingCost(shippingCostBody),
      ),
      (shippingCost) {
        this.shippingCost(shippingCost);
        orderBody.copyWith(shippingMethodId: shippingCost.defaultShippingOptions.options.shippingMethodId);
      },
    );
    isFetchingShippingCost(false);
  }

  Future<void> applyCoupon() async {
    if (couponController.text.trim().isEmpty) {
      Alerts.showToast(AppStrings.pleaseWriteValidCoupon.tr);
      return;
    }
    isApplyingCoupon(true);
    final result = await _ordersRepo.applyCoupon(
      coupon: couponController.text.trim(),
      subTotal: subtotal,
      productsIds: products
          .map((product) => {"id": product.productId!, "price": product.priceWithAttr ?? product.discountPrice})
          .toList(),
    );
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (priceAfterDiscount) {
        FocusManager.instance.primaryFocus?.unfocus();
        couponDiscount(subtotal - priceAfterDiscount);
        couponController.clear();
        orderBody.copyWith(usedCoupon: couponController.text.trim());
      },
    );
    isApplyingCoupon(false);
  }

  Future<void> getPaymentGateways() async {
    final result = await _ordersRepo.getPaymentGateways();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getPaymentGateways),
      (paymentGateways) => this.paymentGateways(paymentGateways),
    );
  }
}
