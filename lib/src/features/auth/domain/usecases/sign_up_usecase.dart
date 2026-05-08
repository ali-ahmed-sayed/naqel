import '../../../../core/core.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase extends UseCase<AppUser, SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  FutureEither<AppUser> call(SignUpParams params) {
    return _repository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
