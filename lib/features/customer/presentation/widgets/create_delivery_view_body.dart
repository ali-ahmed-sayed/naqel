import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/widgets/create_delivery/field_card.dart';
import 'package:naqel/features/customer/presentation/cubit/create_delivery_cubit.dart';
import 'package:naqel/features/customer/presentation/cubit/create_delivery_state.dart';

class CreateDeliveryViewBody extends StatelessWidget {
  const CreateDeliveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateDeliveryCubit, CreateDeliveryState>(
        builder: (context, state) {
          final cubit = context.read<CreateDeliveryCubit>();
          return ListView(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            children: [
              Text(
                'NEW SHIPMENT',
                style: TextStyle(
                  color: SwiftShipTheme.accentOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Create Delivery',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 20),

              // Pickup details
              FieldCard(
                label: 'PICKUP DETAILS',
                child: Row(
                  children: [
                    const Icon(
                      Icons.radio_button_checked,
                      color: SwiftShipTheme.primaryBlue,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.pickupAddress,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            state.pickupSchedule,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Drop-off details
              FieldCard(
                label: 'DROP-OFF DETAILS',
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: SwiftShipTheme.accentOrange,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        onChanged: cubit.setDropoff,
                        decoration: const InputDecoration(
                          hintText: 'Where is it going?',
                          border: InputBorder.none,
                          filled: false,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'PACKAGE TYPE',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Row(
                children: PackageType.values.map((type) {
                  final selected = state.packageType == type;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => cubit.selectPackageType(type),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: selected
                                ? SwiftShipTheme.primaryBlue.withOpacity(0.1)
                                : const Color(0xFFF6F3F2),
                            borderRadius: BorderRadius.circular(
                              SwiftShipTheme.radiusMd,
                            ),
                            border: Border.all(
                              color: selected
                                  ? SwiftShipTheme.primaryBlue
                                  : Colors.transparent,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                switch (type) {
                                  PackageType.document =>
                                    Icons.description_outlined,
                                  PackageType.parcel => Icons.archive_outlined,
                                  PackageType.box => Icons.inventory_2_outlined,
                                },
                                color: selected
                                    ? SwiftShipTheme.primaryBlue
                                    : Colors.black54,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                switch (type) {
                                  PackageType.document => 'Document',
                                  PackageType.parcel => 'Parcel',
                                  PackageType.box => 'Box',
                                },
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: selected
                                      ? SwiftShipTheme.primaryBlue
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WEIGHT ESTIMATION',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    '${state.weightKg.toStringAsFixed(1)} kg',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              Slider(
                value: state.weightKg,
                min: 0.1,
                max: 20,
                activeColor: SwiftShipTheme.primaryBlue,
                onChanged: cubit.setWeight,
              ),
              const SizedBox(height: 8),

              GestureDetector(
                onTap: () =>
                    state.hasPhoto ? cubit.removePhoto() : cubit.addPhoto(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F3F2),
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusMd,
                    ),
                    border: Border.all(
                      color: Colors.black12,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        state.hasPhoto
                            ? Icons.check_circle
                            : Icons.camera_alt_outlined,
                        color: state.hasPhoto
                            ? SwiftShipTheme.successText
                            : Colors.black45,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.hasPhoto ? 'Photo added' : 'Add Package Photo',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'OPTIONAL',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: SwiftShipTheme.primaryBlue,
                  borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ESTIMATED PRICE',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${state.estimatedPrice.toStringAsFixed(2)} USD',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'ETA',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.etaRange,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: state.canSubmit ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: SwiftShipTheme.accentOrange,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Confirm & Find Driver'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Secure checkout powered by SwiftPay',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        },
      );
  }
}
