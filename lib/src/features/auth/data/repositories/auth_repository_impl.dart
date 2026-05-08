import '../../../../core/core.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({AuthRemoteDataSource? remoteDataSource})
    : _remoteDataSource = remoteDataSource ?? AuthRemoteDataSourceImpl();

  @override
  Stream<AppUser?> get onAuthStateChanged {
    return _remoteDataSource.onAuthStateChanged.map(
      (model) => _mapModelToEntity(model),
    );
  }

  @override
  FutureEither<AppUser> login({
    required String email,
    required String password,
  }) async {
    return runTask(() async {
      final model = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      if (model == null) {
        throw Exception('Login failed: User record not found');
      }
      return _mapModelToEntity(model)!;
    }, requiresNetwork: true);
  }

  @override
  FutureEither<AppUser> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return runTask(() async {
      final model = await _remoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (model == null) {
        throw Exception('Sign up failed: User record corrupted');
      }
      return _mapModelToEntity(model)!;
    }, requiresNetwork: true);
  }

  @override
  FutureEither<void> forgotPassword({required String email}) async {
    return runTask(
      () => _remoteDataSource.forgotPassword(email: email),
      requiresNetwork: true,
    );
  }

  @override
  FutureEither<void> logout() async {
    return runTask(() => _remoteDataSource.logout(), requiresNetwork: true);
  }

  @override
  FutureEither<AppUser?> checkAuthState() async {
    return runTask(() async {
      final model = await _remoteDataSource.getCurrentUser();
      return _mapModelToEntity(model);
    });
  }

  AppUser? _mapModelToEntity(UserModel? model) {
    if (model == null) return null;
    return AppUser(
      id: model.id,
      email: model.email,
      name: model.name,
      photoUrl: model.photoUrl,
    );
  }
}
