import '../../../../core/utils/json_utils.dart';
import '../../../account/models/responses/user_model.dart';

class ProductReview {
  final int id;
  final int productId;
  final int userId;
  final int rating;
  final String reviewText;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserModel user;

  ProductReview({
    required this.id,
    required this.productId,
    required this.userId,
    required this.rating,
    required this.reviewText,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
        id: JsonUtils.parseIntFromJson(json["id"]),
        productId: JsonUtils.parseIntFromJson(json["product_id"]),
        userId: JsonUtils.parseIntFromJson(json["user_id"]),
        rating: JsonUtils.parseIntFromJson(json["rating"]),
        reviewText: JsonUtils.parseStringFromJson(json["review_text"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        user: UserModel.fromJson(json["user"] ?? {}),
      );
}
