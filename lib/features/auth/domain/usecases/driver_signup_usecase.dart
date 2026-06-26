import 'package:naqel/core/usecases/usecase.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';

class DriverSignupUsecase extends UseCase<UserEntity, DriverSignupParams> {
  DriverSignupUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<UserEntity> call(DriverSignupParams params) {
    return _repository.driverSignup(params);
  }
}
