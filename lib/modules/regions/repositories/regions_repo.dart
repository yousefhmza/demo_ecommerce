import 'package:dartz/dartz.dart';
import '../../../core/base/models/pagination_model.dart';

import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/region_model.dart';

class RegionsRepo extends BaseRepository {
  final ApiClient _apiClient;

  RegionsRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, PaginationModel<Region>>> getCountries() async {
    return super.call<PaginationModel<Region>>(
      httpRequest: () => _apiClient.get(url: EndPoints.countryList),
      successReturn: (data) => PaginationModel.fromJson(
        data["countries"],
        List<Region>.from(data["countries"]["data"].map((country) => Region.fromJson(country))),
      ),
    );
  }

  Future<Either<Failure, PaginationModel<Region>>> getStates(int countryId) async {
    return super.call<PaginationModel<Region>>(
      httpRequest: () => _apiClient.get(url: "${EndPoints.stateList}/$countryId"),
      successReturn: (data) => PaginationModel.fromJson(
        data["state"],
        List<Region>.from(data["state"]["data"].map((country) => Region.fromJson(country))),
      ),
    );
  }

  Future<Either<Failure, PaginationModel<Region>>> getCities(int stateId) async {
    return super.call<PaginationModel<Region>>(
      httpRequest: () => _apiClient.get(url: "${EndPoints.cityList}/$stateId"),
      successReturn: (data) => PaginationModel.fromJson(
        data["cities"],
        List<Region>.from(data["cities"]["data"].map((country) => Region.fromJson(country))),
      ),
    );
  }
}
