import 'dart:developer';

import 'package:naqel/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:naqel/core/errors/failures.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource datasource})
    : _datasource = datasource;
  final AuthRemoteDataSource _datasource;
  @override
  Future<Either<Failure, UserEntity>> login(LoginParams params) async {
    try {
      final userModel = await _datasource.login(params);
      log("Done the datasource");
      return userModel; // UserModel is a UserEntity
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> driverSignup(
    DriverSignupParams params,
  ) async {
    try {
      final userModel = await _datasource.driverSignup(params);
      return userModel;
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> customerSignup(
    CustomerSignupParams params,
  ) async {
    try {
      final userModel = await _datasource.customerSignup(params);
      return userModel;
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _datasource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
