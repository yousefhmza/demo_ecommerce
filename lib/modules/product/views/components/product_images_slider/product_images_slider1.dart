import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider1 extends StatelessWidget {
  final List<String> images;

  const ProductImagesSlider1({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        itemBuilder: (context, index) => Container(
          width: AppSize.s250,
          height: AppSize.s350,
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
            color: AppColors.gray10002,
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          child: CustomImage(
            image: images.isEmpty ? AppImages.imgPlaceholder : images[index],
            width: double.infinity,
            height: double.infinity,
            fit: images.isEmpty ? BoxFit.cover : BoxFit.contain,
            borderRadius: AppSize.s10,
          ),
        ),
        separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s12),
        itemCount: images.isEmpty ? 1 : images.length,
      ),
    );
  }
}
