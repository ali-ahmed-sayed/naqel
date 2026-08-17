import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_wallet_view_body.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_wallet_cubit.dart';

class DriverWalletView extends StatelessWidget {
  const DriverWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DriverWalletCubit(),
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          appBar: defaultAppBar(
            context,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black26,
                ),
              ),
            ],
          ),
          body: const DriverWalletViewBody(),
          bottomNavigationBar: SwiftShipBottomNav(
            activeTab: SwiftShipTab.history,
            onTap: (tab) {
              switch (tab) {
                case SwiftShipTab.home:
                  context.go('/driver-dashboard');
                  break;
                case SwiftShipTab.history:
                  break;
                case SwiftShipTab.profile:
                  context.go('/profile-driver');
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
