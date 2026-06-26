import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
class DriverSignupParams {
  final String name;
  final String email;
  final String phone;
  final String password;
  final XFile? driverImagePath;
  final VehicleType vehicleType;
  final String vehicleModel;
  final String plateNumber;
  final XFile? frontPlateImagePath;
  final XFile? backPlateImagePath;
  final XFile? frontLicenseImagePath;
  final XFile? backLicenseImagePath;
  final XFile? frontIdImagePath;
  final XFile? backIdImagePath;

  const DriverSignupParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    this.driverImagePath,
    required this.vehicleType,
    required this.vehicleModel,
    required this.plateNumber,
    required this.frontPlateImagePath,
    required this.backPlateImagePath,
    required this.frontLicenseImagePath,
    required this.backLicenseImagePath,
    required this.frontIdImagePath,
    required this.backIdImagePath,
  });

  DriverSignupParams copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    XFile? driverImagePath,
    VehicleType? vehicleType,
    String? vehicleModel,
    String? plateNumber,
    XFile? frontPlateImagePath,
    XFile? backPlateImagePath,
    XFile? frontLicenseImagePath,
    XFile? backLicenseImagePath,
    XFile? frontIdImagePath,
    XFile? backIdImagePath,
  }) {
    return DriverSignupParams(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      driverImagePath: driverImagePath ?? this.driverImagePath,
      vehicleType: vehicleType ?? this.vehicleType,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      plateNumber: plateNumber ?? this.plateNumber,
      frontPlateImagePath: frontPlateImagePath ?? this.frontPlateImagePath,
      backPlateImagePath: backPlateImagePath ?? this.backPlateImagePath,
      frontLicenseImagePath:
          frontLicenseImagePath ?? this.frontLicenseImagePath,
      backLicenseImagePath: backLicenseImagePath ?? this.backLicenseImagePath,
      frontIdImagePath: frontIdImagePath ?? this.frontIdImagePath,
      backIdImagePath: backIdImagePath ?? this.backIdImagePath,
    );
  }
}

enum VehicleType { car, truck, motorcycle }
