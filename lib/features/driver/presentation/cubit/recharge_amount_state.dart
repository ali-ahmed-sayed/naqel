// lib/features/wallet/presentation/cubit/recharge_amount_state.dart
import 'package:equatable/equatable.dart';

sealed class RechargeAmountState extends Equatable {
  const RechargeAmountState();

  @override
  List<Object> get props => [];
}

final class RechargeAmountInitial extends RechargeAmountState {}

final class RechargeAmountSelected extends RechargeAmountState {
  final double amount;
  const RechargeAmountSelected(this.amount);

  @override
  List<Object> get props => [amount];
}
