// import 'package:flutter/material.dart';
//
// import '../../resources/resources.dart';
// import '../views.dart';
//
// class OutlinedIconButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String icon;
//
//   const OutlinedIconButton({required this.icon, required this.onTap, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(AppSize.s4),
//       child: Container(
//         padding: const EdgeInsets.all(AppPadding.p8),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.outlineIconButtonBorder),
//           borderRadius: BorderRadius.circular(AppSize.s4),
//         ),
//         child: CustomIcon.svg(icon),
//       ),
//     );
//   }
// }
