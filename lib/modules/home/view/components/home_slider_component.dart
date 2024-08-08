import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import '../../controller/home_controller.dart';
import '../widgets/slider_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';

class HomeSliderComponent extends GetWidget<HomeController> {
  const HomeSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.sliders.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                Container(
                  color: AppColors.primary.withOpacity(0.1),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 202.v,
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {},
                    ),
                    itemCount: controller.sliders.length,
                    itemBuilder: (context, index, realIndex) => SliderItem(controller.sliders[index]),
                  ),
                ),
                const VerticalSpace(AppSize.s28),
              ],
            ),
    );
  }
}
