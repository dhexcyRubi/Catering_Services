import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/audit_log.dart';
import '../../domain/entities/booking_action.dart';
import '../../domain/entities/booking_detail.dart';
import '../../domain/entities/booking_summary.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasource/dashboard_remote_data_source.dart';
import '../models/booking_action_model.dart';


class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BookingSummary>>> listUpcomingBookings({
    DateTime? from,
    DateTime? to,
    String? status,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await remoteDataSource.listUpcomingBookings(
        from: from,
        to: to,
        status: status,
        limit: limit,
        offset: offset,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingDetail>> getBookingDetail(String bookingId) async {
    try {
      final detail = await remoteDataSource.getBookingDetail(bookingId);
      return Right(detail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateBookingStatus(String bookingId, BookingAction action) async {
    try {
      final model = BookingActionModel(
        performedById: action.performedById,
        fromStatus: action.fromStatus,
        toStatus: action.toStatus,
        comment: action.comment,
        performedAt: action.performedAt,
      );
      await remoteDataSource.updateBookingStatus(bookingId, model);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addInternalNote(String bookingId, String note, String authorId) async {
    try {
      await remoteDataSource.addInternalNote(bookingId, note, authorId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AuditLog>>> getAuditLogs(String bookingId) async {
    try {
      final logs = await remoteDataSource.getAuditLogs(bookingId);
      return Right(logs);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
