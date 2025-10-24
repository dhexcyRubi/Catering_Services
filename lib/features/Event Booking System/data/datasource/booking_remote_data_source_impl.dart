import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_request_model.dart';
import 'booking_remote_data_source.dart';

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final FirebaseFirestore firestore;

  BookingRemoteDataSourceImpl(this.firestore);

  @override
  Future<BookingRequestModel> createBooking(BookingRequestModel request) async {
    final doc = firestore.collection('bookings').doc(request.id);
    await doc.set(request.toJson());
    return request;
  }

  @override
  Future<BookingRequestModel?> getBookingById(String id) async {
    final doc = await firestore.collection('bookings').doc(id).get();
    if (!doc.exists) return null;
    return BookingRequestModel.fromJson(doc.data()!..['id'] = doc.id);
  }

  @override
 Future<List<BookingRequestModel>> listBookings({
  String? userId,
  int? limit,
  int? offset,
}) async {
  Query query = firestore.collection('bookings');
  
  if (userId != null) {
    query = query.where('clientId', isEqualTo: userId);
  }
  if (limit != null) {
    query = query.limit(limit);
  }

  final snapshot = await query.get();

  return snapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id; // ✅ inject Firestore doc ID
    return BookingRequestModel.fromJson(data);
  }).toList();
}


  @override
  Future<BookingRequestModel> updateBookingStatus(String bookingId, String status, {String? note}) async {
    final doc = firestore.collection('bookings').doc(bookingId);
    await doc.update({
      'status': status.toUpperCase(),
      if (note != null) 'notes': note,
    });
    final updated = await doc.get();
    return BookingRequestModel.fromJson(updated.data()!..['id'] = updated.id);
  }
}
