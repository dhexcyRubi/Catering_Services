import '../models/booking_request_model.dart';

abstract class BookingRemoteDataSource {
  Future<BookingRequestModel> createBooking(BookingRequestModel request);
  Future<BookingRequestModel?> getBookingById(String id);
  Future<List<BookingRequestModel>> listBookings({String? userId, int? limit, int? offset});
  Future<BookingRequestModel> updateBookingStatus(String bookingId, String status, {String? note});
}
