import '../../../../core/services/payment/paypal_payment.dart';
import '../../../../core/utils/alerts.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PaypalPaymentScreen extends StatefulWidget {
  const PaypalPaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() => PaypalPaymentScreenState();
}

class PaypalPaymentScreenState extends State<PaypalPaymentScreen> {
  late final WebViewController webViewController;

  String checkoutUrl = "";
  String executeUrl = "";
  String accessToken = "";
  final PaypalPayment paypalPayment = Get.arguments["paypalService"];

  Map<String, dynamic> defaultCurrency = {
    "symbol": "USD ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "USD"
  };

  bool isEnableShipping = false;
  bool isEnableAddress = false;
  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        try {
          accessToken = await paypalPayment.getAccessToken();
          final transactions = getOrderParams(
            Get.arguments["totalPrice"],
            Get.arguments["name"],
            Get.arguments["phone"],
            Get.arguments["email"],
          );
          final urls = await paypalPayment.createPaypalPayment(transactions, accessToken);
          setState(() {
            checkoutUrl = urls["approvalUrl"]!;
            executeUrl = urls["executeUrl"]!;
          });
          webViewController = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.contains(returnURL)) {
                    final uri = Uri.parse(request.url);
                    final payerID = uri.queryParameters['PayerID'];
                    if (payerID != null) {
                      paypalPayment
                          .executePayment(executeUrl, payerID, accessToken)
                          .then((id) => Get.back(result: true));
                    } else {
                      Get.back();
                    }
                    Get.back();
                  }
                  if (request.url.contains(cancelURL)) Get.back();
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(checkoutUrl));
        } catch (e) {
          Alerts.showSnackBar(message: e.toString());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: "Paypal"),
      body: checkoutUrl.isEmpty ? const LoadingSpinner() : WebViewWidget(controller: webViewController),
    );
  }

  String itemName = 'Qixer payment';
  int quantity = 1;

  Map<String, dynamic> getOrderParams(num amount, String name, String phone, String email) {
    List items = [
      {"name": itemName, "quantity": quantity, "price": amount, "currency": defaultCurrency["currency"]}
    ];

    String totalAmount = amount.toStringAsFixed(2);
    String subTotalAmount = amount.toStringAsFixed(2);
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    String userFirstName = name;
    String userLastName = '';
    String addressCity = 'Delhi';
    String addressStreet = 'Mathura Road';
    String addressZipCode = '110014';
    String addressCountry = 'India';
    String addressState = 'Delhi';
    String addressPhoneNumber = phone;

    return {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {"allowed_payment_method": "INSTANT_FUNDING_SOURCE"},
          "item_list": {
            "items": items,
            if (isEnableShipping && isEnableAddress)
              "shipping_address": {
                "recipient_name": "$userFirstName $userLastName",
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
  }
}
