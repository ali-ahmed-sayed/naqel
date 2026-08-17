import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/cubit/settings_state.dart';
import 'package:naqel/features/customer/presentation/widgets/settings/appearence_option.dart';
import 'package:naqel/features/customer/presentation/widgets/settings/legal_row.dart';
import 'package:naqel/features/customer/presentation/widgets/settings/section_card.dart';
import 'package:naqel/features/customer/presentation/widgets/settings/toggle_row.dart';
import '../cubit/settings_cubit.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final cubit = context.read<SettingsCubit>();
        return ListView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          children: [
            Text(
              'SYSTEM PREFERENCES',
              style: TextStyle(
                color: SwiftShipTheme.accentOrange,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Fine-tune your experience.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            // Notifications card
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: SwiftShipTheme.primaryBlue,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Notifications',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ToggleRow(
                    title: 'Delivery Updates',
                    subtitle: 'Real-time tracking and arrival alerts',
                    value: state.deliveryUpdatesEnabled,
                    onChanged: cubit.toggleDeliveryUpdates,
                  ),
                  const SizedBox(height: 16),
                  ToggleRow(
                    title: 'Promotions & Deals',
                    subtitle: 'Exclusive offers and shipping discounts',
                    value: state.promotionsEnabled,
                    onChanged: cubit.togglePromotions,
                  ),
                  const Divider(height: 32),
                  Text(
                    'ACTIVE CHANNELS: EMAIL, SMS, PUSH',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Appearance card
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.palette_outlined,
                        color: SwiftShipTheme.accentOrange,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Appearance',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppearanceOption(
                    label: 'Light Mode',
                    selected: state.appearanceMode == AppearanceMode.light,
                    onTap: () => cubit.setAppearance(AppearanceMode.light),
                  ),
                  const SizedBox(height: 8),
                  AppearanceOption(
                    label: 'Dark Mode',
                    selected: state.appearanceMode == AppearanceMode.dark,
                    onTap: () => cubit.setAppearance(AppearanceMode.dark),
                  ),
                  const SizedBox(height: 8),
                  AppearanceOption(
                    label: 'System',
                    selected: state.appearanceMode == AppearanceMode.system,
                    onTap: () => cubit.setAppearance(AppearanceMode.system),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Security & privacy card
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.shield_outlined,
                        color: SwiftShipTheme.errorRed,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Security & Privacy',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your credentials and biometric authentication to keep your packages and wallet safe.',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('CHANGE PASSWORD'),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F3F2),
                      borderRadius: BorderRadius.circular(
                        SwiftShipTheme.radiusMd,
                      ),
                      border: const Border(
                        left: BorderSide(
                          color: SwiftShipTheme.accentOrange,
                          width: 4,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.fingerprint,
                          color: SwiftShipTheme.errorRed,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Biometric Login',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Enable Face ID or Touch ID',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: state.biometricEnabled,
                          activeThumbColor: SwiftShipTheme.primaryBlue,
                          onChanged: cubit.toggleBiometric,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Legal card
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Legal', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  const LegalRow(label: 'Terms of Service'),
                  const Divider(),
                  const LegalRow(label: 'Privacy Policy'),
                  const Divider(),
                  const LegalRow(label: 'Cookie Preferences'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Support banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: SwiftShipTheme.accentOrange,
                borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Need assistance?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Our concierge support team is available 24/7 for premium members.',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: SwiftShipTheme.accentOrange,
                      ),
                      child: const Text('CONTACT SUPPORT'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
