import 'package:dartz/dartz.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../../account/models/responses/user_model.dart';
import '../models/responses/address_model.dart';

import '../../order/models/requests/shipping_cost_body.dart';
import '../../order/models/responses/shipping_cost_model.dart';
import '../models/requests/address_body.dart';

class AddressesRepo extends BaseRepository {
  final ApiClient _apiClient;

  AddressesRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<Address>>> getAddresses() async {
    return super.call(
      httpRequest: () => _apiClient.get(url: EndPoints.shipAddressList),
      successReturn: (data) => List<Address>.from(data["data"].map((address) => Address.fromJson(address))),
    );
  }

  Future<Either<Failure, Address>> addOrUpdateAddress({required AddressBody addressBody}) async {
    return super.call(
      httpRequest: () => _apiClient.post(url: EndPoints.addShipping, requestBody: addressBody.toJson()),
      successReturn: (data) => Address.fromJson(data["data"]),
    );
  }

  Future<Either<Failure, UserModel>> deleteAddress(int id) async {
    return super.call(
      httpRequest: () => _apiClient.get(url: "${EndPoints.removeShipping}/$id"),
      successReturn: (data) => UserModel.fromJson(data),
    );
  }


}
