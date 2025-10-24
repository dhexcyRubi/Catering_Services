import 'package:dartz/dartz.dart';
import '../repositories/dashboard_repository.dart';
import '../entities/booking_summary.dart';
import '../../../../core/error/failure.dart';

class ListUpcomingBookings {
  final DashboardRepository repository;
  ListUpcomingBookings(this.repository);

  Future<Either<Failure, List<BookingSummary>>> call({
    DateTime? from,
    DateTime? to,
    String? status,
    int? limit,
    int? offset,
  }) {
    return repository.listUpcomingBookings(from: from, to: to, status: status, limit: limit, offset: offset);
  }
}
