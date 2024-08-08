import '../../../../core/utils/json_utils.dart';

class CampaignInfo {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final DateTime startDate;
  final DateTime endDate;
  final dynamic status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int adminId;
  final int vendorId;
  dynamic type;

  CampaignInfo({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.adminId,
    required this.vendorId,
    required this.type,
  });

  factory CampaignInfo.fromJson(Map<String, dynamic> json) => CampaignInfo(
        id: JsonUtils.parseIntFromJson(json["id"]),
        title: JsonUtils.parseStringFromJson(json["title"]),
        subtitle: JsonUtils.parseStringFromJson(json["subtitle"]),
        image: JsonUtils.parseStringFromJson(json["image"]),
        startDate: JsonUtils.parseDatetimeFromJson(json["start_date"]),
        endDate: JsonUtils.parseDatetimeFromJson(json["end_date"]),
        status: json["status"],
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        adminId: JsonUtils.parseIntFromJson(json["admin_id"]),
        vendorId: JsonUtils.parseIntFromJson(json["vendor_id"]),
        type: json["type"],
      );
}
