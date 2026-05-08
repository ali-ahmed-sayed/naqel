import '../../../../core/core.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class CheckAuthStateUseCase extends UseCase<AppUser?, NoParams> {
  final AuthRepository _repository;

  CheckAuthStateUseCase(this._repository);

  @override
  FutureEither<AppUser?> call(NoParams params) {
    return _repository.checkAuthState();
  }
}
