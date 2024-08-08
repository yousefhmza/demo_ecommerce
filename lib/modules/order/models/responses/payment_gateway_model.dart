import '../../../../core/utils/json_utils.dart';

class PaymentGateway {
  final String name;
  final String image;
  final String description;
  final int status;
  final int testMode;
  final Map<String, dynamic> credentials;

  PaymentGateway({
    required this.name,
    required this.image,
    required this.description,
    required this.status,
    required this.testMode,
    required this.credentials,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        name: JsonUtils.parseStringFromJson(json["name"]),
        image: JsonUtils.parseStringFromJson(json["image"]),
        description: JsonUtils.parseStringFromJson(json["description"]),
        status: JsonUtils.parseIntFromJson(json["status"]),
        testMode: JsonUtils.parseIntFromJson(json["test_mode"]),
        credentials: json["credentials"] ?? {},
      );
}
