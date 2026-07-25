import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_state.dart';

class CourierCard extends StatelessWidget {
  final LiveTrackingState state;
  const CourierCard({super.key, required this.state});

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
          const CircleAvatar(radius: 24, backgroundColor: Colors.black26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      state.courierName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    Text(
                      ' ${state.courierRating}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Text(
                  '${state.vehicleInfo} • ${state.plateNumber}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: SwiftShipTheme.primaryBlue,
            child: const Icon(Icons.phone, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }
}
