abstract class UserEntity {
  String id;
  String name;
  String email;
  String phone;
  DateTime createdAt;
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
  });
}

class CustomerEntity extends UserEntity {
  CustomerEntity({
    required super.id,
    required this.customerId,
    required super.name,
    required super.phone,
    required super.email,
    required super.createdAt,
  });
  final String customerId;
}

class DriverEntity extends UserEntity {
  DriverEntity({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.createdAt,
    required this.driverId,
    required this.vehicleTypeId,
    required this.currentOrders,
    required this.maxOrders,
    required this.isAvailable,
    required this.isApproved,
    required this.rating,
    required this.lat,
    required this.lng,
  });

  final String driverId;
  final int vehicleTypeId;
  final int currentOrders;
  final int maxOrders;
  final bool isAvailable;
  final bool isApproved;
  final double rating;
  final double? lat;
  final double? lng;
}
