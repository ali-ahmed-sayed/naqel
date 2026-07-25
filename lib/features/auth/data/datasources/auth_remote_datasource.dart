// data/datasources/auth_remote_datasource.dart
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naqel/core/errors/failures.dart';
import 'package:naqel/core/utils/upload_image.dart';
import 'package:naqel/features/auth/data/models/user_model.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_state.dart';
import 'package:naqel/injection_container.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel>> login(LoginParams params);
  Future<Either<Failure, CustomerModel>> customerSignup(
    CustomerSignupParams params,
  );
  Future<Either<Failure, DriverModel>> driverSignup(DriverSignupParams params);
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(
    FirebaseAuth this.firebaseAuth,
    FirebaseFirestore this.firestore,
  );

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  @override
  Future<Either<Failure, UserModel>> login(LoginParams params) async {
    log("Logging in with email: ${params.email}");
    try {
      final creds = await firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final uid = creds.user?.uid;
      if (uid == null) return Left(ServerFailure("User ID is null"));

      final userDoc = await firestore.collection('users').doc(uid).get();
      final data = userDoc.data();

      if (!userDoc.exists || data == null) {
        return Left(ServerFailure("User document does not exist in Firestore"));
      }

      log("Retrieved user data for UID: $uid");
      return Right(UserModel.fromJson(data));
    } catch (e) {
      log("ServerError: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> customerSignup(
    CustomerSignupParams params,
  ) async {
    final creds = await firebaseAuth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    final Map<String, dynamic> userData = {
      'id': creds.user?.uid,
      'customerId': creds.user?.uid,
      'name': params.name,
      'email': params.email,
      'phone': params.phone,
      'createdAt': firebaseAuth.currentUser?.metadata.creationTime,
      'role': 'customer',
    };

    await firestore.collection('users').doc(creds.user?.uid).set(userData);

    return Right(CustomerModel.fromJson(userData));
  }

  @override
  Future<Either<Failure, DriverModel>> driverSignup(
    DriverSignupParams params,
  ) async {
    final dio = sl<Dio>();
    try {
      final creds = await firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final driverImagePath = await uploadImage(params.driverImagePath, dio);
      final frontPlateImagePath = await uploadImage(
        params.frontPlateImagePath,
        dio,
      );
      final backPlateImagePath = await uploadImage(
        params.backPlateImagePath,
        dio,
      );
      final frontLicenseImagePath = await uploadImage(
        params.frontLicenseImagePath,
        dio,
      );
      final backLicenseImagePath = await uploadImage(
        params.backLicenseImagePath,
        dio,
      );
      final frontIdImagePath = await uploadImage(params.frontIdImagePath, dio);
      final backIdImagePath = await uploadImage(params.backIdImagePath, dio);

      final Map<String, dynamic> userData = {
        'id': creds.user?.uid,
        'driverId': creds.user?.uid,
        'name': params.name,
        'email': params.email,
        'phone': params.phone,
        'createdAt': FieldValue.serverTimestamp(),
        'role': 'driver',
        'vehicleType': params.vehicleType.name,
        'isAvailable': false,
        'applicationStatus': 'Submitted',
        'rating': 0.0,
        'vehicleModel': params.vehicleModel,
        'plateNumber': params.plateNumber,
        'driverImagePath': driverImagePath,
        'frontPlateImagePath': frontPlateImagePath,
        'backPlateImagePath': backPlateImagePath,
        'frontLicenseImagePath': frontLicenseImagePath,
        'backLicenseImagePath': backLicenseImagePath,
        'frontIdImagePath': frontIdImagePath,
        'backIdImagePath': backIdImagePath,
      };

      await firestore.collection('users').doc(creds.user?.uid).set(userData);
      log("Datasource Finished");
      return Right(DriverModel.fromJson(userData));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    firebaseAuth.signOut();
  }
}

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, UserModel>> login(LoginParams params) async {
    log("Mock Login: Logging in with ${params.email}");
    return Right(
      CustomerModel(
        id: 'mock_id_123',
        customerId: 'mock_cust_123',
        name: 'Mock User',
        email: params.email,
        phone: '123456789',
        createdAt: Timestamp.now(),
      ),
    );
  }

  @override
  Future<Either<Failure, CustomerModel>> customerSignup(
    CustomerSignupParams params,
  ) async {
    log("Mock Signup: Customer ${params.name}");
    return Right(
      CustomerModel(
        id: 'mock_cust_123',
        customerId: 'mock_cust_123',
        name: params.name,
        email: params.email,
        phone: params.phone,
        createdAt: Timestamp.now(),
      ),
    );
  }

  @override
  Future<Either<Failure, DriverModel>> driverSignup(
    DriverSignupParams params,
  ) async {
    log("Mock Signup: Driver ${params.name}");
    return Right(
      DriverModel(
        id: 'mock_driver_123',
        driverId: 'mock_driver_123',
        name: params.name,
        email: params.email,
        phone: params.phone,
        createdAt: Timestamp.now(),
        vehicleTypeId: 1, // Mocking a vehicle type ID
        isAvailable: true,
        applicationStatus: ApplicationStatus.Submitted,
        rating: 5.0,
      ),
    );
  }

  @override
  Future<void> signOut() async {
    log("Mock Sign Out");
  }
}
