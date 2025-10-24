import 'package:dartz/dartz.dart';
import '../repositories/package_repository.dart';
import '../entities/package.dart';
import '../../../../core/error/failure.dart';

class UpdatePackage {
  final PackageRepository repository;
  UpdatePackage(this.repository);

  Future<Either<Failure, Package>> call(Package pkg) {
    return repository.updatePackage(pkg);
  }
}
