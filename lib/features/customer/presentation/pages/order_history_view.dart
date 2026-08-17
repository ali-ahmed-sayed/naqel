import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/customer/presentation/widgets/order_history_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_cubit.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderHistoryCubit(),
      child: SafeArea(
        child: Scaffold(
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
          bottomNavigationBar: SwiftShipBottomNav(
            activeTab: SwiftShipTab.history,
            onTap: (tab) {
              switch (tab) {
                case SwiftShipTab.home:
                  context.go('/customer-home');
                  break;
                case SwiftShipTab.history:
                  break; // already here
                case SwiftShipTab.profile:
                  context.go('/profile-customer');
                  break;
              }
            },
          ),
          body: const OrderHistoryViewBody(),
        ),
      ),
    );
  }
}
