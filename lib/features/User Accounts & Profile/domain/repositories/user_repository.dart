import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../../../core/error/failure.dart';

abstract class UserRepository {
  /// Register a new user (backed by Firebase Auth in implementation).
  Future<Either<Failure, User>> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
    String? phone,
    required UserRole role,
  });

  /// Sign in existing user
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Return currently authenticated user or null if none
  Future<Either<Failure, User?>> getCurrentUser();

  /// Sign out
  Future<Either<Failure, void>> signOut();

  /// Update profile fields (partial update)
  Future<Either<Failure, User>> updateProfile({
    required String uid,
    String? displayName,
    String? phone,
    String? photoUrl,
  });

  /// Send password reset email (optional MVP)
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
}