import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final double padding;

  const CustomTextButton({
    this.onPressed,
    required this.text,
    this.textColor,
    this.fontWeight = FontWeightManager.bold,
    this.textSize = FontSize.s14,
    this.padding = AppPadding.p8,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppSize.s4),
      child: Container(
        padding: EdgeInsets.all(padding),
        child: CustomText(
          text,
          style: TextStyle(
            color: onPressed == null ? AppColors.grey : textColor,
            fontSize: textSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
