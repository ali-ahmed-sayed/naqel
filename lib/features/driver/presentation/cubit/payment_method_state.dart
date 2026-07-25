// lib/features/wallet/presentation/cubit/payment_method_state.dart
import 'package:equatable/equatable.dart';

sealed class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

final class PaymentMethodInitial extends PaymentMethodState {}
final class PaymentMethodSelected extends PaymentMethodState {
  final String methodId;
  const PaymentMethodSelected(this.methodId);

  @override
  List<Object> get props => [methodId];
}