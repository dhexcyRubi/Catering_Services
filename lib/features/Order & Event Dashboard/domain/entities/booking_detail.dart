import 'package:equatable/equatable.dart';
import '../../../Event Booking System/domain/entities/booking_request.dart';

class BookingDetail extends Equatable {
  final BookingRequest bookingRequest;
  final String clientName;
  final String clientContact;
  final String assignedStaffId;
  final List<String> internalNotes;

  const BookingDetail({
    required this.bookingRequest,
    required this.clientName,
    required this.clientContact,
    this.assignedStaffId = '',
    this.internalNotes = const [],
  });

  @override
  List<Object?> get props => [bookingRequest, clientName, clientContact, assignedStaffId, internalNotes];
}
