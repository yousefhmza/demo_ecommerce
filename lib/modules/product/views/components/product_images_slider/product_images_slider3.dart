import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider3 extends StatelessWidget {
  final List<String> images;

  ProductImagesSlider3({required this.images, super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
          height: AppSize.s320,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: CustomImage(image: images[index], height: double.infinity, borderRadius: AppSize.s10),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p32),
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p6),
          decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.white),
          child: SmoothPageIndicator(
            controller: pageController,
            count: images.length,
            effect: const ColorTransitionEffect(
              activeDotColor: AppColors.primary,
              dotColor: AppColors.gray300,
              dotHeight: AppSize.s10,
              dotWidth: AppSize.s10,
              spacing: AppSize.s6,
            ),
          ),
        )
      ],
    );
  }
}
