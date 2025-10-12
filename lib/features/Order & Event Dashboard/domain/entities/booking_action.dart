import 'package:equatable/equatable.dart';
import '../../../Event Booking System/domain/entities/booking_status.dart';

class BookingAction extends Equatable {
  final String performedById;
  final BookingStatus fromStatus;
  final BookingStatus toStatus;
  final String? comment;
  final DateTime performedAt;

  BookingAction({
    required this.performedById,
    required this.fromStatus,
    required this.toStatus,
    this.comment,
    DateTime? performedAt,
  }) : performedAt = performedAt ?? DateTime.now();

  @override
  List<Object?> get props => [performedById, fromStatus, toStatus, comment, performedAt];
}
