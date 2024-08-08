import '../../../../core/utils/json_utils.dart';

class ReturnPolicy {
  final int id;
  final int productId;
  final String shippingReturnDescription;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReturnPolicy({
    required this.id,
    required this.productId,
    required this.shippingReturnDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReturnPolicy.fromJson(Map<String, dynamic> json) => ReturnPolicy(
        id: JsonUtils.parseIntFromJson(json["id"]),
        productId: JsonUtils.parseIntFromJson(json["product_id"]),
        shippingReturnDescription: JsonUtils.parseStringFromJson(json["shipping_return_description"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
      );
}
