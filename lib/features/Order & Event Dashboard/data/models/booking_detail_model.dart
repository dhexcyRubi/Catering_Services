import '../../domain/entities/booking_detail.dart';
import '../../../Event Booking System/domain/entities/booking_request.dart';

class BookingDetailModel extends BookingDetail {
  const BookingDetailModel({
    required super.bookingRequest,
    required super.clientName,
    required super.clientContact,
    super.assignedStaffId,
    super.internalNotes,
  });

  factory BookingDetailModel.fromJson(Map<String, dynamic> json) {
    return BookingDetailModel(
      bookingRequest: BookingRequest.fromJson(json['bookingRequest']),
      clientName: json['clientName'],
      clientContact: json['clientContact'],
      assignedStaffId: json['assignedStaffId'] ?? '',
      internalNotes: List<String>.from(json['internalNotes'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'bookingRequest': bookingRequest.toJson(),
        'clientName': clientName,
        'clientContact': clientContact,
        'assignedStaffId': assignedStaffId,
        'internalNotes': internalNotes,
      };
}
