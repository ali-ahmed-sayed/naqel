import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: .hardEdge,
      child: Image.asset("assets/Images/onboarding.png", fit: BoxFit.fill),
    );
  }
}
