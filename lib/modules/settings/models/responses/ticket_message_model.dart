import '../../../../core/utils/json_utils.dart';

class TicketMessage {
  int id;
  String message;
  String notify;
  dynamic attachment;
  String type;
  int userId;
  int supportTicketId;
  DateTime createdAt;
  DateTime updatedAt;

  TicketMessage({
    required this.id,
    required this.message,
    required this.notify,
    required this.attachment,
    required this.type,
    required this.userId,
    required this.supportTicketId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TicketMessage.fromJson(Map<String, dynamic> json) => TicketMessage(
        id: JsonUtils.parseIntFromJson(json["id"]),
        message: JsonUtils.parseStringFromJson(json["message"]),
        notify: JsonUtils.parseStringFromJson(json["notify"]),
        attachment: json["attachment"],
        type: JsonUtils.parseStringFromJson(json["type"]),
        userId: JsonUtils.parseIntFromJson(json["user_id"]),
        supportTicketId: JsonUtils.parseIntFromJson(json["support_ticket_id"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
      );
}
