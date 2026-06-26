import 'package:flutter/material.dart';

class SelectSignupTypeTitle extends StatelessWidget {
  const SelectSignupTypeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'GETTING STARTED',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFFA04100),
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Choose Account Type',
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(letterSpacing: -0.8),
        ),
        const SizedBox(height: 12),
        Text(
          'Select how you want to use the\nSwiftShip platform.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
