import '../../../../core/utils/json_utils.dart';

class ChildCategory {
  final int id;
  final String name;
  final int imageId;
  final int subCategoryId;
  final String imageUrl;

  ChildCategory({
    required this.id,
    required this.name,
    required this.imageId,
    required this.subCategoryId,
    required this.imageUrl,
  });

  factory ChildCategory.fromJson(Map<String, dynamic> json) => ChildCategory(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        imageId: JsonUtils.parseIntFromJson(json["image_id"]),
        subCategoryId: JsonUtils.parseIntFromJson(json["sub_category_id"]),
        imageUrl: JsonUtils.parseStringFromJson(json["image_url"]),
      );
}
