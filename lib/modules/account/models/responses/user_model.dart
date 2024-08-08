import '../../../../core/utils/json_utils.dart';
import '../../../addresses/models/responses/address_model.dart';
import '../../../regions/models/region_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String emailVerifiedAt;
  final String username;
  final int emailVerified;
  final String emailVerifyToken;
  final String postalCode;
  final String mobile;
  final String company;
  final String address;
  final String state;
  final String image;
  final String country;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String profileImageUrl;
  final Region userCountry;
  final Region userState;
  final Region userCity;
  final Address deliveryAddress;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.username,
    required this.emailVerified,
    required this.emailVerifyToken,
    required this.mobile,
    required this.company,
    required this.address,
    required this.userCity,
    required this.state,
    required this.image,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImageUrl,
    required this.userCountry,
    required this.userState,
    required this.deliveryAddress,
    required this.postalCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        email: JsonUtils.parseStringFromJson(json["email"]),
        emailVerifiedAt: JsonUtils.parseStringFromJson(json["email_verified_at"]),
        username: JsonUtils.parseStringFromJson(json["username"]),
        emailVerified: JsonUtils.parseIntFromJson(json["email_verified"]),
        emailVerifyToken: JsonUtils.parseStringFromJson(json["email_verify_token"]),
        mobile: JsonUtils.parseStringFromJson(json["mobile"]),
        company: JsonUtils.parseStringFromJson(json["company"]),
        address: JsonUtils.parseStringFromJson(json["address"]),
        state: JsonUtils.parseStringFromJson(json["state"]),
        image: JsonUtils.parseStringFromJson(json["image"]),
        country: JsonUtils.parseStringFromJson(json["country"]),
        postalCode: JsonUtils.parseStringFromJson(json["postal_code"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        profileImageUrl: JsonUtils.parseStringFromJson(json["profile_image_url"]),
        userCountry: Region.fromJson(json["user_country"] ?? {}),
        userCity: Region.fromJson(json["user_city"] ?? {}),
        userState: Region.fromJson(json["user_state"] ?? {}),
        deliveryAddress: Address.fromJson(json["delivery_address"] ?? {}),
      );
}
