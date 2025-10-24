import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String email,
    String? displayName,
    String? phone,
    UserRole role = UserRole.client,
    String? photoUrl,
    DateTime? createdAt,
  }) : super(
          id: id,
          email: email,
          displayName: displayName,
          phone: phone,
          role: role,
          photoUrl: photoUrl,
          createdAt: createdAt,
        );

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      email: map['email'],
      displayName: map['displayName'],
      phone: map['phone'],
      role: UserRole.values.firstWhere(
        (e) => e.toString() == 'UserRole.${map['role']}',
        orElse: () => UserRole.client,
      ),
      photoUrl: map['photoUrl'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'phone': phone,
      'role': role.name,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      displayName: user.displayName,
      phone: user.phone,
      role: user.role,
      photoUrl: user.photoUrl,
      createdAt: user.createdAt,
    );
  }
}
