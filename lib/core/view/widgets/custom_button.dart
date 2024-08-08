import '../../resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final Widget? child;
  final double? height;
  final double? width;
  final double? textHeight;
  final double? borderRadius;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? buttonTextStyle;
  final bool isOutlined;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.onPressed,
    this.text = "",
    this.color,
    this.textColor,
    this.child,
    this.width,
    this.height,
    this.textHeight,
    this.borderRadius,
    this.buttonTextStyle,
    this.padding,
    this.margin,
    this.isOutlined = false,
    this.isLoading = false,
    this.fontSize = FontSize.s14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: isOutlined ? Border.all(color: color ?? AppColors.primary) : null,
            color: isOutlined
                ? null
                : onPressed == null
                    ? AppColors.grey
                    : color ?? AppColors.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s10),
          ),
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s10),
            child: Container(
              padding: height != null
                  ? const EdgeInsets.symmetric(horizontal: AppPadding.p16)
                  : padding ?? const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p10),
              child: isLoading
                  ? const LoadingSpinner(hasSmallRadius: true, color: AppColors.white)
                  : text.isNotEmpty
                      ? Center(
                          child: CustomText(
                            text,
                            textAlign: TextAlign.center,
                            style: buttonTextStyle ??
                                TextStyle(
                                  color: onPressed == null ? AppColors.grey : textColor ?? AppColors.white,
                                  fontWeight: FontWeightManager.bold,
                                  fontSize: fontSize,
                                  height: textHeight,
                                ),
                          ),
                        )
                      : child,
            ),
          ),
        ),
      ),
    );
  }
}
