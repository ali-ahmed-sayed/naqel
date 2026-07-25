import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_dashboard_view_body.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_dashboard_cubit.dart';

class DriverDashboardView extends StatelessWidget {
  const DriverDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DriverDashboardCubit(),
      child: Scaffold(
        extendBody: true,
        body: DriverDashboardViewBody(),
        bottomNavigationBar: SwiftShipBottomNav(
          activeTab: SwiftShipTab.home,
          onTap: (tab) {
            switch (tab) {
              case SwiftShipTab.home:
                break;
              case SwiftShipTab.history:
                context.go('/driver-wallet');
                break;
              case SwiftShipTab.profile:
                context.go('/profile-driver');
                break;
            }
          },
        ),
      ),
    );
  }
}
