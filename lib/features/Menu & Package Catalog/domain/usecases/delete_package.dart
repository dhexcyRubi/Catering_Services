import 'package:dartz/dartz.dart';
import '../repositories/package_repository.dart';
import '../../../../core/error/failure.dart';

class DeletePackage {
  final PackageRepository repository;
  DeletePackage(this.repository);

  Future<Either<Failure, bool>> call(String id) {
    return repository.deletePackage(id);
  }
}
