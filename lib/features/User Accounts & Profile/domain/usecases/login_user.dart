import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../../../core/error/failure.dart';
import '../repositories/user_repository.dart';

class LoginUser {
  final UserRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) {
    return repository.loginWithEmailAndPassword(email: email, password: password);
  }
}