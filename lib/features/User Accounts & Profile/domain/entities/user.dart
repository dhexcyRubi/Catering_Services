import 'package:equatable/equatable.dart';

enum UserRole { client, caterer, admin, staff }

class User extends Equatable {
  final String id;
  final String email;
  final String? displayName;
  final String? phone;
  final UserRole role;
  final String? photoUrl;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.email,
    this.displayName,
    this.phone,
    this.role = UserRole.client,
    this.photoUrl,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  User copyWith({
    String? id,
    String? email,
    String? displayName,
    String? phone,
    UserRole? role,
    String? photoUrl,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, email, displayName, phone, role, photoUrl, createdAt];
}