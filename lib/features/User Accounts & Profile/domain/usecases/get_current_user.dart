import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../../../core/error/failure.dart';
import '../repositories/user_repository.dart';

class GetCurrentUser {
  final UserRepository repository;

  GetCurrentUser(this.repository);

  Future<Either<Failure, User?>> call() {
    return repository.getCurrentUser();
  }
}