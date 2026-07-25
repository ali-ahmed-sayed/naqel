import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

enum VehicleType { car, truck, motorcycle }

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
  final agreeToTerms;

  const DriverSignupParams({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.password = '',
    this.driverImagePath,
    this.vehicleType = VehicleType.car,
    this.vehicleModel = '',
    this.plateNumber = '',
    this.frontPlateImagePath,
    this.backPlateImagePath,
    this.frontLicenseImagePath,
    this.backLicenseImagePath,
    this.frontIdImagePath,
    this.backIdImagePath,
    this.agreeToTerms = false,
  });

  /// Initial factory constructor
  factory DriverSignupParams.initial() => const DriverSignupParams();

  /// Map representation for sending data/form data to API/Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'vehicleType':
          vehicleType.name, // Converts enum to string: 'car', 'truck', etc.
      'vehicleModel': vehicleModel,
      'plateNumber': plateNumber,
    };
  }

  /// CopyWith support that allows setting null values using ValueGetter / Function wrapper
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
    bool? agreeToTerms,
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
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
    );
  }
}
