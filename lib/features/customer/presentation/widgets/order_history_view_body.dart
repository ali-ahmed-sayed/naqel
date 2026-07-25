import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_cubit.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_state.dart';
import 'package:naqel/features/customer/presentation/widgets/order_history/filter_tabs.dart';
import 'package:naqel/features/customer/presentation/widgets/order_history/order_card.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'ACTIVITY LOG',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: SwiftShipTheme.accentOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Order History',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                onChanged: context.read<OrderHistoryCubit>().search,
                decoration: const InputDecoration(
                  hintText: 'Search by Order ID or item...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const FilterTabs(),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
                builder: (context, state) {
                  final orders = state.visibleOrders;
                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
                    itemCount: orders.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) =>
                        OrderCard(order: orders[index]),
                  );
                },
              ),
            ),
          ],
        ),
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
    );
  }
}
