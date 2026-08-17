import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_dashboard_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_dashboard_state.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_dashboard/active_order_card.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_dashboard/availability_toggle.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_dashboard/earning_summary_card.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_dashboard/low_balance_banner.dart';

class DriverDashboardViewBody extends StatefulWidget {
  const DriverDashboardViewBody({super.key});

  @override
  State<DriverDashboardViewBody> createState() =>
      _DriverDashboardViewBodyState();
}

class _DriverDashboardViewBodyState extends State<DriverDashboardViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Map placeholder background
        Positioned.fill(
          child: Image.asset("assets/Images/map_placeholder.png", fit: .cover),
        ),
        BlocBuilder<DriverDashboardCubit, DriverDashboardState>(
          builder: (context, state) {
            final cubit = context.read<DriverDashboardCubit>();
            return Column(
              children: [
                state.isLowBalance
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: LowBalanceBanner(
                          balance: state.walletBalance,
                          threshold: state.lowBalanceThreshold,
                          onRecharge: () {
                            cubit.openWallet();
                            context.go('/driver-wallet');
                          },
                        ),
                      )
                    : const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AvailabilityToggle(
                    isOnline: state.isOnline,
                    onChanged: (_) => cubit.toggleAvailability(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...state.activeOrders.map(
                        (order) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ActiveOrderCard(
                            order: order,
                            onTap: () {
                              cubit.openActiveOrder(order.orderId);
                              context.push('/active-route');
                            },
                          ),
                        ),
                      ),
                      EarningsSummaryCard(state: state),
                    ],
                  ),
                ),
                const SizedBox(height: 96),
              ],
            );
          },
        ),
      ],
    );
  }
}
