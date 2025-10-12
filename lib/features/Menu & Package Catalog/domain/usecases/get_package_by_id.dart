import 'package:dartz/dartz.dart';
import '../repositories/package_repository.dart';
import '../entities/package.dart';
import '../failures/failure.dart';

class GetPackageById {
  final PackageRepository repository;
  GetPackageById(this.repository);

  Future<Either<Failure, Package?>> call(String id) {
    return repository.getPackageById(id);
  }
}
