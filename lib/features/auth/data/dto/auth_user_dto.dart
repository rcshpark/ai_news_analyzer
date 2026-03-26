import 'package:stock_pilot/features/auth/domain/entities/auth_user.dart';

class AuthUserDto {
  const AuthUserDto({
    required this.id,
    required this.email,
    required this.name,
    this.profileImageUrl,
  });

  final String id;
  final String email;
  final String name;
  final String? profileImageUrl;

  factory AuthUserDto.fromJson(Map<String, Object?> json) {
    return AuthUserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'email': email,
      'name': name,
      'profileImageUrl': profileImageUrl,
    };
  }

  AuthUser toEntity() {
    return AuthUser(
      id: id,
      email: email,
      name: name,
      profileImageUrl: profileImageUrl,
    );
  }
}
