import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../config/navigation/navigation.dart';
import 'payment_service_interface.dart';
import '../../../modules/order/models/responses/payment_gateway_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../di_container.dart';

class PaypalPayment extends PaymentServiceInterface {
  final PaymentGateway paymentGateway;
  String domain = "";

  PaypalPayment(this.paymentGateway) {
    final bool inTestMode = paymentGateway.testMode == 1;
    domain = inTestMode ? "https://api.sandbox.paypal.com" : "https://api.paypal.com";
    final String publicKey =
        inTestMode ? paymentGateway.credentials["sandbox_client_id"] : paymentGateway.credentials["live_client_id"];
    final String secretKey = inTestMode
        ? paymentGateway.credentials["sandbox_client_secret"]
        : paymentGateway.credentials["live_client_secret"];
    super.setCredentialKeysAndMode(publicKey: publicKey, secretKey: secretKey, inTestMode: inTestMode);
  }

  @override
  Future<void> pay({
    required num totalPrice,
    required String name,
    required String phone,
    required String email,
    required VoidCallback onPaymentSuccess,
  }) async {
    final isSuccess = await Get.toNamed(
      Routes.paypalPaymentScreen,
      arguments: {"totalPrice": totalPrice, "name": name, "phone": phone, "email": email, "paypalService": this},
    );
    if (isSuccess != null && isSuccess) onPaymentSuccess();
  }

  Future<String> getAccessToken() async {
    try {
      final token = base64.encode(latin1.encode('$publicKey:$secretKey'));
      final response = await sl<Dio>().post(
        '$domain/v1/oauth2/token?grant_type=client_credentials',
        options: Options(
          headers: {"Authorization": 'Basic ${token.trim()}', "Content-Type": 'application/x-www-form-urlencoded'},
        ),
      );
      if (response.statusCode == 200) return response.data["access_token"];
      return "0";
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, String>> createPaypalPayment(Map<String, dynamic> transactions, String accessToken) async {
    try {
      final response = await sl<Dio>().post(
        "$domain/v1/payments/payment",
        options: Options(headers: {"Authorization": 'Bearer $accessToken', "Content-Type": 'application/json'}),
        data: jsonEncode(transactions),
      );

      if (response.statusCode != 201) throw Exception(response.data["message"]);
      if (response.data["links"] == null && response.data["links"].length == 0) throw Exception("0");

      List links = response.data["links"];
      String executeUrl = "";
      String approvalUrl = "";

      final approvalItem = links.firstWhere((link) => link["rel"] == "approval_url", orElse: () => null);
      if (approvalItem != null) approvalUrl = approvalItem["href"];

      final executeItem = links.firstWhere((link) => link["rel"] == "execute", orElse: () => null);
      if (executeItem != null) executeUrl = executeItem["href"];

      return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
    } catch (e) {
      rethrow;
    }
  }

  Future<String> executePayment(String url, String payerId, String accessToken) async {
    try {
      final response = await sl<Dio>().post(
        url,
        options: Options(headers: {"Authorization": 'Bearer $accessToken', "Content-Type": 'application/json'}),
        data: {"payer_id": payerId},
      );

      if (response.statusCode == 200) return response.data["id"];
      return "0";
    } catch (e) {
      rethrow;
    }
  }
}
