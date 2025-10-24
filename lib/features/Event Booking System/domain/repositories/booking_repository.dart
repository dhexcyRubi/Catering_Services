import 'package:dartz/dartz.dart';
import '../entities/booking_request.dart';
import '../../../../core/error/failure.dart';

abstract class BookingRepository {
  /// Create a new booking request. Returns created BookingRequest on success.
  Future<Either<Failure, BookingRequest>> createBookingRequest(BookingRequest request);

  /// Get booking by id
  Future<Either<Failure, BookingRequest?>> getBookingById(String id);

  /// List bookings for a user (client or caterer). Optional filters.
  Future<Either<Failure, List<BookingRequest>>> listBookings({String? userId, int? limit, int? offset});

  /// Update booking status and optionally add admin/caterer notes
  Future<Either<Failure, BookingRequest>> updateBookingStatus({required String bookingId, required String status, String? note});
}
