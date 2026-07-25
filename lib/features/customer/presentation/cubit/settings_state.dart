import 'package:equatable/equatable.dart';

enum AppearanceMode { light, dark, system }

class SettingsState extends Equatable {
  final bool deliveryUpdatesEnabled;
  final bool promotionsEnabled;
  final AppearanceMode appearanceMode;
  final bool biometricEnabled;

  const SettingsState({
    required this.deliveryUpdatesEnabled,
    required this.promotionsEnabled,
    required this.appearanceMode,
    required this.biometricEnabled,
  });

  factory SettingsState.initial() => const SettingsState(
        deliveryUpdatesEnabled: true,
        promotionsEnabled: false,
        appearanceMode: AppearanceMode.light,
        biometricEnabled: true,
      );

  SettingsState copyWith({
    bool? deliveryUpdatesEnabled,
    bool? promotionsEnabled,
    AppearanceMode? appearanceMode,
    bool? biometricEnabled,
  }) {
    return SettingsState(
      deliveryUpdatesEnabled: deliveryUpdatesEnabled ?? this.deliveryUpdatesEnabled,
      promotionsEnabled: promotionsEnabled ?? this.promotionsEnabled,
      appearanceMode: appearanceMode ?? this.appearanceMode,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
    );
  }

  @override
  List<Object?> get props =>
      [deliveryUpdatesEnabled, promotionsEnabled, appearanceMode, biometricEnabled];
}
