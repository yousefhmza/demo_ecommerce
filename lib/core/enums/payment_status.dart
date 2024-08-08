// 0 Pending , 1 Complete , 2 Failed

import 'package:ecommerce/core/resources/resources.dart';
import 'package:get/get.dart';

enum PaymentStatus { pending, complete, failed }

extension PaymentStatusExtension on PaymentStatus {
  String get toText {
    switch (this) {
      case PaymentStatus.pending:
        return AppStrings.pending.tr;
      case PaymentStatus.complete:
        return AppStrings.complete.tr;
      case PaymentStatus.failed:
        return AppStrings.failed.tr;
    }
  }
}

extension IntToPaymentStatus on int {
  PaymentStatus get toPaymentStatus {
    switch (this) {
      case 0:
        return PaymentStatus.pending;
      case 1:
        return PaymentStatus.complete;
      case 2:
        return PaymentStatus.failed;
      default:
        return PaymentStatus.pending;
    }
  }
}
