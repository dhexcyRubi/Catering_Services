import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/booking_request.dart';
import '../../domain/repositories/booking_repository.dart';
import '../../data/datasource/booking_remote_data_source.dart';
import '../models/booking_request_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, BookingRequest>> createBookingRequest(BookingRequest request) async {
    try {
      final result = await remoteDataSource.createBooking(request as BookingRequestModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to create booking: $e'));
    }
  }

  @override
  Future<Either<Failure, BookingRequest?>> getBookingById(String id) async {
    try {
      final result = await remoteDataSource.getBookingById(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch booking: $e'));
    }
  }

  @override
  Future<Either<Failure, List<BookingRequest>>> listBookings({String? userId, int? limit, int? offset}) async {
    try {
      final result = await remoteDataSource.listBookings(userId: userId, limit: limit, offset: offset);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to list bookings: $e'));
    }
  }

  @override
  Future<Either<Failure, BookingRequest>> updateBookingStatus({required String bookingId, required String status, String? note}) async {
    try {
      final result = await remoteDataSource.updateBookingStatus(bookingId, status, note: note);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to update booking status: $e'));
    }
  }
}
