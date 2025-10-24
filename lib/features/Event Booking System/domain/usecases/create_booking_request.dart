import 'package:dartz/dartz.dart';
import '../repositories/booking_repository.dart';
import '../entities/booking_request.dart';
import '../../../../core/error/failure.dart';

class CreateBookingRequest {
  final BookingRepository repository;

  CreateBookingRequest(this.repository);

  Future<Either<Failure, BookingRequest>> call(BookingRequest request) {
    return repository.createBookingRequest(request);
  }
}
