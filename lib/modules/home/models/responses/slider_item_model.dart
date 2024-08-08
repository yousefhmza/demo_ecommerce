import '../../../../core/utils/json_utils.dart';

class SliderItemModel {
  final String title;
  final String description;
  final String image;
  final String buttonUrl;
  final String buttonText;
  final int campaignId;
  final String category;

  SliderItemModel({
    required this.title,
    required this.description,
    required this.image,
    required this.buttonUrl,
    required this.buttonText,
    required this.campaignId,
    required this.category,
  });

  factory SliderItemModel.fromJson(Map<String, dynamic> json) => SliderItemModel(
        title: JsonUtils.parseStringFromJson(json["title"]),
        description: JsonUtils.parseStringFromJson(json["description"]),
        image: JsonUtils.parseStringFromJson(json["image"]),
        buttonUrl: JsonUtils.parseStringFromJson(json["button_url"]),
        buttonText: JsonUtils.parseStringFromJson(json["button_text"]),
        campaignId: JsonUtils.parseIntFromJson(json["campaign"]),
        category: JsonUtils.parseStringFromJson(json["category"]),
      );
}
