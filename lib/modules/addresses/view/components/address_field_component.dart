import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class AddressFieldComponent extends StatelessWidget {
  final String title;
  final String desc;
  final Widget field;

  const AddressFieldComponent({required this.title, required this.desc, required this.field, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeightManager.bold),
        ),
        CustomText(
          desc,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeightManager.regular,
            fontSize: FontSize.s12,
            color: AppColors.gray600,
          ),
        ),
        const VerticalSpace(AppSize.s4),
        field,
      ],
    );
  }
}
