import 'package:dartz/dartz.dart';
import '../models/requests/login_body.dart';
import '../models/requests/register_body.dart';
import 'package:get/get.dart';

import '../../../core/resources/resources.dart';
import '../../../core/services/error/error_handler.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/local/cache_client.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/local/storage_keys.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/network/endpoints.dart';
import '../../account/models/responses/user_model.dart';
import '../models/requests/change_password_body.dart';

class AuthRepo extends BaseRepository {
  final ApiClient _apiClient;
  final CacheClient _cacheClient;

  AuthRepo(this._apiClient, this._cacheClient, super.networkInfo);

  bool get isAuthed => _cacheClient.get(StorageKeys.isAuthed) ?? false;

  Future<Either<Failure, UserModel>> login(LoginBody loginBody) async {
    return super.call<UserModel>(
      httpRequest: () async {
        final response = await _apiClient.post(url: EndPoints.login, requestBody: loginBody.toJson());
        if (response.statusCode == 200) await _cacheClient.save(StorageKeys.token, response.data["token"]);
        if (response.statusCode == 200) await _cacheClient.save(StorageKeys.isAuthed, true);
        return response;
      },
      successReturn: (data) => UserModel.fromJson(data["users"]),
    );
  }

  Future<Either<Failure, UserModel>> register(RegisterBody registerBody) async {
    return super.call<UserModel>(
      httpRequest: () async {
        final response = await _apiClient.post(url: EndPoints.register, requestBody: registerBody.toJson());
        if (response.statusCode == 200) await _cacheClient.save(StorageKeys.token, response.data["token"]);
        if (response.statusCode == 200) await _cacheClient.save(StorageKeys.isAuthed, true);
        return response;
      },
      successReturn: (data) => UserModel.fromJson(data["users"]),
    );
  }

  Future<Either<Failure, String>> signOut() async {
    try {
      await _cacheClient.delete(StorageKeys.isAuthed);
      await _cacheClient.delete(StorageKeys.token);
      return Right(AppStrings.signedOutSuccessfully.tr);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, String>> changePassword(ChangePasswordBody changePasswordBody) async {
    return super.call<String>(
      httpRequest: () => _apiClient.post(url: EndPoints.changePass, requestBody: changePasswordBody.toJson()),
      successReturn: (data) => AppStrings.passwordChangedSuccessfully.tr,
    );
  }
}
