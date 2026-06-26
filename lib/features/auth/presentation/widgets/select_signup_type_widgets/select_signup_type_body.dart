import 'package:flutter/material.dart';

class SelectSignupTypeBody extends StatelessWidget {
  // 1. Pass the current selection down from the parent
  final String selectedType;
  // 2. Give these strict types (VoidCallback) instead of dynamic 'final'
  final VoidCallback customerCallback;
  final VoidCallback driverCallback;

  const SelectSignupTypeBody({
    super.key,
    required this.selectedType,
    required this.customerCallback,
    required this.driverCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Customer Selection Box
        AccountTypeCard(
          title: 'Customer',
          description:
              'Ship items locally or internationally with real-time tracking and premium insurance.',
          actionText: 'Learn about shipping',
          icon: Icons.bookmark_border_rounded,
          iconBackgroundColor: const Color(0xFF0047FF),
          // 3. Use the variable passed from the parent
          isSelected: selectedType == 'customer',
          // 4. FIX: Actually execute the function with ()
          onTap: () => customerCallback(),
        ),
        const SizedBox(height: 24),
        // Driver Selection Box
        AccountTypeCard(
          title: 'Driver',
          description:
              'Join our fleet and earn on your schedule. Premium routes and kinetic route optimization.',
          actionText: 'Explore earnings',
          actionColor: const Color(0xFFA04100),
          icon: Icons.local_shipping_outlined,
          iconBackgroundColor: const Color(0xFFFF6B00),
          // 3. Use the variable passed from the parent
          isSelected: selectedType == 'driver',
          // 4. FIX: Actually execute the function with ()
          onTap: () => driverCallback(),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class AccountTypeCard extends StatelessWidget {
  final String title;
  final String description;
  final String actionText;
  final IconData icon;
  final Color iconBackgroundColor;
  final bool isSelected;
  final Color actionColor;
  final VoidCallback onTap;

  const AccountTypeCard({
    super.key,
    required this.title,
    required this.description,
    required this.actionText,
    required this.icon,
    required this.iconBackgroundColor,
    required this.isSelected,
    required this.onTap,
    this.actionColor = const Color(0xFF0047FF),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEEF2FF) : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? const Color(0xFF0047FF) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Badge
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: iconBackgroundColor.withAlpha((0.3 * 255).floor()),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 20),

            // Text Details
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            // Text Inline Action Arrow Link
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actionText,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: actionColor),
                ),
                const SizedBox(width: 6),
                Icon(Icons.arrow_forward, color: actionColor, size: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
