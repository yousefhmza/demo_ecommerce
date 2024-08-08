import '../../controller/categories_drop_down_controller.dart';
import '../../models/responses/category_model.dart';
import '../../models/responses/child_category_model.dart';
import '../../models/responses/subcategory_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/view/views.dart';
import '../../../../di_container.dart';

class CategoriesDropDownComponent extends StatefulWidget {
  final int? categoryInitId;
  final int? subCategoryInitId;
  final int? childCategoryInitId;
  final void Function(CategoryModel category) onChangeCategory;
  final void Function(Subcategory subcategory) onChangeSubcategory;
  final void Function(ChildCategory childCategory) onChangeChildCategory;

  const CategoriesDropDownComponent({
    this.categoryInitId,
    this.subCategoryInitId,
    this.childCategoryInitId,
    required this.onChangeCategory,
    required this.onChangeSubcategory,
    required this.onChangeChildCategory,
    super.key,
  });

  @override
  State<CategoriesDropDownComponent> createState() => _CategoriesDropDownComponentState();
}

class _CategoriesDropDownComponentState extends State<CategoriesDropDownComponent> {
  final CategoriesDropDownController categoriesDropDownController = Get.put(sl<CategoriesDropDownController>());
  CategoryModel? category;
  Subcategory? subCategory;
  ChildCategory? childCategory;

  @override
  void initState() {
    super.initState();
    categoriesDropDownController.getCategories().then((value) {
      if (widget.categoryInitId != null) {
        category = categoriesDropDownController.categories.singleWhere((c) => c.id == widget.categoryInitId);
      }
    });

    if (widget.categoryInitId != null) {
      categoriesDropDownController.getSubCategories(widget.categoryInitId!).then((value) {
        if (widget.subCategoryInitId != null) {
          subCategory = categoriesDropDownController.subCategories.singleWhere((c) => c.id == widget.subCategoryInitId);
        }
      });
    }

    if (widget.subCategoryInitId != null) {
      categoriesDropDownController.getChildCategories(widget.subCategoryInitId!).then((value) {
        if (widget.childCategoryInitId != null) {
          childCategory =
              categoriesDropDownController.childCategories.singleWhere((c) => c.id == widget.childCategoryInitId);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CustomDropDownField<int>(
            key: UniqueKey(),
            hintText: AppStrings.lblCategory.tr,
            isLoadingValues: categoriesDropDownController.isLoadingCategories.value,
            value: category?.id,
            onChanged: (id) {
              category = categoriesDropDownController.categories.singleWhere((category) => category.id == id);
              widget.onChangeCategory(category!);
              subCategory = null;
              childCategory = null;
              categoriesDropDownController.subCategories.clear();
              categoriesDropDownController.childCategories.clear();
              categoriesDropDownController.getSubCategories(category!.id);
            },
            validator: Validators.notEmptyIntValidator,
            items: categoriesDropDownController.categories
                .map((category) => DropdownMenuItem(value: category.id, child: DropDownTitle(title: category.name)))
                .toList(),
          ),
          const VerticalSpace(AppSize.s24),
          CustomDropDownField<int>(
            key: UniqueKey(),
            hintText: AppStrings.lblSubCategory.tr,
            isLoadingValues: categoriesDropDownController.isLoadingSubCategories.value,
            value: subCategory?.id,
            onChanged: (id) {
              subCategory = categoriesDropDownController.subCategories.singleWhere((subCat) => subCat.id == id);
              widget.onChangeSubcategory(subCategory!);
              childCategory = null;
              categoriesDropDownController.childCategories.clear();
              categoriesDropDownController.getChildCategories(subCategory!.id);
            },
            validator: Validators.notEmptyIntValidator,
            items: categoriesDropDownController.subCategories
                .map((subCat) => DropdownMenuItem(value: subCat.id, child: DropDownTitle(title: subCat.name)))
                .toList(),
          ),
          const VerticalSpace(AppSize.s24),
          CustomDropDownField<int>(
            key: UniqueKey(),
            hintText: AppStrings.lblChildCategory.tr,
            isLoadingValues: categoriesDropDownController.isLoadingChildCategories.value,
            value: childCategory?.id,
            onChanged: (id) {
              childCategory = categoriesDropDownController.childCategories.singleWhere((childCat) => childCat.id == id);
              widget.onChangeChildCategory(childCategory!);
            },
            // validator: Validators.notEmptyIntValidator,
            items: categoriesDropDownController.childCategories
                .map((childCat) => DropdownMenuItem(value: childCat.id, child: DropDownTitle(title: childCat.name)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class DropDownTitle extends StatelessWidget {
  final String title;

  const DropDownTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontFamily: FontConstants.englishFontFamily,
            fontSize: FontSize.s14,
            fontWeight: FontWeightManager.regular,
          ),
    );
  }
}
