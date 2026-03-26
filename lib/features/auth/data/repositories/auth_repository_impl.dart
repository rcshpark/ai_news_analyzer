import 'package:stock_pilot/core/common/data_state.dart';
import 'package:stock_pilot/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:stock_pilot/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:stock_pilot/features/auth/data/datasources/google_auth_data_source.dart';
import 'package:stock_pilot/features/auth/data/dto/google_sign_in_request_dto.dart';
import 'package:stock_pilot/features/auth/domain/entities/auth_session.dart';
import 'package:stock_pilot/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required GoogleAuthDataSource googleAuthDataSource,
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
    this.devicePlatform,
  }) : _googleAuthDataSource = googleAuthDataSource,
       _authRemoteDataSource = authRemoteDataSource,
       _authLocalDataSource = authLocalDataSource;

  final GoogleAuthDataSource _googleAuthDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final String? devicePlatform;

  @override
  Future<DataState<String?>> getAccessToken() async {
    try {
      final AuthSession? session = await _restoreSessionOrNull();
      return DataStateSuccess<String?>(session?.accessToken);
    } on Exception catch (error) {
      return DataStateError<String?>(error, 'Failed to get access token.');
    } catch (error) {
      return DataStateError<String?>(
        Exception(error.toString()),
        'Failed to get access token.',
      );
    }
  }

  @override
  Future<DataState<AuthSession>> refreshSession() async {
    try {
      final AuthSession session = await _refreshSessionOrThrow();
      return DataStateSuccess<AuthSession>(session);
    } on Exception catch (error) {
      return DataStateError<AuthSession>(error, 'Failed to refresh session.');
    } catch (error) {
      return DataStateError<AuthSession>(
        Exception(error.toString()),
        'Failed to refresh session.',
      );
    }
  }

  @override
  Future<DataState<AuthSession?>> restoreSession() async {
    try {
      final AuthSession? session = await _restoreSessionOrNull();
      return DataStateSuccess<AuthSession?>(session);
    } on Exception catch (error) {
      return DataStateError<AuthSession?>(
        error,
        'Failed to restore session.',
      );
    } catch (error) {
      return DataStateError<AuthSession?>(
        Exception(error.toString()),
        'Failed to restore session.',
      );
    }
  }

  @override
  Future<DataState<AuthSession>> signInWithGoogle() async {
    try {
      final googleToken = await _googleAuthDataSource.signIn();
      final request = GoogleSignInRequestDto(
        idToken: googleToken.idToken,
        accessToken: googleToken.accessToken,
        serverAuthCode: googleToken.serverAuthCode,
        devicePlatform: devicePlatform,
      );

      final session = await _authRemoteDataSource.signInWithGoogleToken(request);
      await _authLocalDataSource.saveSession(session);
      return DataStateSuccess<AuthSession>(session.toEntity());
    } on Exception catch (error) {
      return DataStateError<AuthSession>(error, 'Failed to sign in with Google.');
    } catch (error) {
      return DataStateError<AuthSession>(
        Exception(error.toString()),
        'Failed to sign in with Google.',
      );
    }
  }

  @override
  Future<DataState<void>> signOut() async {
    try {
      final storedSession = await _authLocalDataSource.readSession();

      if (storedSession != null) {
        await _authRemoteDataSource.revokeSession(storedSession.refreshToken);
      }

      await _googleAuthDataSource.signOut();
      await _authLocalDataSource.clearSession();
      return DataStateSuccess<void>(null);
    } on Exception catch (error) {
      return DataStateError<void>(error, 'Failed to sign out.');
    } catch (error) {
      return DataStateError<void>(
        Exception(error.toString()),
        'Failed to sign out.',
      );
    }
  }

  Future<AuthSession> _refreshSessionOrThrow() async {
    final storedSession = await _authLocalDataSource.readSession();
    if (storedSession == null) {
      throw Exception('No stored session found.');
    }

    final refreshedSession = await _authRemoteDataSource.refreshSession(
      storedSession.refreshToken,
    );
    await _authLocalDataSource.saveSession(refreshedSession);
    return refreshedSession.toEntity();
  }

  Future<AuthSession?> _restoreSessionOrNull() async {
    final storedSession = await _authLocalDataSource.readSession();
    if (storedSession == null) {
      return null;
    }

    final AuthSession session = storedSession.toEntity();
    if (session.isExpired) {
      return _refreshSessionOrThrow();
    }

    return session;
  }
}
