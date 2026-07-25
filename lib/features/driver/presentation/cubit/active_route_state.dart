import 'package:equatable/equatable.dart';

/// Drives which body the Active Route screen shows and what the
/// primary action button says:
/// - [headingToPickup] -> "Picked Up" button (Image 1)
/// - [headingToDropoff] -> "Delivered" button (Image 2)
/// - [verifyingOtp] -> fullscreen OTP keypad + "Accept" (Image 3)
/// - [completed] -> route finished, hand back to caller (e.g. pop / next route)
enum RouteStage { headingToPickup, headingToDropoff, verifyingOtp, completed }

class RouteStop extends Equatable {
  final String title; // "PICKUP" / "DROP-OFF"
  final String placeName;
  final String address;

  const RouteStop({
    required this.title,
    required this.placeName,
    required this.address,
  });

  @override
  List<Object?> get props => [title, placeName, address];
}

class ActiveRouteState extends Equatable {
  final String routeId;
  final RouteStage stage;
  final RouteStop pickup;
  final RouteStop dropoff;
  final String recipientName;
  final double recipientRating;
  final String otpInput; // up to 4 digits, built as the driver taps the keypad
  final int otpLength;
  final bool otpError; // set true by the usecase layer if verification fails
  final bool isSubmittingOtp;

  const ActiveRouteState({
    required this.routeId,
    required this.stage,
    required this.pickup,
    required this.dropoff,
    required this.recipientName,
    required this.recipientRating,
    required this.otpInput,
    required this.otpLength,
    required this.otpError,
    required this.isSubmittingOtp,
  });

  factory ActiveRouteState.initial() => const ActiveRouteState(
    routeId: '#7294-XC',
    stage: RouteStage.headingToPickup,
    pickup: RouteStop(
      title: 'PICKUP',
      placeName: 'North Logistics Center, Dock 4',
      address: '1200 Industrial Way, San Francisco, CA',
    ),
    dropoff: RouteStop(
      title: 'DROP-OFF',
      placeName: 'The Creative Hub, Level 2',
      address: '450 Mission St, San Francisco, CA',
    ),
    recipientName: 'Alex Rivera',
    recipientRating: 5.0,
    otpInput: '',
    otpLength: 4,
    otpError: false,
    isSubmittingOtp: false,
  );

  bool get otpComplete => otpInput.length == otpLength;

  ActiveRouteState copyWith({
    RouteStage? stage,
    String? otpInput,
    bool? otpError,
    bool? isSubmittingOtp,
  }) {
    return ActiveRouteState(
      routeId: routeId,
      stage: stage ?? this.stage,
      pickup: pickup,
      dropoff: dropoff,
      recipientName: recipientName,
      recipientRating: recipientRating,
      otpInput: otpInput ?? this.otpInput,
      otpLength: otpLength,
      otpError: otpError ?? this.otpError,
      isSubmittingOtp: isSubmittingOtp ?? this.isSubmittingOtp,
    );
  }

  @override
  List<Object?> get props => [
    routeId,
    stage,
    pickup,
    dropoff,
    recipientName,
    recipientRating,
    otpInput,
    otpLength,
    otpError,
    isSubmittingOtp,
  ];
}
