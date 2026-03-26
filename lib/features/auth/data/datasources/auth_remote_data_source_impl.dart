import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stock_pilot/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:stock_pilot/features/auth/data/dto/auth_session_dto.dart';
import 'package:stock_pilot/features/auth/data/dto/google_sign_in_request_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required String baseUrl,
    http.Client? httpClient,
  }) : _baseUrl = baseUrl,
       _httpClient = httpClient ?? http.Client();

  final String _baseUrl;
  final http.Client _httpClient;

  @override
  Future<AuthSessionDto> refreshSession(String refreshToken) async {
    final Uri uri = Uri.parse('$_baseUrl/auth/refresh');
    final http.Response response = await _httpClient.post(
      uri,
      headers: _headers,
      body: jsonEncode(<String, Object?>{'refreshToken': refreshToken}),
    );

    return _parseSessionResponse(response);
  }

  @override
  Future<void> revokeSession(String refreshToken) async {
    final Uri uri = Uri.parse('$_baseUrl/auth/logout');
    final http.Response response = await _httpClient.post(
      uri,
      headers: _headers,
      body: jsonEncode(<String, Object?>{'refreshToken': refreshToken}),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AuthRemoteDataSourceException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }

  @override
  Future<AuthSessionDto> signInWithGoogleToken(
    GoogleSignInRequestDto request,
  ) async {
    final Uri uri = Uri.parse('$_baseUrl/auth/google');
    final http.Response response = await _httpClient.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    return _parseSessionResponse(response);
  }

  Map<String, String> get _headers => const <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  AuthSessionDto _parseSessionResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AuthRemoteDataSourceException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }

    final Map<String, Object?> json =
        jsonDecode(response.body) as Map<String, Object?>;
    return AuthSessionDto.fromJson(json);
  }
}

class AuthRemoteDataSourceException implements Exception {
  const AuthRemoteDataSourceException({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;
}
