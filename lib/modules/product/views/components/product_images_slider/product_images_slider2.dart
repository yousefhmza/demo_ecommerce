import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider2 extends StatelessWidget {
  final List<String> images;
  final num? price;

  const ProductImagesSlider2({required this.images, this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        SizedBox(
          height: AppSize.s410,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CustomImage(
              image: images[index],
              fit: BoxFit.cover,
              height: AppSize.s410,
              width: AppSize.s260,
              borderRadius: AppSize.s6,
            ),
            separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s16),
            itemCount: images.length,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p32),
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p6),
          decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.white),
          child: CustomText("${AppStrings.usd.tr} ${price?.toStringAsFixed(2) ?? 0}"),
        )
      ],
    );
  }
}
