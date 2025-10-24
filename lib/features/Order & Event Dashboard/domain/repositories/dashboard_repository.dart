import 'package:dartz/dartz.dart';
import '../entities/booking_summary.dart';
import '../entities/booking_detail.dart';
import '../entities/booking_action.dart';
import '../entities/audit_log.dart';
import '../../../../core/error/failure.dart';

abstract class DashboardRepository {
  /// List upcoming bookings for admin dashboard with optional filters
  Future<Either<Failure, List<BookingSummary>>> listUpcomingBookings({
    DateTime? from,
    DateTime? to,
    String? status,
    int? limit,
    int? offset,
  });

  /// Get full booking detail by id
  Future<Either<Failure, BookingDetail>> getBookingDetail(String bookingId);

  /// Update booking status (Accept, Decline, RequestChanges)
  Future<Either<Failure, void>> updateBookingStatus(String bookingId, BookingAction action);

  /// Append an internal note to a booking
  Future<Either<Failure, void>> addInternalNote(String bookingId, String note, String authorId);

  /// Retrieve audit logs for a booking
  Future<Either<Failure, List<AuditLog>>> getAuditLogs(String bookingId);
}
