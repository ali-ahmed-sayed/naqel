import 'package:naqel/core/usecases/usecase.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';

class CustomerSignupUsecase extends UseCase<UserEntity, CustomerSignupParams> {
  CustomerSignupUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<UserEntity> call(CustomerSignupParams params) {
    return _repository.customerSignup(params);
  }
}
