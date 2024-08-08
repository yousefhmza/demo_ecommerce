import '../../../../core/utils/json_utils.dart';

class DeliveryOption {
  final int id;
  final int productId;
  final int deliveryOptionId;

  DeliveryOption({
    required this.id,
    required this.productId,
    required this.deliveryOptionId,
  });

  factory DeliveryOption.fromJson(Map<String, dynamic> json) => DeliveryOption(
        id: JsonUtils.parseIntFromJson(json["id"]),
        productId: JsonUtils.parseIntFromJson(json["product_id"]),
        deliveryOptionId: JsonUtils.parseIntFromJson(json["delivery_option_id"]),
      );
}
