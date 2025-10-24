import '../../domain/entities/booking_summary.dart';
import '../../../Event Booking System/domain/entities/booking_status.dart';

class BookingSummaryModel extends BookingSummary {
  const BookingSummaryModel({
    required super.id,
    required super.eventDateTime,
    required super.timezone,
    required super.clientName,
    required super.packageName,
    required super.guestCount,
    super.status,
    super.paymentStatus,
  });

  factory BookingSummaryModel.fromJson(Map<String, dynamic> json) {
    return BookingSummaryModel(
      id: json['id'],
      eventDateTime: DateTime.parse(json['eventDateTime']),
      timezone: json['timezone'],
      clientName: json['clientName'],
      packageName: json['packageName'],
      guestCount: json['guestCount'],
      status: BookingStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => BookingStatus.pending,
      ),
      paymentStatus: json['paymentStatus'] ?? 'unpaid',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'eventDateTime': eventDateTime.toIso8601String(),
        'timezone': timezone,
        'clientName': clientName,
        'packageName': packageName,
        'guestCount': guestCount,
        'status': status.name,
        'paymentStatus': paymentStatus,
      };
}
