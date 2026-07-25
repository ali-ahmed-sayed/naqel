// lib/features/wallet/presentation/views/widgets/payment_status_body.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class PaymentStatusBody extends StatelessWidget {
  const PaymentStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: SwiftShipTheme.spacingXl),
            Container(
              padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE8EFFF),
              ),
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: SwiftShipTheme.primaryBlue,
                child: Icon(Icons.check, color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(height: SwiftShipTheme.spacingLg),
            Text(
              'TRANSACTION COMPLETED',
              style: theme.textTheme.labelMedium?.copyWith(
                color: const Color(0xFF9C4A00),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: SwiftShipTheme.spacingXs),
            Text(
              'Recharge\nSuccessful!',
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: SwiftShipTheme.spacingSm),
            Text(
              'Your wallet has been topped up and your\naccount is now active.',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium,
            ),
            const SizedBox(height: SwiftShipTheme.spacingXl),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(SwiftShipTheme.spacingLg),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F3F2),
                borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'TOTAL AMOUNT',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '\$50.00',
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: SwiftShipTheme.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SwiftShipTheme.spacingXl),
                  _buildReceiptRow(
                    theme,
                    'NEW WALLET BALANCE',
                    '\$62.45',
                    Icons.account_balance_wallet,
                  ),
                  const SizedBox(height: SwiftShipTheme.spacingMd),
                  _buildReceiptRow(
                    theme,
                    'PAYMENT METHOD',
                    'Visa ending in 4421',
                    Icons.credit_card,
                  ),
                  const SizedBox(height: SwiftShipTheme.spacingMd),
                  _buildReceiptRow(
                    theme,
                    'TRANSACTION ID',
                    '#TXN-998271',
                    null,
                  ),
                  const SizedBox(height: SwiftShipTheme.spacingMd),
                  _buildReceiptRow(theme, 'DATE', 'May 24, 2024', null),
                  const SizedBox(height: SwiftShipTheme.spacingLg),
                  const Divider(color: Color(0xFFD0D0D0), thickness: 2),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Return to Dashboard'),
                  SizedBox(width: SwiftShipTheme.spacingXs),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: SwiftShipTheme.spacingSm),
            FilledButton(
              onPressed: () {},
              child: const Text('View Wallet History'),
            ),
            const SizedBox(height: SwiftShipTheme.spacingMd),
            Text.rich(
              TextSpan(
                text: 'Having trouble? ',
                style: theme.textTheme.labelMedium,
                children: [
                  TextSpan(
                    text: 'Contact Fleet Support',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: SwiftShipTheme.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SwiftShipTheme.spacingMd),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptRow(
    ThemeData theme,
    String label,
    String value,
    IconData? icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: const Color(0xFF434656)),
              const SizedBox(width: SwiftShipTheme.spacingXs),
            ],
            Text(
              value,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
