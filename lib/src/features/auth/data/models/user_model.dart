import 'package:equatable/equatable.dart';

/// Data model representing a user. Extends [Equatable] for value comparison.
/// Responsible for JSON serialization/deserialization.
class UserModel extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;

  const UserModel({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String? ?? '',
      email: map['email'] as String? ?? '',
      name: map['name'] as String?,
      photoUrl: map['photoUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      if (name != null) 'name': name,
      if (photoUrl != null) 'photoUrl': photoUrl,
    };
  }

  @override
  List<Object?> get props => [id, email, name, photoUrl];
}
