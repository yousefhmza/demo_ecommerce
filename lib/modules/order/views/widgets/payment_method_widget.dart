import '../../models/responses/payment_gateway_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class PaymentMethodWidget extends StatelessWidget {
  final PaymentGateway gateway;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodWidget({required this.gateway, required this.isSelected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          border: Border.all(
            width: isSelected ? AppSize.s2 : AppSize.s1,
            color: isSelected ? AppColors.primary : AppColors.gray400,
          ),
        ),
        child: CustomImage(
          image: gateway.image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
