import '../../../core/utils/json_utils.dart';

class Region {
  final int id;
  final String name;
  dynamic status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int countryId;
  final int stateId;

  Region({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.countryId,
    required this.stateId,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        status: json["status"],
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        countryId: JsonUtils.parseIntFromJson(json["country_id"]),
        stateId: JsonUtils.parseIntFromJson(json["state_id"]),
      );
}
