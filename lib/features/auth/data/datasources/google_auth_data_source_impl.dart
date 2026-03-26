import 'package:google_sign_in/google_sign_in.dart';
import 'package:stock_pilot/features/auth/data/datasources/google_auth_data_source.dart';
import 'package:stock_pilot/features/auth/data/dto/google_identity_token_dto.dart';

class GoogleAuthDataSourceImpl implements GoogleAuthDataSource {
  GoogleAuthDataSourceImpl({GoogleSignIn? googleSignIn})
    : _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final GoogleSignIn _googleSignIn;

  @override
  Future<GoogleIdentityTokenDto> signIn() async {
    await _googleSignIn.initialize();

    final GoogleSignInAccount account = await _googleSignIn.authenticate();

    final GoogleSignInAuthentication authentication = account.authentication;
    final String? idToken = authentication.idToken;

    if (idToken == null || idToken.isEmpty) {
      throw const GoogleAuthDataSourceException(
        'Google sign-in did not return an idToken.',
      );
    }

    return GoogleIdentityTokenDto(
      idToken: idToken,
      email: account.email,
      displayName: account.displayName,
    );
  }

  @override
  Future<void> signOut() {
    return _googleSignIn.signOut();
  }
}

class GoogleAuthDataSourceException implements Exception {
  const GoogleAuthDataSourceException(this.message);

  final String message;
}
