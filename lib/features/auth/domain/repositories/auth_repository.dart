import 'package:stock_pilot/core/common/data_state.dart';
import 'package:stock_pilot/features/auth/domain/entities/auth_session.dart';

abstract interface class AuthRepository {
  Future<DataState<AuthSession>> signInWithGoogle();

  Future<DataState<AuthSession?>> restoreSession();

  Future<DataState<AuthSession>> refreshSession();

  Future<DataState<void>> signOut();

  Future<DataState<String?>> getAccessToken();
}
