import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_wallet_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_wallet_state.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_wallet/stat_card.dart';
import 'package:naqel/features/driver/presentation/widgets/driver_wallet/transaction_tile.dart';

class DriverWalletViewBody extends StatelessWidget {
  const DriverWalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<DriverWalletCubit, DriverWalletState>(
        builder: (context, state) {
          final cubit = context.read<DriverWalletCubit>();
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SwiftShip',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: SwiftShipTheme.primaryBlue,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black26,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [SwiftShipTheme.primaryBlue, Color(0xFF0037B3)],
                  ),
                  borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AVAILABLE BALANCE',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            '\$',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          state.availableBalance.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push('/recharge-amount');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: SwiftShipTheme.primaryBlue,
                        ),
                        child: state.isRecharging
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.account_balance_wallet_outlined,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Text('Recharge Wallet'),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.isLowBalance) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: SwiftShipTheme.errorBg,
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusMd,
                    ),
                    border: const Border(
                      left: BorderSide(
                        color: SwiftShipTheme.errorRed,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: SwiftShipTheme.errorRed,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Low Balance Reached',
                              style: TextStyle(
                                color: SwiftShipTheme.errorRed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Your balance is below the \$${state.lowBalanceThreshold.toStringAsFixed(2)} minimum. You cannot accept new orders until you recharge.',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      label: "TODAY'S EARNINGS",
                      value: '\$${state.todaysEarnings.toStringAsFixed(2)}',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      label: 'COMMISSIONS PAID',
                      value: '\$${state.commissionsPaid.toStringAsFixed(2)}',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: cubit.seeAllTransactions,
                    child: const Text('See All'),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ...state.transactions.map(
                (t) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TransactionTile(transaction: t),
                ),
              ),
              const SizedBox(
                height: SwiftShipTheme.spacingXxl + SwiftShipTheme.spacingXl,
              ),
            ],
          );
        },
      ),
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
    );
  }
}
