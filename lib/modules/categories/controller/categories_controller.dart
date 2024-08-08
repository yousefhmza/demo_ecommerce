import 'package:dartz/dartz.dart';
import '../../product/models/responses/in_list_product_model.dart';
import 'package:get/get.dart';

import '../../../core/base/models/pagination_model.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/utils/alerts.dart';
import '../models/responses/category_model.dart';
import '../repo/categories_repo.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo _categoriesRepo;

  CategoriesController(this._categoriesRepo);

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  RxString selectedCategoryName = "".obs;
  RxBool isLoadingCategories = false.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<InListProductModel> categoryProducts = <InListProductModel>[].obs;

  Future<void> getAllCategories() async {
    categoryProducts.clear();
    categories.clear();
    isLoadingCategories(true);
    final result = await _categoriesRepo.getAllCategories();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getAllCategories),
      (categories) {
        selectedCategoryName(categories[0].name);
        this.categories(categories);
        getCategoryProducts(page: 1);
      },
    );
    isLoadingCategories(false);
  }

  Future<Either<Failure, PaginationModel<InListProductModel>>> getCategoryProducts({int page = 1}) async {
    final result = await _categoriesRepo.getCategoryProducts(selectedCategoryName.value, page: page);
    return result;
  }
}
