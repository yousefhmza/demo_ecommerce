import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider4 extends StatelessWidget {
  final List<String> images;

  ProductImagesSlider4({required this.images, super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray100,
      child: Column(
        children: [
          const VerticalSpace(AppSize.s24),
          SizedBox(
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
          const VerticalSpace(AppSize.s20),
          SmoothPageIndicator(
            controller: pageController,
            count: images.length,
            effect: const ColorTransitionEffect(
              activeDotColor: AppColors.black,
              dotColor: AppColors.gray400,
              dotHeight: AppSize.s3,
              dotWidth: AppSize.s44,
              spacing: AppSize.s6,
            ),
          ),
          const VerticalSpace(AppSize.s24),
        ],
      ),
    );
  }
}
