import 'package:flutter/material.dart';
import 'package:naqel/core/widgets/logo.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: const Logo(),
    );
  }
}
