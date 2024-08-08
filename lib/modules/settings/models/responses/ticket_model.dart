import '../../../../core/utils/json_utils.dart';

class Ticket {
  final int id;
  final String title;
  final String via;
  final String operatingSystem;
  final String userAgent;
  final String description;
  final String subject;
  final String status;
  final String priority;
  final int departments;
  final int userId;
  final int adminId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Ticket({
    required this.id,
    required this.title,
    required this.via,
    required this.operatingSystem,
    required this.userAgent,
    required this.description,
    required this.subject,
    required this.status,
    required this.priority,
    required this.departments,
    required this.userId,
    required this.adminId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: JsonUtils.parseIntFromJson(json["id"]),
        title: JsonUtils.parseStringFromJson(json["title"]),
        via: JsonUtils.parseStringFromJson(json["via"]),
        operatingSystem: JsonUtils.parseStringFromJson(json["operating_system"]),
        userAgent: JsonUtils.parseStringFromJson(json["user_agent"]),
        description: JsonUtils.parseStringFromJson(json["description"]),
        subject: JsonUtils.parseStringFromJson(json["subject"]),
        status: JsonUtils.parseStringFromJson(json["status"]),
        priority: JsonUtils.parseStringFromJson(json["priority"]),
        departments: JsonUtils.parseIntFromJson(json["departments"]),
        userId: JsonUtils.parseIntFromJson(json["user_id"]),
        adminId: JsonUtils.parseIntFromJson(json["admin_id"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
      );
}
