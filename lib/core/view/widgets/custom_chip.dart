// import 'package:flutter/material.dart';
//
// import '../../resources/resources.dart';
// import '../views.dart';
//
// class CustomChip extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const CustomChip({required this.title, required this.isSelected, required this.onTap, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       type: MaterialType.transparency,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(AppSize.s4),
//         child: AnimatedContainer(
//           duration: Time.t150ms,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(AppSize.s4),
//             color: isSelected ? AppColors.primaryForManager : null,
//             border: Border.all(color: isSelected ? AppColors.primaryForManager : AppColors.mainGrey),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p10),
//           child: CustomText(
//             title,
//             color: isSelected ? AppColors.white : AppColors.black,
//             fontWeight: FontWeightManager.regular,
//             fontSize: FontSize.s12,
//           ),
//         ),
//       ),
//     );
//   }
// }
