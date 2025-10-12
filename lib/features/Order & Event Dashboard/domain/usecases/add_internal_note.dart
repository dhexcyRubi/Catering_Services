import 'package:dartz/dartz.dart';
import '../repositories/dashboard_repository.dart';
import '../failures/failure.dart';

class AddInternalNote {
  final DashboardRepository repository;
  AddInternalNote(this.repository);

  Future<Either<Failure, void>> call(String bookingId, String note, String authorId) {
    return repository.addInternalNote(bookingId, note, authorId);
  }
}
