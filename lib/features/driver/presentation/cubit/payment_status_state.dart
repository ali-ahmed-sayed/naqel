// lib/features/wallet/presentation/cubit/payment_status_state.dart
import 'package:equatable/equatable.dart';

sealed class PaymentStatusState extends Equatable {
  const PaymentStatusState();

  @override
  List<Object> get props => [];
}

final class PaymentStatusInitial extends PaymentStatusState {}
final class PaymentStatusSuccess extends PaymentStatusState {}