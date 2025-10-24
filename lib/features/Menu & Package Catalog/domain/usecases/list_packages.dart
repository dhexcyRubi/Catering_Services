import 'package:dartz/dartz.dart';
import '../repositories/package_repository.dart';
import '../entities/package.dart';
import '../../../../core/error/failure.dart';

class ListPackages {
  final PackageRepository repository;
  ListPackages(this.repository);

  Future<Either<Failure, List<Package>>> call({bool publishedOnly = true, String? servingStyle, int? limit, int? offset}) {
    return repository.listPackages(publishedOnly: publishedOnly, servingStyle: servingStyle, limit: limit, offset: offset);
  }
}
