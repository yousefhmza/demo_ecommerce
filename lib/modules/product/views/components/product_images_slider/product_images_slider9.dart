import '../../../../../core/resources/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class ProductImagesSlider9 extends StatefulWidget {
  final List<String> images;

  const ProductImagesSlider9({required this.images, super.key});

  @override
  State<ProductImagesSlider9> createState() => _ProductImagesSlider9State();
}

class _ProductImagesSlider9State extends State<ProductImagesSlider9> {
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
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: AppSize.s350,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: pageController,
                itemCount: widget.images.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                  child: CustomImage(
                    image: widget.images[index],
                    height: double.infinity,
                    borderRadius: AppSize.s10,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const HorizontalSpace(AppSize.s24),
          ValueListenableBuilder<double>(
            valueListenable: currentPageNotifier,
            builder: (context, currentPage, child) => SizedBox(
              height: AppSize.s350,
              width: AppSize.s56,
              child: ListView.separated(
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
                padding: EdgeInsets.symmetric(vertical: AppPadding.p24),
                separatorBuilder: (context, index) => const VerticalSpace(AppSize.s16),
                itemCount: widget.images.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
