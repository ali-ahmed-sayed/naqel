import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

/// Which tab is active. Screens pass their own index in;
/// there's no cubit here since it's pure navigation, not app state.
enum SwiftShipTab { home, history, profile }

class SwiftShipBottomNav extends StatelessWidget {
  final SwiftShipTab activeTab;
  final ValueChanged<SwiftShipTab>? onTap;

  const SwiftShipBottomNav({super.key, required this.activeTab, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: SwiftShipTheme.surfaceWhite,
            borderRadius: BorderRadius.circular(SwiftShipTheme.radiusFull),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'HOME',
                selected: activeTab == SwiftShipTab.home,
                onTap: () => onTap?.call(SwiftShipTab.home),
              ),
              _NavItem(
                icon: Icons.history_rounded,
                label: 'HISTORY',
                selected: activeTab == SwiftShipTab.history,
                onTap: () => onTap?.call(SwiftShipTab.history),
              ),
              _NavItem(
                icon: Icons.person_rounded,
                label: 'PROFILE',
                selected: activeTab == SwiftShipTab.profile,
                onTap: () => onTap?.call(SwiftShipTab.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(SwiftShipTheme.radiusFull),
      child: Container(
        decoration: selected
            ? BoxDecoration(
                color: SwiftShipTheme.primaryBlue,
                borderRadius: BorderRadius.circular(SwiftShipTheme.radiusFull),
              )
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: selected ? Colors.white : Color(0xFF9E9E9E)),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : Color(0xFF9E9E9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
