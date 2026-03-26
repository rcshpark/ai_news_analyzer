import 'package:stock_pilot/features/auth/data/dto/google_identity_token_dto.dart';

abstract interface class GoogleAuthDataSource {
  Future<GoogleIdentityTokenDto> signIn();

  Future<void> signOut();
}
