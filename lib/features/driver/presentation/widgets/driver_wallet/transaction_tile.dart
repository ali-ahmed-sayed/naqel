import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_wallet_state.dart';

class TransactionTile extends StatelessWidget {
  final WalletTransaction transaction;
  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final IconData icon = switch (transaction.type) {
      TransactionType.deliveryEarnings => Icons.local_shipping_outlined,
      TransactionType.walletRecharge => Icons.add_card_outlined,
      TransactionType.commissionDeduction => Icons.account_tree_outlined,
    };

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3F2),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: transaction.isCredit
                  ? SwiftShipTheme.primaryBlue.withValues(alpha: 0.1)
                  : SwiftShipTheme.errorRed.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(SwiftShipTheme.radiusSm),
            ),
            child: Icon(
              icon,
              size: 18,
              color: transaction.isCredit
                  ? SwiftShipTheme.primaryBlue
                  : SwiftShipTheme.errorRed,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  transaction.subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${transaction.isCredit ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: transaction.isCredit
                      ? SwiftShipTheme.primaryBlue
                      : SwiftShipTheme.errorRed,
                ),
              ),
              Text(
                transaction.isCredit ? 'CREDITED' : 'DEBITED',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
