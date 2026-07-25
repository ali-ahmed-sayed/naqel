import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class ReturnHomeButton extends StatelessWidget {
  const ReturnHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/login'), // Or appropriate home route
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: SwiftShipTheme.primaryBlue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Center(
          child: Text(
            'Return Home',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
