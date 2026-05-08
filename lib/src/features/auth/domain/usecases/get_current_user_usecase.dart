import '../../../../core/core.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase extends UseCase<AppUser?, NoParams> {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  FutureEither<AppUser?> call(NoParams params) {
    return _repository
        .checkAuthState(); // Reuse checkAuthState or repository can have separate getCurrentUser
  }
}
