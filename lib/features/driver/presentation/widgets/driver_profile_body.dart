// lib/features/profile/presentation/views/widgets/driver_profile_body.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class DriverProfileBody extends StatelessWidget {
  const DriverProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SwiftShipTheme.spacingXl),
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: const Color(0xFFF6F3F2),
                      // Placeholder for Image asset
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                    const CircleAvatar(
                      radius: SwiftShipTheme.radiusMd,
                      backgroundColor: SwiftShipTheme.accentOrange,
                      child: Icon(Icons.check, size: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: SwiftShipTheme.spacingSm),
                Text(
                  'KINETIC DRIVER',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: SwiftShipTheme.accentOrange,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text('Marcus Thorne', style: theme.textTheme.headlineMedium),
                const SizedBox(height: SwiftShipTheme.spacingSm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SwiftShipTheme.spacingMd,
                    vertical: SwiftShipTheme.spacingXs,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F3F2),
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusFull,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: SwiftShipTheme.accentOrange,
                        size: 16,
                      ),
                      const SizedBox(width: SwiftShipTheme.spacingXs),
                      Text(
                        '4.9',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: SwiftShipTheme.spacingXs),
                      Text(
                        '(2.4k Deliveries)',
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: SwiftShipTheme.spacingXl),
          Text(
            'IDENTITY & CONTACT',
            style: theme.textTheme.labelMedium?.copyWith(
              color: SwiftShipTheme.primaryBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Personal Info', style: theme.textTheme.titleLarge),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  minimumSize: const Size(0, 36),
                  padding: const EdgeInsets.symmetric(
                    horizontal: SwiftShipTheme.spacingMd,
                  ),
                ),
                child: const Text('Edit Details'),
              ),
            ],
          ),
          const SizedBox(height: SwiftShipTheme.spacingMd),
          _buildInfoTile(theme, 'FULL NAME', 'Marcus Thorne'),
          const SizedBox(height: SwiftShipTheme.spacingSm),
          _buildInfoTile(theme, 'EMAIL', 'm.thorne@velocity-logistics.com'),
          const SizedBox(height: SwiftShipTheme.spacingSm),
          _buildInfoTile(theme, 'PHONE', '+1 (555) 924-0012'),
          const SizedBox(height: SwiftShipTheme.spacingSm),
          _buildInfoTile(
            theme,
            'RESIDENTIAL ADDRESS',
            '4221 Kinetic Way, Suite 300, Austin, TX',
          ),

          const SizedBox(height: SwiftShipTheme.spacingXl),
          Text(
            'OPERATIONAL ASSETS',
            style: theme.textTheme.labelMedium?.copyWith(
              color: SwiftShipTheme.primaryBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('Vehicle Details', style: theme.textTheme.titleLarge),
          const SizedBox(height: SwiftShipTheme.spacingMd),
          Container(
            width: width,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F3F2),
              borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
            ),
            padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBE7E7),
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusMd,
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(SwiftShipTheme.spacingSm),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SwiftShipTheme.spacingSm,
                      vertical: SwiftShipTheme.spacingXs,
                    ),
                    decoration: BoxDecoration(
                      color: SwiftShipTheme.primaryBlue,
                      borderRadius: BorderRadius.circular(
                        SwiftShipTheme.radiusFull,
                      ),
                    ),
                    child: Text(
                      'ACTIVE UNIT',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: SwiftShipTheme.spacingSm),
                Text(
                  'Ford Transit 2024',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF1C1B1B),
                  ),
                ),
                const SizedBox(height: SwiftShipTheme.spacingMd),
                Row(
                  children: [
                    Expanded(
                      child: _buildVehicleStat(
                        theme,
                        Icons.local_shipping,
                        'ASSET CLASS',
                        'Truck (Light Comm.)',
                      ),
                    ),
                    Expanded(
                      child: _buildVehicleStat(
                        theme,
                        Icons.badge,
                        'LICENSE PLATE',
                        'VEL-OCITY-7',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: SwiftShipTheme.spacingXl),
          Text(
            'COMPLIANCE',
            style: theme.textTheme.labelMedium?.copyWith(
              color: SwiftShipTheme.primaryBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('Document Status', style: theme.textTheme.titleLarge),
          const SizedBox(height: SwiftShipTheme.spacingMd),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF6F3F2),
              borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
            ),
            child: Column(
              children: [
                _buildDocumentTile(
                  theme,
                  Icons.description,
                  'Commercial Insurance',
                  true,
                ),
                const Divider(color: Color(0xFFEBE7E7), height: 1),
                _buildDocumentTile(
                  theme,
                  Icons.credit_card,
                  'Driver\'s License',
                  true,
                ),
                const Divider(color: Color(0xFFEBE7E7), height: 1),
                _buildDocumentTile(
                  theme,
                  Icons.medical_services,
                  'Health Certificate',
                  true,
                ),
              ],
            ),
          ),

          const SizedBox(height: SwiftShipTheme.spacingXl),
          _buildActionTile(theme, Icons.settings, 'Settings'),
          const SizedBox(height: SwiftShipTheme.spacingSm),
          _buildActionTile(theme, Icons.privacy_tip_outlined, 'Privacy Policy'),

          const SizedBox(height: SwiftShipTheme.spacingXl),
          Center(
            child: TextButton.icon(
              onPressed: () => context.go('/login'),
              icon: const Icon(Icons.logout, color: SwiftShipTheme.errorRed),
              label: Text(
                'Logout',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: SwiftShipTheme.errorRed,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: SwiftShipTheme.spacingXxl),
          const SizedBox(height: SwiftShipTheme.spacingXxl),
        ],
      ),
    );
  }

  Widget _buildInfoTile(ThemeData theme, String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(SwiftShipTheme.spacingMd),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3F2),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(fontSize: 10),
          ),
          const SizedBox(height: SwiftShipTheme.spacingXs),
          Text(value, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }

  Widget _buildVehicleStat(
    ThemeData theme,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: SwiftShipTheme.primaryBlue, size: 24),
        const SizedBox(width: SwiftShipTheme.spacingSm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(fontSize: 10),
              ),
              Text(
                value,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentTile(
    ThemeData theme,
    IconData icon,
    String title,
    bool isVerified,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(SwiftShipTheme.spacingSm),
        decoration: BoxDecoration(
          color: const Color(0xFFEBE7E7),
          borderRadius: BorderRadius.circular(SwiftShipTheme.radiusSm),
        ),
        child: Icon(icon, color: const Color(0xFF434656)),
      ),
      title: Text(title, style: theme.textTheme.labelLarge),
      trailing: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SwiftShipTheme.spacingSm,
          vertical: SwiftShipTheme.spacingXs,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(SwiftShipTheme.radiusFull),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: SwiftShipTheme.primaryBlue,
              size: 14,
            ),
            const SizedBox(width: SwiftShipTheme.spacingXs),
            Text(
              'Verified',
              style: theme.textTheme.labelMedium?.copyWith(
                color: SwiftShipTheme.primaryBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(ThemeData theme, IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3F2),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1C1B1B)),
        title: Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFF9E9E9E)),
        onTap: () {},
      ),
    );
  }
}
