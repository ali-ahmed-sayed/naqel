import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_state.dart';

class OrderMetaCard extends StatelessWidget {
  final LiveTrackingState state;
  const OrderMetaCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(SwiftShipTheme.radiusSm),
            ),
            child: const Icon(Icons.inventory_2_outlined),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ${state.orderId}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                state.orderMeta,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
