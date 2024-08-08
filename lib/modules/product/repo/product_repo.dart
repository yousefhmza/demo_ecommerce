import 'package:dartz/dartz.dart';
import '../models/requests/review_body.dart';
import '../models/responses/product_details_model.dart';
import '../models/responses/product_review_model.dart';

import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';

class ProductsRepo extends BaseRepository {
  final ApiClient _apiClient;

  ProductsRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, ProductDetailsModel>> getProductById(int id) {
    return super.call<ProductDetailsModel>(
      httpRequest: () => _apiClient.get(url: '${EndPoints.productDetails}/$id', useToken: false),
      successReturn: (data) => ProductDetailsModel.fromJson(data),
    );
  }

  Future<Either<Failure, ProductReview>> addReview(ReviewBody reviewBody) {
    return super.call<ProductReview>(
      httpRequest: () => _apiClient.post(url: EndPoints.writeReview,requestBody: reviewBody.toJson()),
      successReturn: (data) => ProductReview.fromJson(data["data"]),
    );
  }
}
