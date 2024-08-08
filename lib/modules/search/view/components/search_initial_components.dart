import '../../../../core/resources/resources.dart';
import '../widgets/recent_search_chip.dart';
import '../../../../core/view/views.dart';
import '../../controllers/search_controller.dart' as sc;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchInitialComponent extends GetWidget<sc.SearchController> {
  const SearchInitialComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: CustomText(
              AppStrings.lblRecentSearches.tr,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: FontSize.s16, fontWeight: FontWeightManager.bold),
            ),
          ),
          const VerticalSpace(AppSize.s16),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: Wrap(
                spacing: AppSize.s8,
                runSpacing: AppSize.s8,
                children: List.generate(
                  controller.recentSearch.length,
                  (index) => RecentSearchChip(text: controller.recentSearch[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
