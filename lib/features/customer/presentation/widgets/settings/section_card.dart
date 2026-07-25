import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class SectionCard extends StatelessWidget {
  final Widget child;
  const SectionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3F2),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
      ),
      child: child,
    );
  }
}