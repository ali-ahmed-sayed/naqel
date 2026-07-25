import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_state.dart';

class LiveTrackingCubit extends Cubit<LiveTrackingState> {
  LiveTrackingCubit() : super(LiveTrackingState.initial());

  /// Reveals the courier card + OTP once a courier has accepted
  /// (matches the difference between the two provided screenshots).
  void assignCourier() => emit(state.copyWith(courierAssigned: true));

  void advanceStep() {
    final steps = TrackingStep.values;
    final nextIndex = steps.indexOf(state.currentStep) + 1;
    if (nextIndex < steps.length) {
      emit(state.copyWith(currentStep: steps[nextIndex]));
    }
  }
}
