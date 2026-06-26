import 'package:flutter/material.dart';

class CustomerSignupTitle extends StatelessWidget {
  const CustomerSignupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CREATE ACCOUNT',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: const Color(0xFFA04100),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Start Shipping',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
        ),
      ],
    );
  }
}
