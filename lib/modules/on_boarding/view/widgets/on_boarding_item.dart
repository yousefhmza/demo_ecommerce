import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class OnBoardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String desc;

  const OnBoardingItem({required this.image, required this.title, required this.desc, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
      child: Column(
        children: [
          Expanded(
            child: CustomImage(
              image: image,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          const VerticalSpace(AppSize.s72),
          CustomText(
            title,
            style: const TextStyle(fontWeight: FontWeightManager.bold, fontSize: FontSize.s26),
            autoSized: true,
            maxLines: 1,
          ),
          const VerticalSpace(AppSize.s10),
          CustomText(
            desc,
            style: const TextStyle(fontWeight: FontWeightManager.light, fontSize: FontSize.s14),
            autoSized: true,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
