import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class AppearanceOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppearanceOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
          border: Border.all(
            color: selected ? SwiftShipTheme.primaryBlue : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? SwiftShipTheme.primaryBlue : Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
