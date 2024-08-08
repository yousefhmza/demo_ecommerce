import '../../../../core/utils/json_utils.dart';

class Subcategory {
  final int id;
  final String name;
  final int imageId;
  final int categoryId;
  final String imageUrl;

  Subcategory({
    required this.id,
    required this.name,
    required this.imageId,
    required this.categoryId,
    required this.imageUrl,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        imageId: JsonUtils.parseIntFromJson(json["image_id"]),
        categoryId: JsonUtils.parseIntFromJson(json["category_id"]),
        imageUrl: JsonUtils.parseStringFromJson(json["image_url"]),
      );
}
