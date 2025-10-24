import 'package:dartz/dartz.dart';
import '../repositories/booking_repository.dart';
import '../entities/booking_request.dart';
import '../../../../core/error/failure.dart';

class UpdateBookingStatus {
  final BookingRepository repository;

  UpdateBookingStatus(this.repository);

  Future<Either<Failure, BookingRequest>> call({required String bookingId, required String status, String? note}) {
    return repository.updateBookingStatus(bookingId: bookingId, status: status, note: note);
  }
}
