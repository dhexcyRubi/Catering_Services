import 'package:equatable/equatable.dart';

class AuditLog extends Equatable {
  final String id;
  final String bookingId;
  final String actorId;
  final String action;
  final String? details;
  final DateTime timestamp;

  AuditLog({
    required this.id,
    required this.bookingId,
    required this.actorId,
    required this.action,
    this.details,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [id, bookingId, actorId, action, details, timestamp];
}
