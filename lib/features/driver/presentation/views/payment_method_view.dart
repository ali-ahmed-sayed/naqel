// lib/features/wallet/presentation/views/payment_method_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/widgets/payment_method_body.dart';
import 'package:naqel/features/driver/presentation/cubit/payment_method_cubit.dart';
class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentMethodCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF0052FF)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Recharge Wallet', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFF0052FF))),
        ),
        body: const SafeArea(
          child: PaymentMethodBody(),
        ),
      ),
    );
  }
}