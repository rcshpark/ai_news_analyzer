import 'package:stock_pilot/features/auth/data/dto/auth_user_dto.dart';
import 'package:stock_pilot/features/auth/domain/entities/auth_session.dart';

class AuthSessionDto {
  const AuthSessionDto({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiresAt,
  });

  final AuthUserDto user;
  final String accessToken;
  final String refreshToken;
  final DateTime accessTokenExpiresAt;

  factory AuthSessionDto.fromJson(Map<String, Object?> json) {
    return AuthSessionDto(
      user: AuthUserDto.fromJson(json['user'] as Map<String, Object?>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpiresAt: DateTime.parse(
        json['accessTokenExpiresAt'] as String,
      ),
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'user': user.toJson(),
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'accessTokenExpiresAt': accessTokenExpiresAt.toIso8601String(),
    };
  }

  AuthSession toEntity() {
    return AuthSession(
      user: user.toEntity(),
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessTokenExpiresAt: accessTokenExpiresAt,
    );
  }
}
