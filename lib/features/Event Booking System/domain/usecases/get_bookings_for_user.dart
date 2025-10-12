import 'package:dartz/dartz.dart';
import '../repositories/booking_repository.dart';
import '../entities/booking_request.dart';
import '../failures/failure.dart';

class GetBookingsForUser {
  final BookingRepository repository;

  GetBookingsForUser(this.repository);

  Future<Either<Failure, List<BookingRequest>>> call({required String userId, int? limit, int? offset}) {
    return repository.listBookings(userId: userId, limit: limit, offset: offset);
  }
}
