// data/datasources/auth_remote_datasource.dart
import 'dart:developer';

import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naqel/core/utils/upload_image.dart';
import 'package:naqel/features/auth/data/models/user_model.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';
import 'package:naqel/injection_container.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(LoginParams params);
  Future<CustomerModel> customerSignup(CustomerSignupParams params);
  Future<DriverModel> driverSignup(DriverSignupParams params);
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
  Future<UserModel> login(LoginParams params) async {
    log("Logging in with email: ${params.email}, password: ${params.password}");
    final creds = await firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    log("Login successful for user: ${creds.user?.uid}");

    final userDoc = await firestore
        .collection('users')
        .doc(creds.user?.uid)
        .get();

    log("Retrieved user data for UID: ${creds.user?.uid}");
    log("User data: ${userDoc.data()}");
    return UserModel.fromJson(
      userDoc.data() ?? {'error': 'Something went wrong'},
    );
  }

  @override
  Future<CustomerModel> customerSignup(CustomerSignupParams params) async {
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

    return CustomerModel.fromJson(userData);
  }

  @override
  Future<DriverModel> driverSignup(DriverSignupParams params) async {
    final dio = sl<Dio>();
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
      'isApproved': false,
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

    return DriverModel.fromJson(userData);
  }

  @override
  Future<void> signOut() async {
    firebaseAuth.signOut();
  }
}
