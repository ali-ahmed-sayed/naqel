import 'package:flutter_bloc/flutter_bloc.dart';
import 'application_status_state.dart';

class ApplicationStatusCubit extends Cubit<ApplicationStatusState> {
  /// [isApproved] must come from the driver's auth document
  /// (`DriverEntity.isApproved`) — passed in by whoever navigates here
  /// (right after signup, or when re-opening this screen from the
  /// dashboard/profile). This cubit does not invent that value itself.
  ApplicationStatusCubit({required applicationStatus})
    : super(
        ApplicationStatusState.initial(applicationStatus: applicationStatus),
      );

  // TODO: inject usecases here, e.g.
  // final GetApplicationStatusUsecase getApplicationStatus;
  // final WatchApplicationStatusUsecase watchApplicationStatus; // for polling/push updates

  Future<void> refreshStatus() async {
    if (state.isRefreshing) return;
    emit(state.copyWith(isRefreshing: true));

    // TODO: final result = await getApplicationStatus(state.applicationId);
    // Replace this stub with the real usecase call (re-reading the driver's
    // auth document / isApproved field) and emit copyWith(isApproved: ...)
    // plus the updated journey once compliance clears each step.

    emit(state.copyWith(isRefreshing: false));
  }

  void returnToHome() {
    // TODO: navigation is handled by the view (Navigator.pushNamedAndRemoveUntil
    // or GoRouter, depending on isApproved), this hook exists in case a
    // usecase needs to run first (e.g. re-checking status before deciding
    // which home to route to).
  }

  void contactSupport() {
    // TODO: open support chat / ticket flow via usecase.
  }
}
