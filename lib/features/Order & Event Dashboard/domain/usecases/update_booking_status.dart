import 'package:dartz/dartz.dart';
import '../repositories/dashboard_repository.dart';
import '../entities/booking_action.dart';
import '../failures/failure.dart';

class UpdateBookingStatus {
  final DashboardRepository repository;
  UpdateBookingStatus(this.repository);

  Future<Either<Failure, void>> call(String bookingId, BookingAction action) {
    return repository.updateBookingStatus(bookingId, action);
  }
}
