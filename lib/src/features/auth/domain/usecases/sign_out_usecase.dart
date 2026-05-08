import '../../../../core/core.dart';
import '../repositories/auth_repository.dart';

class SignOutUseCase extends UseCase<void, NoParams> {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  @override
  FutureEither<void> call(NoParams params) {
    return _repository.logout();
  }
}
