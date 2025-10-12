import 'package:dartz/dartz.dart';
import '../repositories/dashboard_repository.dart';
import '../entities/audit_log.dart';
import '../failures/failure.dart';

class GetAuditLogs {
  final DashboardRepository repository;
  GetAuditLogs(this.repository);

  Future<Either<Failure, List<AuditLog>>> call(String bookingId) {
    return repository.getAuditLogs(bookingId);
  }
}
