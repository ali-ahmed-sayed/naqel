import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_state.dart';

class StopCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color titleColor;
  final RouteStop stop;
  final VoidCallback onStartNavigation;

  const StopCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.titleColor,
    required this.stop,
    required this.onStartNavigation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SwiftShipTheme.surfaceWhite,
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stop.title,
                      style: TextStyle(
                        color: titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      stop.placeName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      stop.address,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onStartNavigation,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.navigation_outlined, size: 16),
                  SizedBox(width: 6),
                  Text('START NAVIGATION'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
