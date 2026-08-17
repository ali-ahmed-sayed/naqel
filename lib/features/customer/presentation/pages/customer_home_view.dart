import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/customer/presentation/widgets/customer_home_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/customer_home_cubit.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
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
          body: const CustomerHomeViewBody(),
          bottomNavigationBar: SwiftShipBottomNav(
            activeTab: SwiftShipTab.home,
            onTap: (tab) {
              switch (tab) {
                case SwiftShipTab.home:
                  break;
                case SwiftShipTab.history:
                  context.go('/order-history');
                  break;
                case SwiftShipTab.profile:
                  context.go('/profile-customer');
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
