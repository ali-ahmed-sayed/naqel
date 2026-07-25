// lib/features/wallet/presentation/views/payment_status_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/widgets/payment_status_body.dart';
import 'package:naqel/features/driver/presentation/cubit/payment_status_cubit.dart';

class PaymentStatusView extends StatelessWidget {
  const PaymentStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentStatusCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Payment Status',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: const Color(0xFF0052FF)),
          ),
        ),
        body: const SafeArea(child: PaymentStatusBody()),
      ),
    );
  }
}
