import 'package:equatable/equatable.dart';

/// Ordered steps of the delivery flow. Image 1 = pickingUp with courier not
/// yet accepted looking view; Image 2 = pickingUp with courier accepted +
/// OTP shown. Both screenshots are the same step with different sub-state,
/// modeled below via `courierAssigned`.
enum TrackingStep { searching, courierAccepted, pickingUp, onTheWay, delivered }

class LiveTrackingState extends Equatable {
  final TrackingStep currentStep;
  final bool courierAssigned;
  final String courierName;
  final double courierRating;
  final String vehicleInfo;
  final String plateNumber;
  final String orderId;
  final String orderMeta;
  final String otp;
  final String etaText;

  const LiveTrackingState({
    required this.currentStep,
    required this.courierAssigned,
    required this.courierName,
    required this.courierRating,
    required this.vehicleInfo,
    required this.plateNumber,
    required this.orderId,
    required this.orderMeta,
    required this.otp,
    required this.etaText,
  });

  factory LiveTrackingState.initial() => const LiveTrackingState(
        currentStep: TrackingStep.pickingUp,
        courierAssigned: false,
        courierName: 'Marcus Thorne',
        courierRating: 4.9,
        vehicleInfo: 'Toyota Prius • White',
        plateNumber: 'AB 1234',
        orderId: '#SF-8802',
        orderMeta: '2 items • 1.4 kg',
        otp: '1234',
        etaText: 'Estimated in 3 mins',
      );

  LiveTrackingState copyWith({
    TrackingStep? currentStep,
    bool? courierAssigned,
  }) {
    return LiveTrackingState(
      currentStep: currentStep ?? this.currentStep,
      courierAssigned: courierAssigned ?? this.courierAssigned,
      courierName: courierName,
      courierRating: courierRating,
      vehicleInfo: vehicleInfo,
      plateNumber: plateNumber,
      orderId: orderId,
      orderMeta: orderMeta,
      otp: otp,
      etaText: etaText,
    );
  }

  @override
  List<Object?> get props => [currentStep, courierAssigned];
}
