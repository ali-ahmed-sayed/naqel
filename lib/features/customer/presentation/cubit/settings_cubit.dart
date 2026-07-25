import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  void toggleDeliveryUpdates(bool value) =>
      emit(state.copyWith(deliveryUpdatesEnabled: value));

  void togglePromotions(bool value) => emit(state.copyWith(promotionsEnabled: value));

  void setAppearance(AppearanceMode mode) => emit(state.copyWith(appearanceMode: mode));

  void toggleBiometric(bool value) => emit(state.copyWith(biometricEnabled: value));
}
