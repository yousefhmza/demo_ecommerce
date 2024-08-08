import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../core/base/models/pagination_model.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/requests/shipping_cost_body.dart';

import '../models/responses/order_model.dart';
import '../models/responses/payment_gateway_model.dart';
import '../models/responses/shipping_cost_model.dart';

import '../models/requests/order_body.dart';

class OrdersRepo extends BaseRepository {
  final ApiClient _apiClient;

  OrdersRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, OrderModel>> createOrder(OrderBody orderBody) async {
    return super.call(
      httpRequest: () => _apiClient.post(
        url: EndPoints.checkout,
        requestBody: orderBody.toJson(),
      ),
      successReturn: (data) => OrderModel.fromJson(data),
    );
  }

  Future<Either<Failure, ShippingCostModel>> getShippingCost(ShippingCostBody shippingCostBody) async {
    return super.call(
      httpRequest: () => _apiClient.post(
        url: EndPoints.shippingCost,
        requestBody: shippingCostBody.toJson(),
      ),
      successReturn: (data) => ShippingCostModel.fromJson(data),
    );
  }

  Future<Either<Failure, num>> applyCoupon({
    required String coupon,
    required num subTotal,
    required productsIds,
  }) async {
    return super.call(
      httpRequest: () => _apiClient.post(
        url: EndPoints.coupon,
        requestBody: {'coupon': coupon, 'total_amount': subTotal, 'ids': jsonEncode(productsIds)},
      ),
      successReturn: (data) => data["discounted_price"],
    );
  }

  Future<Either<Failure, String>> completeOrderPayment({required int orderId}) async {
    return super.call<String>(
      httpRequest: () => _apiClient.post(
        url: EndPoints.paymentUpdate,
        requestBody: {'order_id': orderId, 'status': '1'},
      ),
      successReturn: (data) => "",
    );
  }

  Future<Either<Failure, List<PaymentGateway>>> getPaymentGateways() async {
    return super.call<List<PaymentGateway>>(
      httpRequest: () => _apiClient.get(url: EndPoints.gatewayList),
      successReturn: (data) => List<PaymentGateway>.from(
        data["data"].map((gateway) => PaymentGateway.fromJson(gateway)),
      ),
    );
  }

  Future<Either<Failure, PaginationModel<OrderModel>>> getMyOrders({int page = 1}) async {
    return super.call(
      httpRequest: () => _apiClient.get(
        url: EndPoints.orderList,
        queryParameters: {"page": page},
      ),
      successReturn: (data) => PaginationModel.fromJson(
        data,
        List<OrderModel>.from(data["data"].map((order) => OrderModel.fromJson(order))),
      ),
    );
  }
}
