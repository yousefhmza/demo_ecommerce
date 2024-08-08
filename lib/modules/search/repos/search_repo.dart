import 'package:dartz/dartz.dart';
import '../../../core/base/models/pagination_model.dart';

import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/local/cache_client.dart';
import '../../../core/services/local/storage_keys.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../../product/models/responses/in_list_product_model.dart';
import '../models/requests/search_body.dart';
import '../models/responses/search_criteria_model.dart';

class SearchRepo extends BaseRepository {
  final ApiClient _apiClient;
  final CacheClient _cacheClient;

  SearchRepo(this._apiClient, this._cacheClient, super.networkInfo);

  List<String> get recentSearch => _cacheClient.get(StorageKeys.recentSearch)?.cast<String>() ?? [];

  Future<void> saveToRecentSearch(String name) async {
    // save 10 items at most in the list in get storage
    if (recentSearch.contains(name) || name.isEmpty) return;
    if (recentSearch.length > 9) {
      await _cacheClient.save(
        StorageKeys.recentSearch,
        [...recentSearch.sublist(recentSearch.length - 9, recentSearch.length), name],
      );
    } else {
      await _cacheClient.save(StorageKeys.recentSearch, [...recentSearch, name]);
    }
  }

  Future<Either<Failure, PaginationModel<InListProductModel>>> searchProducts({
    int page = 1,
    required SearchBody searchBody,
  }) async {
    return super.call(
      httpRequest: () => _apiClient.get(
        url: EndPoints.search,
        queryParameters: {"page": page, ...searchBody.toJson()},
      ),
      successReturn: (data) => PaginationModel.fromJson(
        data,
        List<InListProductModel>.from(data["data"].map((product) => InListProductModel.fromJson(product))),
      ),
    );
  }

  Future<Either<Failure, SearchCriteria>> getSearchCriteria() async {
    return super.call<SearchCriteria>(
      httpRequest: () => _apiClient.get(url: EndPoints.searchItems),
      successReturn: (data) => SearchCriteria.fromJson(data),
    );
  }
}
