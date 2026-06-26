// user_model.dart

import 'package:naqel/features/auth/domain/entities/user_entity.dart';

abstract class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final role = json['role'];
    if (role == 'driver') return DriverModel.fromJson(json);
    return CustomerModel.fromJson(json);
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
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      createdAt: json['createdAt'],
      customerId: json['customerId'],
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
    required this.isApproved,
    required this.rating,
    this.lat,
    this.lng,
  });

  final String driverId;
  final int vehicleTypeId;
  final bool isAvailable;
  final bool isApproved;
  final double rating;
  final double? lat;
  final double? lng;

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    email: json['email'],
    createdAt: json['createdAt'],
    driverId: json['driverId'],
    vehicleTypeId: json['vehicleTypeId'],
    isAvailable: json['isAvailable'],
    isApproved: json['isApproved'],
    rating: (json['rating'] as num).toDouble(),
    lat: json['lat']?.toDouble(),
    lng: json['lon']?.toDouble(),
  );
}
