import '../../../../core/utils/json_utils.dart';

class Campaign {
  Campaign({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.startDate,
    required this.endDate,
  });

  final int id;
  final String title;
  final String subtitle;
  final String image;
  final DateTime startDate;
  final DateTime endDate;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: JsonUtils.parseIntFromJson(json["id"]),
        title: JsonUtils.parseStringFromJson(json["title"]),
        subtitle: JsonUtils.parseStringFromJson(json["subtitle"]),
        image: JsonUtils.parseStringFromJson(json["image"]),
        startDate: JsonUtils.parseDatetimeFromJson(json["start_date"]),
        endDate: JsonUtils.parseDatetimeFromJson(json["end_date"]),
      );
}
