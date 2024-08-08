import '../../../../core/view/views.dart';
import '../../controller/category_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/globals.dart';
import '../../../product/models/responses/in_list_product_model.dart';

class CategoryProductsScreen extends GetWidget<CategoryProductsController> {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: controller.categoryName),
      body: SafeArea(
        child: PaginatedGridView<InListProductModel>(
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
      ),
    );
  }
}
