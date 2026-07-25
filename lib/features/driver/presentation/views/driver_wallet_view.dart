import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_wallet_view_body.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_wallet_cubit.dart';

class DriverWalletView extends StatelessWidget {
  const DriverWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DriverWalletCubit(),
      child: const DriverWalletViewBody(),
    );
  }
}
