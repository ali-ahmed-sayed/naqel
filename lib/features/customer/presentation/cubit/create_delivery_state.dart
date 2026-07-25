import 'package:equatable/equatable.dart';

enum PackageType { document, parcel, box }

class CreateDeliveryState extends Equatable {
  final String pickupAddress;
  final String pickupSchedule;
  final String dropoffAddress;
  final PackageType packageType;
  final double weightKg;
  final bool hasPhoto;
  final double estimatedPrice;
  final String etaRange;

  const CreateDeliveryState({
    required this.pickupAddress,
    required this.pickupSchedule,
    required this.dropoffAddress,
    required this.packageType,
    required this.weightKg,
    required this.hasPhoto,
    required this.estimatedPrice,
    required this.etaRange,
  });

  factory CreateDeliveryState.initial() => const CreateDeliveryState(
        pickupAddress: '242 Editorial Way, Creative District',
        pickupSchedule: 'Scheduled for: Today, 2:00 PM',
        dropoffAddress: '',
        packageType: PackageType.document,
        weightKg: 1.5,
        hasPhoto: false,
        estimatedPrice: 24.50,
        etaRange: '45 - 60 MIN',
      );

  bool get canSubmit => dropoffAddress.isNotEmpty;

  CreateDeliveryState copyWith({
    String? dropoffAddress,
    PackageType? packageType,
    double? weightKg,
    bool? hasPhoto,
  }) {
    return CreateDeliveryState(
      pickupAddress: pickupAddress,
      pickupSchedule: pickupSchedule,
      dropoffAddress: dropoffAddress ?? this.dropoffAddress,
      packageType: packageType ?? this.packageType,
      weightKg: weightKg ?? this.weightKg,
      hasPhoto: hasPhoto ?? this.hasPhoto,
      estimatedPrice: estimatedPrice,
      etaRange: etaRange,
    );
  }

  @override
  List<Object?> get props => [
        pickupAddress,
        pickupSchedule,
        dropoffAddress,
        packageType,
        weightKg,
        hasPhoto,
        estimatedPrice,
        etaRange,
      ];
}
