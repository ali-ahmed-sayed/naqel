import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class EstimatedTimeCard extends StatelessWidget {
  const EstimatedTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(24),
        border: const Border(
          left: BorderSide(color: SwiftShipTheme.accentOrange, width: 6),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: SwiftShipTheme.accentOrange),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ESTIMATED TIME',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: SwiftShipTheme.accentOrange,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Usually takes 24-48 hours',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        color: const Color(0xFF1C1B1B),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}