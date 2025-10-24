import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import './user_remote_datasource.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final firebase_auth.FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserModel> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
    String? phone,
    required String role,
  }) async {
    final userCred = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userModel = UserModel(
      id: userCred.user!.uid,
      email: email,
      displayName: displayName,
      phone: phone,
      photoUrl: userCred.user!.photoURL,
      createdAt: DateTime.now(),
    );

    await firestore.collection('users').doc(userModel.id).set(userModel.toMap());
    return userModel;
  }

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCred = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final doc =
        await firestore.collection('users').doc(userCred.user!.uid).get();

    return UserModel.fromMap(doc.data()!, doc.id);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;

    final doc = await firestore.collection('users').doc(user.uid).get();
    if (!doc.exists) return null;

    return UserModel.fromMap(doc.data()!, doc.id);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserModel> updateProfile({
    required String uid,
    String? displayName,
    String? phone,
    String? photoUrl,
  }) async {
    final updates = {
      if (displayName != null) 'displayName': displayName,
      if (phone != null) 'phone': phone,
      if (photoUrl != null) 'photoUrl': photoUrl,
    };

    await firestore.collection('users').doc(uid).update(updates);

    final updatedDoc = await firestore.collection('users').doc(uid).get();
    return UserModel.fromMap(updatedDoc.data()!, updatedDoc.id);
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
