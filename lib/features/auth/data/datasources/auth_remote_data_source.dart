import 'package:stock_pilot/features/auth/data/dto/auth_session_dto.dart';
import 'package:stock_pilot/features/auth/data/dto/google_sign_in_request_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthSessionDto> signInWithGoogleToken(
    GoogleSignInRequestDto request,
  );

  Future<AuthSessionDto> refreshSession(String refreshToken);

  Future<void> revokeSession(String refreshToken);
}
