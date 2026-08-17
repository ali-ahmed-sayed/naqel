// lib/features/wallet/presentation/views/payment_status_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/widgets/screen_appbar.dart';
import 'package:naqel/features/driver/presentation/widgets/payment_status_view_body.dart';
import 'package:naqel/features/driver/presentation/cubit/payment_status_cubit.dart';

class PaymentStatusView extends StatelessWidget {
  const PaymentStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentStatusCubit(),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   scrolledUnderElevation: 0,
          //   elevation: 0,
          //   title: Text(
          //     'Payment Status',
          //     style: Theme.of(
          //       context,
          //     ).textTheme.titleLarge?.copyWith(color: const Color(0xFF0052FF)),
          //   ),
          // ),
          appBar: screenAppBar(context, "Payment Status"),
          body: PaymentStatusViewBody(),
        ),
      ),
    );
  }
}
