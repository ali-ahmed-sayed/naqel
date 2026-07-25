import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class KeypadButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;

  const KeypadButton({super.key, this.label, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
        child: SizedBox(
          width: 72,
          height: 56,
          child: Center(
            child: label != null
                ? Text(
                    label!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
