
import 'package:flutter/material.dart';
import 'package:naqel/core/widgets/logo.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo
        const Logo(),
        const SizedBox(height: 40),
        // Header Text
        Text(
          'WELCOME BACK',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: const Color(0xFFA04100),
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Login to your\nportal',
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(letterSpacing: -0.9),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
