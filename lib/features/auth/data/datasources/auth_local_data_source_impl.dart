import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stock_pilot/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:stock_pilot/features/auth/data/dto/auth_session_dto.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({
    FlutterSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const String _sessionKey = 'auth_session';

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> clearSession() {
    return _secureStorage.delete(key: _sessionKey);
  }

  @override
  Future<AuthSessionDto?> readSession() async {
    final String? rawSession = await _secureStorage.read(key: _sessionKey);
    if (rawSession == null || rawSession.isEmpty) {
      return null;
    }

    final Map<String, Object?> json =
        jsonDecode(rawSession) as Map<String, Object?>;
    return AuthSessionDto.fromJson(json);
  }

  @override
  Future<void> saveSession(AuthSessionDto session) {
    return _secureStorage.write(
      key: _sessionKey,
      value: jsonEncode(session.toJson()),
    );
  }
}
