import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../views.dart';

class IconWithDataRow extends StatelessWidget {
  final String icon;
  final String value;

  const IconWithDataRow({required this.icon, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon.svg(icon, size: AppSize.s14, color: AppColors.black),
        const HorizontalSpace(AppSize.s4),
        CustomText(
          value,
          style: const TextStyle(fontSize: FontSize.s10, fontWeight: FontWeightManager.regular, color: AppColors.grey),
        ),
      ],
    );
  }
}
