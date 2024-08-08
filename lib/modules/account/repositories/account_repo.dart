import 'package:dartz/dartz.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/requests/edit_account_body.dart';
import '../models/responses/user_model.dart';

class AccountRepo extends BaseRepository {
  final ApiClient _apiClient;

  AccountRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, UserModel>> getProfile() async {
    return super.call<UserModel>(
      httpRequest: () => _apiClient.get(url: EndPoints.profileData),
      successReturn: (data) => UserModel.fromJson(data["user_details"]),
    );
  }

  Future<Either<Failure, bool>> editAccount(EditAccountBody editAccountBody) async {
    return super.call<bool>(
      httpRequest: () => _apiClient.post(url: EndPoints.updateProfile, requestBody: editAccountBody.toFormData()),
      successReturn: (data) => data["success"],
    );
  }
}
