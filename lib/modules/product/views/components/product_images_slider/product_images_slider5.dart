import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider5 extends StatelessWidget {
  final List<String> images;

  ProductImagesSlider5({required this.images, super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.gray100,
          padding: EdgeInsets.symmetric(vertical: AppPadding.p24),
          child: SizedBox(
            height: AppSize.s350,
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: CustomImage(
                  image: images[index],
                  height: double.infinity,
                  borderRadius: AppSize.s10,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        const VerticalSpace(AppSize.s14),
        SmoothPageIndicator(
          controller: pageController,
          count: images.length,
          effect: const ColorTransitionEffect(
            activeDotColor: AppColors.black,
            dotColor: AppColors.gray400,
            dotHeight: AppSize.s6,
            dotWidth: AppSize.s6,
            spacing: AppSize.s6,
          ),
        )
      ],
    );
  }
}
