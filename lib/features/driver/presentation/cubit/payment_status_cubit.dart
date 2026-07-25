// lib/features/wallet/presentation/cubit/payment_status_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/cubit/payment_status_state.dart';

class PaymentStatusCubit extends Cubit<PaymentStatusState> {
  PaymentStatusCubit() : super(PaymentStatusSuccess());
}