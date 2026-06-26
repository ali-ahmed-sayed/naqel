import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/widgets/upload_photo_card.dart';
import 'package:naqel/injection_container.dart';

class PersonalInfoStep extends StatefulWidget {
  const PersonalInfoStep({super.key});

  @override
  State<PersonalInfoStep> createState() => _PersonalInfoStepState();
}

class _PersonalInfoStepState extends State<PersonalInfoStep> {
  bool _isObscured = true;

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
          _FieldLabel('FULL NAME', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: cubit.updateName,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(hintText: 'Johnathan Doe'),
          ),
          const SizedBox(height: 20),
          _FieldLabel('EMAIL ADDRESS', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: cubit.updateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'john@swiftship.com'),
          ),
          const SizedBox(height: 20),
          _FieldLabel('PHONE NUMBER', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: cubit.updatePhone,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: '+1 (555) 000-0000'),
          ),
          const SizedBox(height: 20),
          _FieldLabel('PASSWORD', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: cubit.updatePassword,
            obscureText: _isObscured,
            decoration: InputDecoration(
              hintText: '••••••••',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: const Color(0xFF737688),
                ),
                onPressed: () => setState(() => _isObscured = !_isObscured),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _FieldLabel('CONFIRM PASSWORD', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: _isObscured,
            decoration: const InputDecoration(hintText: '••••••••'),
          ),
          const SizedBox(height: 24),
          BlocBuilder<DriverSignupCubit, DriverSignupState>(
            buildWhen: (prev, curr) =>
                prev.params.driverImagePath != curr.params.driverImagePath,
            builder: (context, state) {
              return UploadPhotoCard(
                title: 'Your Image',
                imagePath: state.params.driverImagePath?.path ?? '',
                height: 180,
                onTap: () async {
                  final image = await sl<ImagePicker>().pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    cubit.updateDriverImage(image);
                  }
                },
              );
            },
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: SwiftShipTheme.primaryBlue.withAlpha(
                      (0.1 * 255).floor(),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    color: SwiftShipTheme.primaryBlue,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Privacy & Security',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 15,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Your personal information is encrypted and securely stored. We only use this data to verify your identity and facilitate safe deliveries within the SwiftShip ecosystem.',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 13,
                              height: 1.5,
                            ),
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
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text, {required this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
