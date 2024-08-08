import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/utils/globals.dart';
import '../components/home_recent_component.dart';
import '../components/home_featured_component.dart';
import '../components/home_offer_component.dart';
import '../components/home_slider_component.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../../core/view/views.dart';
import '../../controller/home_controller.dart';
import '../components/home_categories_component.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        settings.getAppbar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.searchScreen),
                    child: CustomTextField(
                      enabled: false,
                      prefix: const CustomIcon.svg(AppImages.imgIconSearch),
                      hintText: AppStrings.lblSearchHere.tr,
                    ),
                  ),
                ),
                const VerticalSpace(AppSize.s16),
                const HomeSliderComponent(),
                const HomeCategoriesComponent(),
                SizedBox(height: 28.v),
                const HomeOfferComponent(),
                const HomeRecentComponent(),
                const HomeFeaturedComponent(),
                SizedBox(height: 17.v),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
