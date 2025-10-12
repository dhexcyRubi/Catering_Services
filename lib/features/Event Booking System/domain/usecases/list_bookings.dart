import 'package:dartz/dartz.dart';
import '../repositories/booking_repository.dart';
import '../entities/booking_request.dart';
import '../failures/failure.dart';

class ListBookings {
  final BookingRepository repository;

  ListBookings(this.repository);

  Future<Either<Failure, List<BookingRequest>>> call({int? limit, int? offset}) {
    return repository.listBookings(limit: limit, offset: offset);
  }
}
