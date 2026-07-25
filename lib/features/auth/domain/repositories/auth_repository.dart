import 'package:dartz/dartz.dart';
import 'package:naqel/core/errors/failures.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(LoginParams params);
  Future<Either<Failure, UserEntity>> driverSignup(DriverSignupParams params);
  Future<Either<Failure, UserEntity>> customerSignup(
    CustomerSignupParams params,
  );
  Future<Either<Failure, void>> signOut();
}
