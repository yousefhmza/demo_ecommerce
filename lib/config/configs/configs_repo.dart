import 'dart:math';

import 'package:dartz/dartz.dart';
import 'configs_model.dart';

import '../../core/base/repositories/base_repository.dart';
import '../../core/services/error/failure.dart';
import '../../core/services/network/api_client.dart';
import '../../core/services/network/endpoints.dart';

class ConfigsRepo extends BaseRepository {
  final ApiClient _apiClient;

  ConfigsRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, ConfigsModel>> getConfigs() async {
    return super.call<ConfigsModel>(
      httpRequest: () => _apiClient.get(url: EndPoints.appConfigs),
      successReturn: (data) => ConfigsModel.fromJson(data),
    );
  }
}
