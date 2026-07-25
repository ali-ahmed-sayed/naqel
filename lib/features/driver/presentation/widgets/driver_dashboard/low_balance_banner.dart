import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class LowBalanceBanner extends StatelessWidget {
  final double balance;
  final double threshold;
  final VoidCallback onRecharge;

  const LowBalanceBanner({
    super.key,
    required this.balance,
    required this.threshold,
    required this.onRecharge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SwiftShipTheme.errorBg,
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
        border: const Border(
          left: BorderSide(color: SwiftShipTheme.errorRed, width: 4),
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
                  'Low Balance Warning',
                  style: TextStyle(
                    color: SwiftShipTheme.errorRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Your wallet is below \$${threshold.toStringAsFixed(2)}. Recharge to continue receiving premium orders.',
                  style: const TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onRecharge,
            style: ElevatedButton.styleFrom(
              backgroundColor: SwiftShipTheme.errorRed,
              minimumSize: const Size(0, 36),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              textStyle: const TextStyle(fontSize: 12),
            ),
            child: const Text('RECHARGE'),
          ),
        ],
      ),
    );
  }
}
