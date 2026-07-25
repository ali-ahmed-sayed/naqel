import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class ReviewStatusCard extends StatelessWidget {
  const ReviewStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: SwiftShipTheme.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.assignment_turned_in, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review in Progress',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      color: const Color(0xFF1C1B1B),
                    ),
              ),
              Text(
                'Queue: #2,481',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 12,
                      color: const Color(0xFF737688),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}