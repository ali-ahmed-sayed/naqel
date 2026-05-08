import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../../../../core/config/app_config.dart';

abstract class AuthRemoteDataSource {
  Stream<UserModel?> get onAuthStateChanged;
  Future<UserModel?> login({required String email, required String password});
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<void> logout();
  Future<void> forgotPassword({required String email});
  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? AppConfig.firebaseAuth;

  @override
  Stream<UserModel?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(
      (user) => _mapFirebaseUserToModel(user),
    );
  }

  @override
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _mapFirebaseUserToModel(credential.user);
  }

  @override
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user;
    if (user != null) {
      await user.updateDisplayName(name);
      // Reload to get updated displayName
      await user.reload();
      return _mapFirebaseUserToModel(_firebaseAuth.currentUser);
    }
    return null;
  }

  @override
  Future<void> logout() => _firebaseAuth.signOut();

  @override
  Future<void> forgotPassword({required String email}) =>
      _firebaseAuth.sendPasswordResetEmail(email: email);

  @override
  Future<UserModel?> getCurrentUser() async {
    return _mapFirebaseUserToModel(_firebaseAuth.currentUser);
  }

  UserModel? _mapFirebaseUserToModel(User? user) {
    if (user == null) return null;
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
