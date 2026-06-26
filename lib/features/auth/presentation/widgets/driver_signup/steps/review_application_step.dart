import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/widgets/dashed_border.dart';

class ReviewApplicationStep extends StatelessWidget {
  const ReviewApplicationStep({super.key, required this.onEditStep});

  final void Function(int step) onEditStep;

  String _vehicleTypeLabel(VehicleType type) {
    return switch (type) {
      VehicleType.motorcycle => 'Motorcycle',
      VehicleType.car => 'Car',
      VehicleType.truck => 'Truck',
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverSignupCubit, DriverSignupState>(
      builder: (context, state) {
        final params = state.params;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ReviewCard(
                icon: Icons.person_outline,
                title: 'Personal Info',
                onEdit: () => onEditStep(0),
                children: [
                  _ReviewField(
                    label: 'FULL NAME',
                    value: params.name.isEmpty ? '—' : params.name,
                  ),
                  _ReviewField(
                    label: 'EMAIL ADDRESS',
                    value: params.email.isEmpty ? '—' : params.email,
                  ),
                  _ReviewField(
                    label: 'PHONE NUMBER',
                    value: params.phone.isEmpty ? '—' : params.phone,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _ReviewCard(
                icon: Icons.local_shipping_outlined,
                title: 'Vehicle Info',
                onEdit: () => onEditStep(1),
                children: [
                  _ReviewField(
                    label: 'VEHICLE TYPE',
                    value: _vehicleTypeLabel(params.vehicleType),
                  ),
                  _ReviewField(
                    label: 'MODEL & YEAR',
                    value: params.vehicleModel.isEmpty
                        ? '—'
                        : params.vehicleModel,
                  ),
                  _ReviewField(
                    label: 'LICENSE PLATE',
                    value: params.plateNumber.isEmpty
                        ? '—'
                        : params.plateNumber,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _ReviewCard(
                icon: Icons.description_outlined,
                title: 'Documents',
                onEdit: () => onEditStep(2),
                children: [
                  Row(
                    children: [
                      _DocumentThumbnail(
                        label: 'ID / PASSPORT',
                        imagePath: params.frontIdImagePath?.path ?? '',
                      ),
                      const SizedBox(width: 8),
                      _DocumentThumbnail(
                        label: 'DRIVER LICENSE',
                        imagePath: params.frontLicenseImagePath?.path ?? '',
                      ),
                      const SizedBox(width: 8),
                      _DocumentThumbnail(
                        label: 'VEHICLE FRONT',
                        imagePath: params.frontPlateImagePath?.path ?? '',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _VerifiedItem(label: 'Background Check Authorized'),
                  const SizedBox(height: 8),
                  const _VerifiedItem(label: 'Insurance Policy Verified'),
                ],
              ),
              const SizedBox(height: 20),
              DashedBorder(
                radius: 12,
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: state.agreeToTerms,
                        fillColor: WidgetStateProperty.fromMap(
                          <WidgetStatesConstraint, Color?>{
                            WidgetState.selected: SwiftShipTheme.primaryBlue,
                            WidgetState.any: const Color(0xFFEBE7E7),
                          },
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        onChanged: (_) => context
                            .read<DriverSignupCubit>()
                            .toggleAgreeToTerms(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Wrap(
                        children: [
                          Text(
                            'I certify that all information provided is accurate and I agree to the ',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Terms of Service',
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: SwiftShipTheme.primaryBlue,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    fontSize: 13,
                                  ),
                            ),
                          ),
                          Text(
                            '.',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({
    required this.icon,
    required this.title,
    required this.onEdit,
    required this.children,
  });

  final IconData icon;
  final String title;
  final VoidCallback onEdit;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: SwiftShipTheme.primaryBlue.withAlpha(
                    (0.1 * 255).floor(),
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: SwiftShipTheme.primaryBlue, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: SwiftShipTheme.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _ReviewField extends StatelessWidget {
  const _ReviewField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: const Color(0xFF1C1B1B),
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentThumbnail extends StatelessWidget {
  const _DocumentThumbnail({required this.label, required this.imagePath});

  final String label;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              imagePath.isNotEmpty
                  ? Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => ColoredBox(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_outlined),
                      ),
                    )
                  : ColoredBox(
                      color: const Color(0xFFE5E7EB),
                      child: const Icon(Icons.image_outlined),
                    ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  color: Colors.black54,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VerifiedItem extends StatelessWidget {
  const _VerifiedItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Color(0xFF2E7D32),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 12),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
