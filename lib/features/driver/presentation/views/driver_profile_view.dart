// lib/features/profile/presentation/views/driver_profile_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_profile_body.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_profile_cubit.dart';

class DriverProfileView extends StatelessWidget {
  const DriverProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriverProfileCubit()..loadProfile(),
      child: Scaffold(
        extendBody: true,
        body: DriverProfileBody(),
        bottomNavigationBar: SwiftShipBottomNav(
          activeTab: SwiftShipTab.profile,
          onTap: (tab) {
            switch (tab) {
              case SwiftShipTab.home:
                context.go('/driver-dashboard');
                break;
              case SwiftShipTab.history:
                context.go('/driver-wallet');
                break;
              case SwiftShipTab.profile:
                break;
            }
          },
        ),
      ),
    );
  }
}
