import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../failures/failure.dart';
import '../repositories/user_repository.dart';

class RegisterUser {
  final UserRepository repository;

  RegisterUser(this.repository);

  /// Returns created User on success.
  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    String? displayName,
    String? phone,
    required UserRole role,
  }) {
    return repository.registerWithEmailAndPassword(
      email: email,
      password: password,
      displayName: displayName,
      phone: phone,
      role: role,
    );
  }
}