// user_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_state.dart';

abstract class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final role = json['role'] as String? ?? '';
    if (role == 'driver') {
      return DriverModel.fromJson(json);
    }
    return CustomerModel.fromJson(json);
  }

  /// Helper to safely extract Firestore Timestamp
  static Timestamp _parseTimestamp(dynamic value) {
    if (value is Timestamp) return value;
    if (value is DateTime) return Timestamp.fromDate(value);
    return Timestamp.now();
  }
}

class CustomerModel extends UserModel {
  CustomerModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.createdAt,
    required this.customerId,
  });

  final String customerId;

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      createdAt: UserModel._parseTimestamp(json['createdAt']),
      // Fallback to 'id' or 'driverId' if customerId isn't present in payload
      customerId: (json['customerId'] ?? json['id'] ?? '') as String,
    );
  }
}

class DriverModel extends UserModel {
  DriverModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.createdAt,
    required this.driverId,
    required this.vehicleTypeId,
    required this.isAvailable,
    required this.applicationStatus,
    required this.rating,
    this.lat,
    this.lng,
  });

  final String driverId;
  final int vehicleTypeId;
  final bool isAvailable;
  final ApplicationStatus applicationStatus;
  final double rating;
  final double? lat;
  final double? lng;

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      createdAt: UserModel._parseTimestamp(json['createdAt']),
      driverId: json['driverId'] as String? ?? json['id'] as String? ?? '',
      vehicleTypeId: (json['vehicleTypeId'] as num?)?.toInt() ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? false,
      applicationStatus: to_status((json['applicationStatus'] as String?)),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] ?? json['lon'] as num?)?.toDouble(),
    );
  }
}

ApplicationStatus to_status(String? applicationStatus) {
  switch (applicationStatus) {
    case "Submitted":
      return ApplicationStatus.Submitted;
    case "Verified":
      return ApplicationStatus.Verified;
    case "Checked":
      return ApplicationStatus.Checked;
    case "Activated":
      return ApplicationStatus.Activated;
    default:
      return ApplicationStatus.Submitted;
  }
}
