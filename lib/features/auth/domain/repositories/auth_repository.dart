import 'package:naqel/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';

abstract class AuthRepository {
  AuthRepository({required this.datasource});
  final AuthRemoteDataSource datasource;
  Future<UserEntity> login(LoginParams params);
  Future<UserEntity> driverSignup(DriverSignupParams params);
  Future<UserEntity> customerSignup(CustomerSignupParams params);
  Future<void> signOut();
}
