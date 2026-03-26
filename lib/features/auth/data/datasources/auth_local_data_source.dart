import 'package:stock_pilot/features/auth/data/dto/auth_session_dto.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveSession(AuthSessionDto session);

  Future<AuthSessionDto?> readSession();

  Future<void> clearSession();
}
