import 'package:flutter_bloc/flutter_bloc.dart';
import 'driver_dashboard_state.dart';

class DriverDashboardCubit extends Cubit<DriverDashboardState> {
  DriverDashboardCubit() : super(DriverDashboardState.initial());

  // TODO: inject usecases here, e.g.
  // final SetAvailabilityUsecase setAvailability;
  // final GetWalletBalanceUsecase getWalletBalance;
  // final GetActiveOrdersUsecase getActiveOrders;
  // final WatchIncomingOrdersUsecase watchIncomingOrders; // for real-time updates

  Future<void> toggleAvailability() async {
    final next = !state.isOnline;
    // TODO: await setAvailability(next); then only flip state on success,
    // and surface an error state if the call fails (e.g. driver below
    // minimum balance shouldn't be allowed to go online).
    emit(state.copyWith(isOnline: next));
  }

  Future<void> refreshDashboard() async {
    // TODO: await Future.wait([getWalletBalance(), getActiveOrders()])
    // and emit with the fresh values. Left as a no-op stub for now.
  }

  void openWallet() {
    // TODO: navigation is handled by the view (Navigator.pushNamed),
    // this hook exists in case a usecase needs to run first
    // (e.g. refreshing balance before showing the wallet screen).
  }

  void openActiveOrder(String orderId) {
    // TODO: navigation hook — fetch full order/route details via usecase
    // before pushing to the Active Route screen.
  }
}
