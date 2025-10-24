import '../../domain/entities/audit_log.dart';

class AuditLogModel extends AuditLog {
  AuditLogModel({
    required super.id,
    required super.bookingId,
    required super.actorId,
    required super.action,
    super.details,
    super.timestamp,
  });

  factory AuditLogModel.fromJson(Map<String, dynamic> json) {
    return AuditLogModel(
      id: json['id'],
      bookingId: json['bookingId'],
      actorId: json['actorId'],
      action: json['action'],
      details: json['details'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookingId': bookingId,
        'actorId': actorId,
        'action': action,
        'details': details,
        'timestamp': timestamp.toIso8601String(),
      };
}
