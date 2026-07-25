import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class AvailabilityToggle extends StatelessWidget {
  final bool isOnline;
  final ValueChanged<bool> onChanged;

  const AvailabilityToggle({
    super.key,
    required this.isOnline,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: SwiftShipTheme.secondaryButtonFill,
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusFull),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isOnline
                      ? SwiftShipTheme.primaryBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    SwiftShipTheme.radiusFull,
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.podcasts,
                      size: 16,
                      color: isOnline ? Colors.white : Colors.black54,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'ONLINE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isOnline ? Colors.white : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isOnline
                      ? SwiftShipTheme.primaryBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    SwiftShipTheme.radiusFull,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'OFFLINE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: !isOnline ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
