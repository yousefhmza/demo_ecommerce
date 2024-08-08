import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class CustomText extends StatelessWidget {
  final bool autoSized;
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? style;

  const CustomText(
    this.text, {
    this.autoSized = false,
    this.textAlign,
    this.maxLines,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return autoSized
        ? AutoSizeText(
            text,
            textAlign: textAlign,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
            maxLines: maxLines,
            style: style,
            minFontSize: FontSize.s10,
          )
        : Text(
            text,
            textAlign: textAlign,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
            maxLines: maxLines,
            style: style,
          );
  }
}
