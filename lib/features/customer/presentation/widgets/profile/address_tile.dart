import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/cubit/profile_state.dart';

class AddressTile extends StatelessWidget {
  final SavedAddress address;
  const AddressTile({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3F2),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: SwiftShipTheme.primaryBlue.withOpacity(0.1),
            child: Icon(
              address.isHome ? Icons.home_outlined : Icons.business_outlined,
              color: SwiftShipTheme.primaryBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  address.details,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black38),
        ],
      ),
    );
  }
}
