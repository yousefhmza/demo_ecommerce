import '../../../../core/utils/sheets.dart';
import '../../../../core/view/views.dart';
import '../components/filter_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/resources.dart';
import '../../controllers/search_controller.dart' as sc;
import '../components/search_initial_components.dart';
import '../components/search_products_components.dart';

class SearchScreen extends GetWidget<sc.SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titleSpacing: AppSize.s0,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(end: AppPadding.p24),
          child: CustomTextField(
            controller: controller.searchFieldController,
            onChanged: controller.onInputChange,
            prefix: const CustomIcon.svg(AppImages.imgIconSearch),
            hintText: AppStrings.lblSearchHere.tr,
          ),
        ),
        actions: [
          InkWell(
            onTap: () => AppSheets.showBottomSheet(context, child: FilterBottomSheet()),
            child: const CustomIcon.svg(AppImages.imgIconFilterAltLight),
          ),
        ],
      ),
      body: Obx(
        () {
          controller.searchBody.value;
          return controller.searchBody.value.noSearchCriteriaApplied
              ? const SearchInitialComponent()
              : const SearchedProductsComponent();
        },
      ),
    );
  }
}
