import 'package:naqel/core/usecases/usecase.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase extends UseCase<void, NoParams> {
  SignOutUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<void> call(NoParams params) {
    return _repository.signOut();
  }
}
