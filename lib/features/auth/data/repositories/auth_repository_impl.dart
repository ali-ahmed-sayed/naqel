import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required super.datasource});

  @override
  Future<UserEntity> login(LoginParams params) async {
    return datasource.login(params);
  }

  @override
  Future<UserEntity> driverSignup(DriverSignupParams params) async {
    return datasource.driverSignup(params);
  }

  @override
  Future<UserEntity> customerSignup(CustomerSignupParams params) async {
    return datasource.customerSignup(params);
  }

  @override
  Future<void> signOut() async {
    return datasource.signOut();
  }
}
