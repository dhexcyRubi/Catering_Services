import 'package:dartz/dartz.dart';
import '../repositories/package_repository.dart';
import '../entities/package.dart';
import '../failures/failure.dart';

class CreatePackage {
  final PackageRepository repository;
  CreatePackage(this.repository);

  Future<Either<Failure, Package>> call(Package pkg) {
    return repository.createPackage(pkg);
  }
}
