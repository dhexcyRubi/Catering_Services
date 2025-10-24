import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard_remote_data_source.dart';
import '../models/audit_log_model.dart';
import '../models/booking_detail_model.dart';
import '../models/booking_action_model.dart';
import '../models/booking_summary_model.dart'; // export all models

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final FirebaseFirestore firestore;

  DashboardRemoteDataSourceImpl(this.firestore);

  @override
Future<List<BookingSummaryModel>> listUpcomingBookings({
  DateTime? from,
  DateTime? to,
  String? status,
  int? limit,
  int? offset,
}) async {
  Query query = firestore.collection('bookings');

  if (from != null) {
    query = query.where('eventDateTime', isGreaterThanOrEqualTo: from);
  }
  if (to != null) {
    query = query.where('eventDateTime', isLessThanOrEqualTo: to);
  }
  if (status != null) {
    query = query.where('status', isEqualTo: status);
  }

  if (limit != null) {
    query = query.limit(limit);
  }

  final snapshot = await query.get();

  // ✅ Map each Firestore document to a BookingSummaryModel
  return snapshot.docs
      .map((doc) => BookingSummaryModel.fromJson(doc.data() as Map<String, dynamic>))
      .toList();
}

  @override
  Future<BookingDetailModel> getBookingDetail(String bookingId) async {
    final doc = await firestore.collection('bookings').doc(bookingId).get();
    return BookingDetailModel.fromJson(doc.data()!);
  }

  @override
  Future<void> updateBookingStatus(String bookingId, BookingActionModel action) async {
    await firestore.collection('bookings').doc(bookingId).update({
      'status': action.toStatus.name,
      'lastAction': action.toJson(),
    });
  }

  @override
  Future<void> addInternalNote(String bookingId, String note, String authorId) async {
    await firestore.collection('bookings').doc(bookingId).update({
      'internalNotes': FieldValue.arrayUnion(['$authorId: $note']),
    });
  }

  @override
  Future<List<AuditLogModel>> getAuditLogs(String bookingId) async {
    final snapshot = await firestore
        .collection('auditLogs')
        .where('bookingId', isEqualTo: bookingId)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs.map((doc) => AuditLogModel.fromJson(doc.data())).toList();
  }
}
