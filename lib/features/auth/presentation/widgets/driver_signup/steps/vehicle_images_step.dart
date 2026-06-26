import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/widgets/upload_photo_card.dart';
import 'package:naqel/injection_container.dart';

class VehicleImagesStep extends StatelessWidget {
  const VehicleImagesStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DriverSignupCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<DriverSignupCubit, DriverSignupState>(
            buildWhen: (prev, curr) =>
                prev.params.frontPlateImagePath !=
                    curr.params.frontPlateImagePath ||
                prev.params.backPlateImagePath != curr.params.backPlateImagePath,
            builder: (context, state) {
              return Column(
                children: [
                  UploadPhotoCard(
                    title: 'Front License Plate',
                    imagePath: state.params.frontPlateImagePath?.path ?? '',
                    onTap: () async {
                      final image = await sl<ImagePicker>().pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        cubit.updateFrontPlateImage(image);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  UploadPhotoCard(
                    title: 'Back License Plate',
                    imagePath: state.params.backPlateImagePath?.path ?? '',
                    onTap: () async {
                      final image = await sl<ImagePicker>().pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        cubit.updateBackPlateImage(image);
                      }
                    },
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Container(
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
                    const Icon(
                      Icons.lightbulb_outline,
                      color: Color(0xFFFF6B00),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Tips for clear photos',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _TipItem(
                  icon: Icons.wb_sunny_outlined,
                  title: 'Good lighting',
                  description:
                      'Take photos during the day or in a well-lit area for clarity.',
                ),
                const SizedBox(height: 12),
                const _TipItem(
                  icon: Icons.flash_off_outlined,
                  title: 'No glare',
                  description:
                      'Avoid camera flash and direct sunlight to prevent reflections.',
                ),
                const SizedBox(height: 12),
                const _TipItem(
                  icon: Icons.hd_outlined,
                  title: 'High resolution',
                  description:
                      'Ensure all characters on the plate are sharp and legible.',
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

class _TipItem extends StatelessWidget {
  const _TipItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF737688)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 12,
                      height: 1.4,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
