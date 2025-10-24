import 'package:dartz/dartz.dart';
import '../repositories/dashboard_repository.dart';
import '../entities/booking_detail.dart';
import '../../../../core/error/failure.dart';

class GetBookingDetail {
  final DashboardRepository repository;
  GetBookingDetail(this.repository);

  Future<Either<Failure, BookingDetail>> call(String bookingId) {
    return repository.getBookingDetail(bookingId);
  }
}
