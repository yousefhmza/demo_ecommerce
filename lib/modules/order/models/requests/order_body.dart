import 'dart:convert';

import '../../../../core/extensions/non_null_extensions.dart';
import '../../../../core/resources/resources.dart';
import '../../../addresses/models/responses/address_model.dart';
import 'package:get/get.dart';

import '../../../cart/models/requests/cart_product_model.dart';

class OrderBody {
  final List<CartProduct> products;
  Address? address;
  String? message;
  String? usedCoupon;
  String? paymentGateway;
  int? shippingMethodId;

  OrderBody({
    required this.products,
    this.address,
    this.message,
    this.usedCoupon,
    this.paymentGateway,
    this.shippingMethodId,
  });

  void copyWith({
    Address? address,
    String? message,
    String? usedCoupon,
    String? paymentGateway,
    int? shippingMethodId,
  }) {
    this.address = address ?? this.address;
    this.message = message ?? this.message;
    this.usedCoupon = usedCoupon ?? this.usedCoupon;
    this.paymentGateway = paymentGateway ?? this.paymentGateway;
    this.shippingMethodId = shippingMethodId ?? this.shippingMethodId;
  }

  String? validate() {
    if (address == null || shippingMethodId == null) {
      return AppStrings.msgChooseAddress.tr;
    }
    if (paymentGateway == null) {
      return AppStrings.msgSelectPaymentGateway.tr;
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, Map<String, dynamic>> cartProducts = {};
    for (var product in products) {
      cartProducts.addAll(product.toOrderJson());
    }
    return {
      if (address != null) 'name': address!.fullName,
      if (address != null) 'email': address!.email,
      if (address != null) 'phone': address!.phone,
      if (address != null) 'country': address!.countryId,
      if (address != null) 'state': address!.stateId,
      if (address != null) 'address': address!.address,
      if (address != null) 'city': address!.cityId,
      if (shippingMethodId != null) 'shipping_method': shippingMethodId,
      'used_coupon': usedCoupon.orEmpty,
      'message': message.orEmpty,
      if (paymentGateway != null) 'payment_gateway': paymentGateway,
      // 'manual_trasaction_id': transactionId,
      // 'bank_payment_input': imagePath !=null ? await MultipartFile.fromFile(imagePath,
      //     filename: '${address['name']}$imagePath.jpg') : null,
      'cart': jsonEncode(cartProducts),
    };
  }
}
