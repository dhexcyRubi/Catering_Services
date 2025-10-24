import '../models/booking_summary_model.dart';
import '../models/booking_detail_model.dart';
import '../models/booking_action_model.dart';
import '../models/audit_log_model.dart';

abstract class DashboardRemoteDataSource {
  Future<List<BookingSummaryModel>> listUpcomingBookings({
    DateTime? from,
    DateTime? to,
    String? status,
    int? limit,
    int? offset,
  });

  Future<BookingDetailModel> getBookingDetail(String bookingId);

  Future<void> updateBookingStatus(String bookingId, BookingActionModel action);

  Future<void> addInternalNote(String bookingId, String note, String authorId);

  Future<List<AuditLogModel>> getAuditLogs(String bookingId);
}
