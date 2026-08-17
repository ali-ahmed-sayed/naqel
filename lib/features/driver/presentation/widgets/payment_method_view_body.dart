// lib/features/wallet/presentation/views/widgets/payment_method_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/cubit/payment_method_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/payment_method_state.dart';

class PaymentMethodViewBody extends StatelessWidget {
  const PaymentMethodViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CURRENT TRANSACTION',
            style: theme.textTheme.labelMedium?.copyWith(
              color: const Color(0xFF9C4A00),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: SwiftShipTheme.spacingSm),
          Container(
            padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F3F2),
              borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recharge Amount', style: theme.textTheme.labelMedium),
                    Text('\$50.00', style: theme.textTheme.headlineLarge),
                  ],
                ),
                const Icon(Icons.wallet, color: Color(0xFFD0D0D0), size: 48),
              ],
            ),
          ),
          const SizedBox(height: SwiftShipTheme.spacingXl),
          Text('Payment Method', style: theme.textTheme.titleLarge),
          const SizedBox(height: SwiftShipTheme.spacingMd),
          BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
            builder: (context, state) {
              String selected = 'visa_4421';
              if (state is PaymentMethodSelected) selected = state.methodId;

              return Column(
                children: [
                  _buildMethodTile(
                    context,
                    'visa_4421',
                    Icons.credit_card,
                    'Visa ending in 4421',
                    'Expires 12/26',
                    selected == 'visa_4421',
                  ),
                  const SizedBox(height: SwiftShipTheme.spacingSm),
                  _buildMethodTile(
                    context,
                    'digital',
                    Icons.account_balance_wallet,
                    'Digital Wallets',
                    'Apple Pay / Google Pay',
                    selected == 'digital',
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: SwiftShipTheme.spacingSm),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFD0D0D0),
                style: BorderStyle.none,
              ), // Dotted border visual implementation simplified
              borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
              color: Colors.transparent,
            ),
            // Minimalist dotted border representation
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
                side: const BorderSide(
                  color: Color(0xFFD0D0D0),
                  width: 2,
                ), // Replace with dotted plugin if needed
              ),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFF6F3F2),
                child: Icon(Icons.add, color: Color(0xFF1C1B1B)),
              ),
              title: Text(
                'Add New Card',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                'Credit or debit cards',
                style: theme.textTheme.labelMedium,
              ),
              onTap: () {},
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.verified_user,
                      color: Color(0xFF737688),
                      size: 16,
                    ),
                    const SizedBox(width: SwiftShipTheme.spacingXs),
                    Text(
                      'SECURE TRANSACTION',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SwiftShipTheme.spacingSm),
                Text(
                  'Your payment is encrypted and\nprocessed by SwiftPay. We do not store\nyour full card details.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium,
                ),
                const SizedBox(height: SwiftShipTheme.spacingMd),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTrustBadge(
                      context,
                      Icons.security,
                      'PCI DSS\nCOMPLIANT',
                    ),
                    const SizedBox(width: SwiftShipTheme.spacingMd),
                    _buildTrustBadge(context, Icons.lock, '256-BIT SSL'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: SwiftShipTheme.spacingXl),
          ElevatedButton.icon(
            onPressed: () => context.pushReplacement('/payment-status'),
            icon: const Icon(Icons.bolt, color: Colors.white),
            label: const Text('CONFIRM RECHARGE'),
          ),
          const SizedBox(height: SwiftShipTheme.spacingMd),
        ],
      ),
    );
  }

  Widget _buildMethodTile(
    BuildContext context,
    String id,
    IconData icon,
    String title,
    String subtitle,
    bool isSelected,
  ) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.read<PaymentMethodCubit>().selectMethod(id),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8EFFF) : const Color(0xFFF6F3F2),
          borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
          border: isSelected
              ? Border.all(color: SwiftShipTheme.primaryBlue, width: 1.5)
              : null,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: SwiftShipTheme.primaryBlue),
          ),
          title: Text(
            title,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(subtitle, style: theme.textTheme.labelMedium),
          trailing: isSelected
              ? const Icon(
                  Icons.check_circle,
                  color: SwiftShipTheme.primaryBlue,
                )
              : const Icon(Icons.chevron_right, color: Color(0xFF9E9E9E)),
        ),
      ),
    );
  }

  Widget _buildTrustBadge(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(SwiftShipTheme.spacingSm),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3F2),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusSm),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF9C4A00), size: 20),
          const SizedBox(width: SwiftShipTheme.spacingXs),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 8,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
