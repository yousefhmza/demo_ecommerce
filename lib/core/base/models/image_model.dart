import '../../services/network/api_client.dart';
import '../../utils/json_utils.dart';

class ImageModel {
  final int id;
  final String title;
  final String path;
  final dynamic alt;
  final String size;
  final int userType;
  final int userId;
  final String dimensions;
  final DateTime createdAt;
  final DateTime updatedAt;

  ImageModel({
    required this.id,
    required this.title,
    required this.path,
    required this.alt,
    required this.size,
    required this.userType,
    required this.userId,
    required this.dimensions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: JsonUtils.parseIntFromJson(json["id"]),
        title: JsonUtils.parseStringFromJson(json["title"]),
        path: JsonUtils.parseStringFromJson("$mediaPath/${json["path"]}"),
        alt: json["alt"],
        size: JsonUtils.parseStringFromJson(json["size"]),
        userType: JsonUtils.parseIntFromJson(json["user_type"]),
        userId: JsonUtils.parseIntFromJson(json["user_id"]),
        dimensions: JsonUtils.parseStringFromJson(json["dimensions"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
      );
}
