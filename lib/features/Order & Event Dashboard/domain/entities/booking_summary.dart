import 'package:equatable/equatable.dart';
import '../../../Event Booking System/domain/entities/booking_status.dart';

class BookingSummary extends Equatable {
  final String id;
  final DateTime eventDateTime;
  final String timezone;
  final String clientName;
  final String packageName;
  final int guestCount;
  final BookingStatus status;
  final String paymentStatus;

  const BookingSummary({
    required this.id,
    required this.eventDateTime,
    required this.timezone,
    required this.clientName,
    required this.packageName,
    required this.guestCount,
    this.status = BookingStatus.pending,
    this.paymentStatus = 'unpaid',
  });

  @override
  List<Object?> get props => [id, eventDateTime, timezone, clientName, packageName, guestCount, status, paymentStatus];
}
