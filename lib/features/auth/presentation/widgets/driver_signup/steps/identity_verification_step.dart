import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/widgets/dashed_border.dart';
import 'package:naqel/injection_container.dart';

class IdentityVerificationStep extends StatelessWidget {
  const IdentityVerificationStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DriverSignupCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _DocumentSectionHeader(
            icon: Icons.badge_outlined,
            iconColor: SwiftShipTheme.primaryBlue,
            backgroundColor: Color(0xFFEEF2FF),
            title: 'Driver\'s License',
          ),
          const SizedBox(height: 12),
          BlocBuilder<DriverSignupCubit, DriverSignupState>(
            buildWhen: (prev, curr) =>
                prev.params.frontLicenseImagePath !=
                    curr.params.frontLicenseImagePath ||
                prev.params.backLicenseImagePath !=
                    curr.params.backLicenseImagePath,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: _DocumentUploadCard(
                      label: 'FRONT SIDE',
                      subtitle: 'Tap to capture or upload',
                      icon: Icons.credit_card_outlined,
                      hasImage:
                          state.params.frontLicenseImagePath?.path.isNotEmpty ??
                          false,
                      onTap: () async {
                        final image = await sl<ImagePicker>().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) {
                          cubit.updateFrontLicenseImage(image);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DocumentUploadCard(
                      label: 'BACK SIDE',
                      subtitle: 'Clear scan required',
                      icon: Icons.flip_to_back_outlined,
                      hasImage: state.params.backLicenseImagePath?.path.isNotEmpty ?? false,
                      onTap: () async {
                        final image = await sl<ImagePicker>().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) {
                          cubit.updateBackLicenseImage(image);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          const _DocumentSectionHeader(
            icon: Icons.public_outlined,
            iconColor: Color(0xFFFF6B00),
            backgroundColor: Color(0xFFFFF3E0),
            title: 'National ID / Passport',
          ),
          const SizedBox(height: 12),
          BlocBuilder<DriverSignupCubit, DriverSignupState>(
            buildWhen: (prev, curr) =>
                prev.params.frontIdImagePath != curr.params.frontIdImagePath ||
                prev.params.backIdImagePath != curr.params.backIdImagePath,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: _DocumentUploadCard(
                      label: 'FRONT SIDE',
                      subtitle: 'Ensure all details are legible',
                      icon: Icons.perm_identity_outlined,
                      hasImage: state.params.frontIdImagePath?.path.isNotEmpty ?? false,
                      onTap: () async {
                        final image = await sl<ImagePicker>().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) {
                          cubit.updateFrontIdImage(image);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DocumentUploadCard(
                      label: 'BACK SIDE',
                      subtitle: 'Full edge-to-edge view',
                      icon: Icons.article_outlined,
                      hasImage: state.params.backIdImagePath?.path.isNotEmpty ?? false,
                      onTap: () async {
                        final image = await sl<ImagePicker>().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) {
                          cubit.updateBackIdImage(image);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: SwiftShipTheme.primaryBlue.withAlpha(
                    (0.1 * 255).floor(),
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  color: SwiftShipTheme.primaryBlue,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'SECURE & ENCRYPTED',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: const Color(0xFF434656),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _DocumentSectionHeader extends StatelessWidget {
  const _DocumentSectionHeader({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.title,
  });

  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}

class _DocumentUploadCard extends StatelessWidget {
  const _DocumentUploadCard({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.hasImage,
    required this.onTap,
  });

  final String label;
  final String subtitle;
  final IconData icon;
  final bool hasImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DashedBorder(
        radius: 12,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          children: [
            Icon(
              hasImage ? Icons.check_circle_outline : icon,
              size: 32,
              color: hasImage
                  ? const Color(0xFF2E7D32)
                  : const Color(0xFF737688),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
