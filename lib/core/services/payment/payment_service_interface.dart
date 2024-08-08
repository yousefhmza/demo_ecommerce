import 'package:flutter/material.dart';

abstract class PaymentServiceInterface {
  String publicKey = "";
  String secretKey = "";
  bool inTestMode = true;

  void setCredentialKeysAndMode({String publicKey = "", String secretKey = "", bool inTestMode = true}) {
    this.publicKey = publicKey;
    this.secretKey = secretKey;
    this.inTestMode = inTestMode;
  }

  Future<void> pay({
    required num totalPrice,
    required String name,
    required String phone,
    required String email,
    required VoidCallback onPaymentSuccess,
  });
}
