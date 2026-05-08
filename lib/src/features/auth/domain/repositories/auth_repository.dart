import '../../../../core/core.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  /// Stream of auth state changes. Emits AppUser when authenticated, null when not.
  Stream<AppUser?> get onAuthStateChanged;

  /// Sign in with email and password
  FutureEither<AppUser> login({
    required String email,
    required String password,
  });

  /// Sign up with email, password, and name
  FutureEither<AppUser> signUp({
    required String name,
    required String email,
    required String password,
  });

  /// Send a password reset email
  FutureEither<void> forgotPassword({required String email});

  /// Sign out the current user
  FutureEither<void> logout();

  /// Check current auth state
  FutureEither<AppUser?> checkAuthState();
}
