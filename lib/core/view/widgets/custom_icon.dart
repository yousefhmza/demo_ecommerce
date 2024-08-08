import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/resources.dart';

class CustomIcon extends StatelessWidget {
  final bool isSvg;
  final double size;
  final IconData? icon;
  final String? iconPath;
  final Color? color;

  const CustomIcon(this.icon, {this.iconPath, this.color, this.size = AppSize.s24, Key? key})
      : isSvg = false,
        super(key: key);

  const CustomIcon.svg(this.iconPath, {this.icon, this.color, this.size = AppSize.s24, Key? key})
      : isSvg = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSvg
        ? SvgPicture.asset(
            iconPath!,
            height: size,
            width: size,
            fit: BoxFit.contain,
            colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          )
        : Icon(icon, color: color, size: size);
  }
}
