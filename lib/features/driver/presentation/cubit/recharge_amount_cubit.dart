// lib/features/wallet/presentation/cubit/recharge_amount_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/cubit/recharge_amount_state.dart';

class RechargeAmountCubit extends Cubit<RechargeAmountState> {
  RechargeAmountCubit() : super(RechargeAmountInitial());

  void selectAmount(double amount) {
    emit(RechargeAmountSelected(amount));
  }
}