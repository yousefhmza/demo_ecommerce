import 'package:dartz/dartz.dart';
import '../../../core/base/models/pagination_model.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../../categories/models/responses/category_model.dart';
import '../../product/models/responses/in_list_product_model.dart';

class LegalRepo extends BaseRepository {
  final ApiClient _apiClient;

  LegalRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, String>> getTermsAndConditions() async {
    return super.call<String>(
      httpRequest: () => _apiClient.get(url: EndPoints.terms),
      successReturn: (data) => data["page_content"],
    );
  }
//
// Future<Either<Failure, PaginationModel<InListProductModel>>> getCategoryProducts(String categoryName) async {
//   return super.call(
//     httpRequest: () => _apiClient.get(
//       url: EndPoints.search,
//       queryParameters: {"category": categoryName},
//     ),
//     successReturn: (data) => PaginationModel.fromJson(
//       data,
//       List<InListProductModel>.from(data["data"].map((product) => InListProductModel.fromJson(product))),
//     ),
//   );
// }
}
