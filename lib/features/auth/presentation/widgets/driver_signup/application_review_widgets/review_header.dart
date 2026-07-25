import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: SwiftShipTheme.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            'STEP 4 OF 4 SUBMITTED',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: SwiftShipTheme.primaryBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Application Under Review',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1C1B1B),
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our specialized compliance team is currently verifying your documents and vehicle information to ensure the highest safety standards.',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 14,
                color: const Color(0xFF737688),
                height: 1.5,
              ),
        ),
      ],
    );
  }
}