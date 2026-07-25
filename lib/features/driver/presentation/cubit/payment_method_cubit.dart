// lib/features/wallet/presentation/cubit/payment_method_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/cubit/payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(const PaymentMethodSelected('visa_4421'));

  void selectMethod(String id) {
    emit(PaymentMethodSelected(id));
  }
}
