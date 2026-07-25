import 'package:dartz/dartz.dart';
import 'package:naqel/core/errors/failures.dart';
import 'package:naqel/core/usecases/usecase.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';

class LoginUsecase extends UseCase<Either<Failure, UserEntity>, LoginParams> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await _repository.login(params);
  }
}
