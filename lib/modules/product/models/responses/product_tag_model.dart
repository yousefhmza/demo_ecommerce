import '../../../../core/utils/json_utils.dart';

class Tag {
  final int id;
  final String tagName;
  final int productId;

  Tag({
    required this.id,
    required this.tagName,
    required this.productId,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: JsonUtils.parseIntFromJson(json["id"]),
        tagName: JsonUtils.parseStringFromJson(json["tag_name"]),
        productId: JsonUtils.parseIntFromJson(json["product_id"]),
      );
}
