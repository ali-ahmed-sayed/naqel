import 'package:flutter_bloc/flutter_bloc.dart';
import 'driver_wallet_state.dart';

class DriverWalletCubit extends Cubit<DriverWalletState> {
  DriverWalletCubit() : super(DriverWalletState.initial());

  // TODO: inject usecases here, e.g.
  // final GetWalletSummaryUsecase getWalletSummary;
  // final GetTransactionsUsecase getTransactions;
  // final RechargeWalletUsecase rechargeWallet;

  Future<void> refreshWallet() async {
    // TODO: await Future.wait([getWalletSummary(), getTransactions()])
    // and emit the fresh balance/earnings/transactions.
  }

  /// Called when the driver taps "Recharge Wallet". The actual payment
  /// sheet / usecase call lives outside this cubit — this just tracks the
  /// in-flight state so the view can show a spinner and disable the button.
  Future<void> startRecharge() async {
    if (state.isRecharging) return;
    emit(state.copyWith(isRecharging: true));

    // TODO: final result = await rechargeWallet(amount: ...);
    // Replace this stub with real payment-sheet + usecase wiring, then
    // update availableBalance from the result on success.

    emit(state.copyWith(isRecharging: false));
  }

  void seeAllTransactions() {
    // TODO: navigate to a full transactions list screen, or fetch more
    // pages via a paginated GetTransactionsUsecase.
  }
}
