import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider8 extends StatelessWidget {
  final List<String> images;

  ProductImagesSlider8({required this.images, super.key});

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
            child: Stack(
              children: [
                PageView.builder(
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Arrow(
                          icon: Icons.arrow_back_ios_new,
                          onTap: () => pageController.previousPage(duration: Time.t300ms, curve: Curves.easeOut),
                        ),
                        Arrow(
                          icon: Icons.arrow_forward_ios,
                          onTap: () => pageController.nextPage(duration: Time.t300ms, curve: Curves.easeOut),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const VerticalSpace(AppSize.s20),
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
          ),
          const VerticalSpace(AppSize.s24),
        ],
      ),
    );
  }
}

class Arrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const Arrow({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(AppSize.s6)),
        child: CustomIcon(icon),
      ),
    );
  }
}
