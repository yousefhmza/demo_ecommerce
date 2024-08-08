import '../../../../core/view/views.dart';
import '../../../product/models/responses/in_list_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/globals.dart';
import '../../controllers/search_controller.dart' as sc;

class SearchedProductsComponent extends GetWidget<sc.SearchController> {
  const SearchedProductsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(AppPadding.p24).copyWith(bottom: AppPadding.p0),
          sliver: SliverToBoxAdapter(
            child: CustomText(
              AppStrings.lblSearchResults.tr,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s16,
                  ),
            ),
          ),
        ),
        Obx(() {
          controller.searchBody.value;
          return PaginatedSliverGridView<InListProductModel>(
            key: Key(controller.searchBody.value.hashCode.toString()),
            scrollController: controller.scrollController,
            padding: const EdgeInsets.all(AppPadding.p24),
            fetchData: (page) => controller.searchProducts(page: page),
            onListItemsChange: (products) {
              controller.products(products);
              if (products.isNotEmpty) controller.saveRecentSearch();
            },
            child: (index) =>
                settings.getProductItem(product: controller.products.value![index], dynamicDimensions: true),
            crossAxisCount: settings.productInGridCrossAxisCount!,
            childAspectRatio: settings.productInGridAspectRatio!,
          );
        }),
      ],
    );
  }
}
