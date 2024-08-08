import '../../../../core/resources/app_values.dart';
import '../../../../core/utils/globals.dart';
import '../../../../core/view/views.dart';
import '../../controller/categories_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../product/models/responses/in_list_product_model.dart';

class CategoriesScreen extends GetWidget<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppbar(showDefaultBackButton: false, title: AppStrings.lblCategories.tr),
        const VerticalSpace(AppSize.s16),
        Obx(
          () {
            controller.selectedCategoryName.value;
            return controller.isLoadingCategories.value
                ? const LoadingSpinner()
                : SizedBox(
                    height: settings.categoryChipsListViewHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                      itemBuilder: (context, index) => settings.getCategoryChip(
                        category: controller.categories[index],
                        isSelected: controller.selectedCategoryName.value == controller.categories[index].name,
                        onTap: () {
                          controller.selectedCategoryName(controller.categories[index].name);
                          controller.getCategoryProducts();
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          HorizontalSpace(settings.categoryChipsSpacing ?? AppSize.s12),
                      itemCount: controller.categories.length,
                    ),
                  );
          },
        ),
        Obx(
          () {
            if (controller.selectedCategoryName.value.isEmpty) return const SizedBox.shrink();
            return Expanded(
              child: PaginatedGridView<InListProductModel>(
                key: UniqueKey(),
                padding: const EdgeInsets.all(AppPadding.p24),
                crossAxisCount: settings.productInGridCrossAxisCount!,
                childAspectRatio: settings.productInGridAspectRatio!,
                fetchData: (page) => controller.getCategoryProducts(page: page),
                onListItemsChange: (products) => controller.categoryProducts(products),
                child: (index) => settings.getProductItem(
                  product: controller.categoryProducts[index],
                  dynamicDimensions: true,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
