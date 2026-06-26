import 'package:naqel/core/usecases/usecase.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';

class LoginUsecase extends UseCase<UserEntity, LoginParams> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<UserEntity> call(LoginParams params) async {
    return await _repository.login(params);
  }
}
