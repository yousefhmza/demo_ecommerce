import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/base/models/pagination_model.dart';
import '../../../core/services/error/failure.dart';
import '../../product/models/responses/in_list_product_model.dart';
import '../models/responses/category_model.dart';
import '../repo/categories_repo.dart';

class CategoryProductsController extends GetxController {
  final CategoriesRepo _categoriesRepo;

  CategoryProductsController(this._categoriesRepo);

  late final String categoryName;
  RxList<InListProductModel> categoryProducts = RxList([]);

  @override
  void onInit() {
    super.onInit();
    categoryName = Get.arguments["category_name"];
  }

  Future<Either<Failure, PaginationModel<InListProductModel>>> getCategoryProducts({int page = 1}) async {
    final result = await _categoriesRepo.getCategoryProducts(categoryName, page:page);
    return result;
  }
}
