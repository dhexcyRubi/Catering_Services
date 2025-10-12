import 'package:dartz/dartz.dart';
import '../entities/package.dart';
import '../failures/failure.dart';

abstract class PackageRepository {
  /// Create a new package
  Future<Either<Failure, Package>> createPackage(Package pkg);

  /// Update an existing package
  Future<Either<Failure, Package>> updatePackage(Package pkg);

  /// Delete a package by id
  Future<Either<Failure, bool>> deletePackage(String id);

  /// Get package by id
  Future<Either<Failure, Package?>> getPackageById(String id);

  /// List packages with optional filters (e.g., published only, servingStyle, price range)
  Future<Either<Failure, List<Package>>> listPackages({bool publishedOnly = true, String? servingStyle, int? limit, int? offset});
}
