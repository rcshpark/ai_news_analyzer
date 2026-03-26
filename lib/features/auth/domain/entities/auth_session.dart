import 'package:stock_pilot/features/auth/domain/entities/auth_user.dart';

class AuthSession {
  const AuthSession({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiresAt,
  });

  final AuthUser user;
  final String accessToken;
  final String refreshToken;
  final DateTime accessTokenExpiresAt;

  bool get isExpired => DateTime.now().isAfter(accessTokenExpiresAt);
}
