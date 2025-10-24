import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/package.dart';
import '../../domain/repositories/package_repository.dart';
import '../datasources/package_remote_data_source.dart';
import '../models/package_model.dart';

class PackageRepositoryImpl implements PackageRepository {
  final PackageRemoteDataSource remoteDataSource;

  PackageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Package>> createPackage(Package pkg) async {
    try {
      final model = PackageModel(
        id: pkg.id,
        name: pkg.name,
        description: pkg.description,
        pricePerHead: pkg.pricePerHead,
        fixedPrice: pkg.fixedPrice,
        servingStyle: pkg.servingStyle,
        minGuests: pkg.minGuests,
        maxGuests: pkg.maxGuests,
        includedDishes: pkg.includedDishes,
        addonIds: pkg.addonIds,
        images: pkg.images,
        availability: pkg.availability,
        isDraft: pkg.isDraft,
        isPublished: pkg.isPublished,
        createdAt: pkg.createdAt,
      );
      final result = await remoteDataSource.createPackage(model);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, Package>> updatePackage(Package pkg) async {
    try {
      final result =
          await remoteDataSource.updatePackage(PackageModel.fromMap(pkg as Map<String, dynamic>));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePackage(String id) async {
    try {
      final result = await remoteDataSource.deletePackage(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, Package?>> getPackageById(String id) async {
    try {
      final result = await remoteDataSource.getPackageById(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Package>>> listPackages({
    bool publishedOnly = true,
    String? servingStyle,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await remoteDataSource.listPackages(
        publishedOnly: publishedOnly,
        servingStyle: servingStyle,
        limit: limit,
        offset: offset,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure( e.toString()));
    }
  }
}
