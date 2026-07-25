import 'package:equatable/equatable.dart';

class ActiveOrderSummary extends Equatable {
  final String orderId;
  final String statusLabel; // e.g. "IN TRANSIT"

  const ActiveOrderSummary({required this.orderId, required this.statusLabel});

  @override
  List<Object?> get props => [orderId, statusLabel];
}

class DriverDashboardState extends Equatable {
  final bool isOnline;
  final double walletBalance;
  final double lowBalanceThreshold;
  final double earningsToday;
  final double earningsChangePercent; // e.g. 12.0 = "12% from yesterday"
  final List<ActiveOrderSummary> activeOrders;

  const DriverDashboardState({
    required this.isOnline,
    required this.walletBalance,
    required this.lowBalanceThreshold,
    required this.earningsToday,
    required this.earningsChangePercent,
    required this.activeOrders,
  });

  factory DriverDashboardState.initial() => const DriverDashboardState(
        isOnline: true,
        walletBalance: 8.45,
        lowBalanceThreshold: 15.00,
        earningsToday: 142.80,
        earningsChangePercent: 12.0,
        activeOrders: [
          ActiveOrderSummary(orderId: '#SW-9821-B', statusLabel: 'IN TRANSIT'),
        ],
      );

  bool get isLowBalance => walletBalance < lowBalanceThreshold;

  DriverDashboardState copyWith({
    bool? isOnline,
    double? walletBalance,
    List<ActiveOrderSummary>? activeOrders,
  }) {
    return DriverDashboardState(
      isOnline: isOnline ?? this.isOnline,
      walletBalance: walletBalance ?? this.walletBalance,
      lowBalanceThreshold: lowBalanceThreshold,
      earningsToday: earningsToday,
      earningsChangePercent: earningsChangePercent,
      activeOrders: activeOrders ?? this.activeOrders,
    );
  }

  @override
  List<Object?> get props =>
      [isOnline, walletBalance, lowBalanceThreshold, earningsToday, earningsChangePercent, activeOrders];
}
