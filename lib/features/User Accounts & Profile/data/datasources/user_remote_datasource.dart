import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
    String? phone,
    required String role,
  });

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUser();

  Future<void> signOut();

  Future<UserModel> updateProfile({
    required String uid,
    String? displayName,
    String? phone,
    String? photoUrl,
  });

  Future<void> sendPasswordResetEmail({required String email});
}
