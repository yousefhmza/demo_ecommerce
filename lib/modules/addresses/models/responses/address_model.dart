import '../../../../core/utils/json_utils.dart';

import '../../../regions/models/region_model.dart';

class Address {
  final int id;
  final int userId;
  final int countryId;
  final int stateId;
  final String fullName;
  final String phone;
  final String email;
  final int cityId;
  final String postCode;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Region country;
  final Region state;
  final Region city;

  Address({
    required this.id,
    required this.userId,
    required this.countryId,
    required this.stateId,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.cityId,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.postCode,
    required this.state,
    required this.country,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: JsonUtils.parseIntFromJson(json["id"]),
        userId: JsonUtils.parseIntFromJson(json["user_id"]),
        countryId: JsonUtils.parseIntFromJson(json["country_id"]),
        stateId: JsonUtils.parseIntFromJson(json["state_id"]),
        fullName: JsonUtils.parseStringFromJson(json["full_name"]),
        postCode: JsonUtils.parseStringFromJson(json["postal_code"]),
        phone: JsonUtils.parseStringFromJson(json["phone"]),
        email: JsonUtils.parseStringFromJson(json["email"]),
        cityId: JsonUtils.parseIntFromJson(json["city"]),
        address: JsonUtils.parseStringFromJson(json["address"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        state: Region.fromJson(json["state"] ?? {}),
        country: Region.fromJson(json["country"] ?? {}),
        city: Region.fromJson(json["city_rel"] ?? {}),
      );
}
