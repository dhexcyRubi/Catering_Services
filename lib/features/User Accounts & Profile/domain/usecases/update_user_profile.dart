import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../failures/failure.dart';
import '../repositories/user_repository.dart';

class UpdateUserProfile {
  final UserRepository repository;

  UpdateUserProfile(this.repository);

  Future<Either<Failure, User>> call({
    required String uid,
    String? displayName,
    String? phone,
    String? photoUrl,
  }) {
    return repository.updateProfile(
      uid: uid,
      displayName: displayName,
      phone: phone,
      photoUrl: photoUrl,
    );
  }
}