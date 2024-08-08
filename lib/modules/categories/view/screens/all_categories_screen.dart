import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../models/responses/category_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../home/view/widgets/category_item.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = Get.arguments["categories"];
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblCategories.tr),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppPadding.p16),
        itemBuilder: (context, index) => CategoryItem(categories[index]),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: AppSize.s8,
          mainAxisSpacing: AppSize.s8,
        ),
      ),
    );
  }
}
