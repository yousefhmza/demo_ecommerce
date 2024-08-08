// import '../views.dart';
// import 'package:flutter/material.dart';
//
// import '../../resources/resources.dart';
//
// class FilledIconButton extends StatelessWidget {
//   final bool isSvg;
//   final IconData? icon;
//   final String? iconPath;
//   final double size;
//   final Color? bgColor;
//   final Color? iconColor;
//   final VoidCallback? onTap;
//
//   const FilledIconButton(
//     this.icon, {
//     this.iconPath,
//     this.bgColor,
//     this.iconColor,
//     this.size = AppSize.s24,
//     this.onTap,
//     Key? key,
//   })  : isSvg = false,
//         super(key: key);
//
//   const FilledIconButton.svg(
//     this.iconPath, {
//     this.icon,
//     this.bgColor,
//     this.iconColor,
//     this.size = AppSize.s24,
//     this.onTap,
//     Key? key,
//   })  : isSvg = true,
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       type: MaterialType.transparency,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(AppSize.s4),
//         child: Ink(
//           padding: const EdgeInsets.all(AppPadding.p8),
//           decoration: BoxDecoration(
//             color: bgColor ?? AppColors.mainGrey,
//             borderRadius: BorderRadius.circular(AppSize.s4),
//           ),
//           child: isSvg ? CustomIcon.svg(iconPath, color: iconColor) : CustomIcon(icon, color: iconColor),
//         ),
//       ),
//     );
//   }
// }
