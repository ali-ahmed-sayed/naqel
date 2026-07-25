// lib/features/wallet/presentation/views/widgets/recharge_amount_body.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/cubit/recharge_amount_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/recharge_amount_state.dart';

class RechargeAmountBody extends StatelessWidget {
  const RechargeAmountBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: .min,
            children: [
              Text(
                'CURRENT BALANCE',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Text('\$12.45', style: theme.textTheme.displayMedium),
                  const SizedBox(width: SwiftShipTheme.spacingSm),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SwiftShipTheme.spacingSm,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: SwiftShipTheme.errorBg,
                      borderRadius: BorderRadius.circular(
                        SwiftShipTheme.radiusSm,
                      ),
                    ),
                    child: Text(
                      '⚠ Low',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: SwiftShipTheme.errorRed,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SwiftShipTheme.spacingXl),
              Text(
                'QUICK SELECT',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: SwiftShipTheme.spacingMd),
              BlocBuilder<RechargeAmountCubit, RechargeAmountState>(
                builder: (context, state) {
                  double selected = 0;
                  if (state is RechargeAmountSelected) selected = state.amount;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildQuickSelectCard(
                        context,
                        20,
                        'STARTER',
                        selected == 20,
                      ),
                      _buildQuickSelectCard(
                        context,
                        50,
                        'RECOMMENDED',
                        selected == 50,
                      ),
                      _buildQuickSelectCard(
                        context,
                        100,
                        'PRO',
                        selected == 100,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: SwiftShipTheme.spacingXl),
              Text(
                'OR ENTER CUSTOM AMOUNT',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: SwiftShipTheme.spacingSm),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                style: theme.textTheme.headlineLarge,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.attach_money,
                    color: Color(0xFF9E9E9E),
                    size: 32,
                  ),
                  hintText: '0.00',
                  hintStyle: theme.textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFFD0D0D0),
                  ),
                ),
              ),
              const SizedBox(height: SwiftShipTheme.spacingXl),
              Container(
                padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F3F2),
                  borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
                  border: const Border(
                    left: BorderSide(
                      color: SwiftShipTheme.accentOrange,
                      width: 4,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: SwiftShipTheme.accentOrange,
                    ),
                    const SizedBox(width: SwiftShipTheme.spacingSm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Driver Activation Policy',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: SwiftShipTheme.spacingXs),
                          Text.rich(
                            TextSpan(
                              text: 'A minimum wallet balance of ',
                              style: theme.textTheme.labelMedium,
                              children: [
                                TextSpan(
                                  text: '\$20.00',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: SwiftShipTheme.accentOrange,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ' is required to remain active on the SwiftShip network. Accounts falling below this threshold will be temporarily paused until recharged.',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickSelectCard(
    BuildContext context,
    double amount,
    String label,
    bool isSelected,
  ) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.read<RechargeAmountCubit>().selectAmount(amount),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.28,
        padding: const EdgeInsets.symmetric(vertical: SwiftShipTheme.spacingMd),
        decoration: BoxDecoration(
          color: isSelected
              ? SwiftShipTheme.primaryBlue
              : const Color(0xFFF6F3F2),
          borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
        ),
        child: Column(
          children: [
            Text(
              '\$$amount',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: isSelected ? Colors.white : const Color(0xFF1C1B1B),
              ),
            ),
            const SizedBox(height: SwiftShipTheme.spacingXs),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: isSelected ? Colors.white70 : const Color(0xFF737688),
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
