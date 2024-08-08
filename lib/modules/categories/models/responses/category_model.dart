import '../../../../core/utils/json_utils.dart';

class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        slug: JsonUtils.parseStringFromJson(json["slug"]),
        imageUrl: JsonUtils.parseStringFromJson(json["image_url"] ?? json["categoryImage"]),
      );
}
