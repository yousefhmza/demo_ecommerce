import '../models/responses/category_model.dart';
import '../models/responses/child_category_model.dart';
import '../models/responses/subcategory_model.dart';
import '../repo/categories_repo.dart';
import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';

class CategoriesDropDownController extends GetxController {
  final CategoriesRepo _regionsRepo;

  CategoriesDropDownController(this._regionsRepo);

  RxBool isLoadingCategories = false.obs;
  RxBool isLoadingSubCategories = false.obs;
  RxBool isLoadingChildCategories = false.obs;

  RxList<CategoryModel> categories = RxList<CategoryModel>([]);
  RxList<Subcategory> subCategories = RxList<Subcategory>([]);
  RxList<ChildCategory> childCategories = RxList<ChildCategory>([]);

  Future<void> getCategories() async {
    isLoadingCategories(true);
    final result = await _regionsRepo.getAllCategories();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getCategories),
      (categories) => this.categories(categories),
    );
    isLoadingCategories(false);
  }

  Future<void> getSubCategories(int categoryId) async {
    isLoadingSubCategories(true);
    final result = await _regionsRepo.getSubcategories(categoryId);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: () => getSubCategories(categoryId)),
      (subCategories) => this.subCategories(subCategories),
    );
    isLoadingSubCategories(false);
  }

  Future<void> getChildCategories(int subCategoryId) async {
    isLoadingChildCategories(true);
    final result = await _regionsRepo.getChildCategories(subCategoryId);
    result.fold(
      (failure) => Alerts.showSnackBar(
        message: failure.message,
        onActionPressed: () => getChildCategories(subCategoryId),
      ),
      (childCategories) => this.childCategories(childCategories),
    );
    isLoadingChildCategories(false);
  }
}
