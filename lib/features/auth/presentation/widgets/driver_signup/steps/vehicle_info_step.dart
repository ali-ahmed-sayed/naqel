import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';

class VehicleInfoStep extends StatelessWidget {
  const VehicleInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DriverSignupCubit>();
    final labelStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: const Color(0xFF737688),
        );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('VEHICLE TYPE', style: labelStyle),
          const SizedBox(height: 12),
          BlocBuilder<DriverSignupCubit, DriverSignupState>(
            buildWhen: (prev, curr) =>
                prev.params.vehicleType != curr.params.vehicleType,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: _VehicleTypeCard(
                      label: 'Motorcycle',
                      icon: Icons.two_wheeler_outlined,
                      type: VehicleType.motorcycle,
                      isSelected:
                          state.params.vehicleType == VehicleType.motorcycle,
                      onTap: () => cubit.updateVehicleType(VehicleType.motorcycle),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _VehicleTypeCard(
                      label: 'Car',
                      icon: Icons.directions_car_outlined,
                      type: VehicleType.car,
                      isSelected: state.params.vehicleType == VehicleType.car,
                      onTap: () => cubit.updateVehicleType(VehicleType.car),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _VehicleTypeCard(
                      label: 'Truck',
                      icon: Icons.local_shipping_outlined,
                      type: VehicleType.truck,
                      isSelected: state.params.vehicleType == VehicleType.truck,
                      onTap: () => cubit.updateVehicleType(VehicleType.truck),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Text('VEHICLE MODEL', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: cubit.updateVehicleModel,
            decoration: const InputDecoration(
              hintText: 'e.g., Toyota Camry 2022',
              suffixIcon: Icon(
                Icons.info_outline,
                color: Color(0xFF737688),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('PLATE NUMBER', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: cubit.updatePlateNumber,
            decoration: const InputDecoration(
              hintText: 'ABC-1234',
              suffixIcon: Icon(
                Icons.badge_outlined,
                color: Color(0xFF737688),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF6B00),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified_user_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Verify Ownership',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ensure your plate number is clearly visible and matches your vehicle\'s registration document for faster approval.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 13,
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _VehicleTypeCard extends StatelessWidget {
  const _VehicleTypeCard({
    required this.label,
    required this.icon,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VehicleType type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEEF2FF) : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF0047FF) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF0047FF)
                  : const Color(0xFF737688),
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? const Color(0xFF0047FF)
                        : const Color(0xFF434656),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
