sealed class UserRole {}

class CustomerRole extends UserRole {}

class DriverRole extends UserRole {
  DriverRole({
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
