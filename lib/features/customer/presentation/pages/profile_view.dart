import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/customer/presentation/cubit/profile_cubit.dart';
import 'package:naqel/features/customer/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   actions: [
          //     IconButton(
          //       onPressed: () {
          //         context.push('/settings');
          //       },
          //       icon: const Icon(
          //         Icons.settings_outlined,
          //         color: Colors.black87,
          //       ),
          //     ),
          //   ],
          // ),
          appBar: defaultAppBar(
            context,
            actions: [
              IconButton(
                onPressed: () {
                  context.push('/settings');
                },
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          body: const ProfileViewBody(),
          bottomNavigationBar: SwiftShipBottomNav(
            activeTab: SwiftShipTab.profile,
            onTap: (tab) {
              switch (tab) {
                case SwiftShipTab.home:
                  context.go('/customer-home');
                  break;
                case SwiftShipTab.history:
                  context.go('/order-history');
                  break;
                case SwiftShipTab.profile:
                  break; // already here
              }
            },
          ),
        ),
      ),
    );
  }
}
