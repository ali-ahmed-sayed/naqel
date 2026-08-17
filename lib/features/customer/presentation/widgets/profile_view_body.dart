import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/widgets/profile/address_tile.dart';
import 'package:naqel/features/customer/presentation/widgets/profile/info_field.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black12,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () =>
                          context.read<ProfileCubit>().toggleEditName(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: SwiftShipTheme.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                state.fullName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              Text(
                state.memberSince,
                style: TextStyle(
                  color: SwiftShipTheme.accentOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ACCOUNT DETAILS',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal Information',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 16),
              InfoField(label: 'FULL NAME', value: state.fullName),
              const SizedBox(height: 12),
              InfoField(label: 'PHONE NUMBER', value: state.phoneNumber),
              const SizedBox(height: 12),
              InfoField(label: 'EMAIL ADDRESS', value: state.email),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Saved Addresses',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 16),
              ...state.addresses.map(
                (a) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AddressTile(address: a),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => context.read<ProfileCubit>().signOut(),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  side: const BorderSide(color: SwiftShipTheme.errorRed),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusFull,
                    ),
                  ),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: SwiftShipTheme.errorRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
