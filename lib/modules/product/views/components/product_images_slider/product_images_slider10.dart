import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider10 extends StatefulWidget {
  final List<String> images;

  const ProductImagesSlider10({required this.images, super.key});

  @override
  State<ProductImagesSlider10> createState() => _ProductImagesSlider10State();
}

class _ProductImagesSlider10State extends State<ProductImagesSlider10> {
  final PageController pageController = PageController();
  final ValueNotifier<double> currentPageNotifier = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentPageNotifier.value = pageController.page ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray100,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      child: Column(
        children: [
          ValueListenableBuilder<double>(
            valueListenable: currentPageNotifier,
            builder: (context, currentPage, child) {
              return SizedBox(
                height: AppSize.s56,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => pageController.animateToPage(
                      index,
                      duration: Time.t300ms,
                      curve: Curves.easeInOut,
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      foregroundDecoration: BoxDecoration(
                        border: Border.all(
                          width: AppSize.s2,
                          color: currentPage == index ? AppColors.primary : AppColors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(AppSize.s6),
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s6)),
                      child: CustomImage(image: widget.images[index], height: AppSize.s56, width: AppSize.s56),
                    ),
                  ),
                  separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s16),
                  itemCount: widget.images.length,
                ),
              );
            },
          ),
          const VerticalSpace(AppSize.s24),
          SizedBox(
            height: AppSize.s350,
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: CustomImage(
                  image: widget.images[index],
                  height: double.infinity,
                  borderRadius: AppSize.s10,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
