import 'package:stock_pilot/core/common/data_state.dart';
import 'package:stock_pilot/features/auth/domain/entities/auth_session.dart';
import 'package:stock_pilot/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCases {
  const AuthUseCases(this._authRepository);

  final AuthRepository _authRepository;

  Future<DataState<AuthSession>> signInWithGoogle() {
    return _authRepository.signInWithGoogle();
  }

  Future<DataState<AuthSession?>> restoreSession() {
    return _authRepository.restoreSession();
  }

  Future<DataState<AuthSession>> refreshSession() {
    return _authRepository.refreshSession();
  }

  Future<DataState<void>> signOut() {
    return _authRepository.signOut();
  }

  Future<DataState<String?>> getAccessToken() {
    return _authRepository.getAccessToken();
  }
}
