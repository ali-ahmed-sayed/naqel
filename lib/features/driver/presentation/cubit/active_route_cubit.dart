// ignore_for_file: dead_code

import 'package:flutter_bloc/flutter_bloc.dart';
import 'active_route_state.dart';

class ActiveRouteCubit extends Cubit<ActiveRouteState> {
  ActiveRouteCubit() : super(ActiveRouteState.initial());

  // TODO: inject usecases here, e.g.
  // final StartNavigationUsecase startNavigation;
  // final MarkPickedUpUsecase markPickedUp;
  // final MarkDeliveredUsecase markDelivered;
  // final VerifyDeliveryOtpUsecase verifyOtp;

  void startNavigationToPickup() {
    // TODO: call startNavigation(pickupCoordinates) — opens external maps or in-app nav.
  }

  void startNavigationToDropoff() {
    // TODO: call startNavigation(dropoffCoordinates).
  }

  void callRecipient() {
    // TODO: launch dialer with recipient phone number.
  }

  void messageRecipient() {
    // TODO: open chat / SMS with recipient.
  }

  /// Bottom button tap. Behavior depends on current stage.
  void primaryActionPressed() {
    switch (state.stage) {
      case RouteStage.headingToPickup:
        // TODO: await markPickedUp(routeId);
        emit(state.copyWith(stage: RouteStage.headingToDropoff));
        break;
      case RouteStage.headingToDropoff:
        // Move to OTP verification before finalizing delivery.
        emit(state.copyWith(stage: RouteStage.verifyingOtp));
        break;
      case RouteStage.verifyingOtp:
        submitOtp();
        break;
      case RouteStage.completed:
        break;
    }
  }

  void enterOtpDigit(String digit) {
    if (state.stage != RouteStage.verifyingOtp) return;
    if (state.otpInput.length >= state.otpLength) return;
    emit(state.copyWith(otpInput: state.otpInput + digit, otpError: false));
  }

  void deleteOtpDigit() {
    if (state.otpInput.isEmpty) return;
    emit(state.copyWith(
      otpInput: state.otpInput.substring(0, state.otpInput.length - 1),
      otpError: false,
    ));
  }

  Future<void> submitOtp() async {
    if (!state.otpComplete || state.isSubmittingOtp) return;
    emit(state.copyWith(isSubmittingOtp: true));

    // TODO: final result = await verifyOtp(routeId: state.routeId, otp: state.otpInput);
    // Replace this stub with the real usecase call + error handling below.
    final bool verified = true;

    if (verified) {
      emit(state.copyWith(stage: RouteStage.completed, isSubmittingOtp: false));
    } else {
      emit(state.copyWith(otpError: true, otpInput: '', isSubmittingOtp: false));
    }
  }

  void reportOtpTrouble() {
    // TODO: open support flow / resend OTP usecase.
  }
}
