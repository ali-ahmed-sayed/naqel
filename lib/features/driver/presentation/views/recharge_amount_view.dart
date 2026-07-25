// lib/features/wallet/presentation/views/recharge_amount_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/widgets/recharge_amount_body.dart';
import 'package:naqel/features/driver/presentation/cubit/recharge_amount_cubit.dart';

class RechargeAmountView extends StatelessWidget {
  const RechargeAmountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RechargeAmountCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF0052FF)),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Recharge Wallet',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: const Color(0xFF0052FF)),
          ),
        ),
        body: RechargeAmountBody(),
        bottomNavigationBar: Column(
          mainAxisSize: .min,
          children: [
            ElevatedButton.icon(
              onPressed: () => context.pushReplacement('/payment-method'),
              icon: const Icon(Icons.bolt, color: Colors.white),
              label: const Text('CONFIRM RECHARGE'),
            ),
            const SizedBox(height: SwiftShipTheme.spacingMd),
          ],
        ),
      ),
    );
  }
}
