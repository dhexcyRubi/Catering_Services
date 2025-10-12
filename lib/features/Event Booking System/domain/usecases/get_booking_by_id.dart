import 'package:dartz/dartz.dart';
import '../repositories/booking_repository.dart';
import '../entities/booking_request.dart';
import '../failures/failure.dart';

class GetBookingById {
  final BookingRepository repository;

  GetBookingById(this.repository);

  Future<Either<Failure, BookingRequest?>> call(String id) {
    return repository.getBookingById(id);
  }
}
