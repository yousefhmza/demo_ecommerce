import 'package:dartz/dartz.dart';
import '../../../core/base/models/pagination_model.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/responses/category_model.dart';
import '../models/responses/child_category_model.dart';
import '../models/responses/subcategory_model.dart';
import '../../product/models/responses/in_list_product_model.dart';

class CategoriesRepo extends BaseRepository {
  final ApiClient _apiClient;

  CategoriesRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    return super.call<List<CategoryModel>>(
      httpRequest: () => _apiClient.get(url: EndPoints.category),
      successReturn: (data) =>
          List<CategoryModel>.from(data["categories"].map((category) => CategoryModel.fromJson(category))),
    );
  }

  Future<Either<Failure, List<Subcategory>>> getSubcategories(int categoryId) async {
    return super.call<List<Subcategory>>(
      httpRequest: () => _apiClient.get(url: "${EndPoints.subcategory}/$categoryId"),
      successReturn: (data) =>
          List<Subcategory>.from(data["subcategories"].map((subcategory) => Subcategory.fromJson(subcategory))),
    );
  }

  Future<Either<Failure, List<ChildCategory>>> getChildCategories(int subCategoryId) async {
    return super.call<List<ChildCategory>>(
      httpRequest: () => _apiClient.get(url: "${EndPoints.childCategory}/$subCategoryId"),
      successReturn: (data) => List<ChildCategory>.from(
        data["childCategories"].map((childCategory) => ChildCategory.fromJson(childCategory)),
      ),
    );
  }

  Future<Either<Failure, PaginationModel<InListProductModel>>> getCategoryProducts(
    String categoryName, {
    int page = 1,
  }) async {
    return super.call(
      httpRequest: () => _apiClient.get(
        url: EndPoints.search,
        queryParameters: {"category": categoryName, "page": page},
      ),
      successReturn: (data) => PaginationModel.fromJson(
        data,
        List<InListProductModel>.from(data["data"].map((product) => InListProductModel.fromJson(product))),
      ),
    );
  }
}
