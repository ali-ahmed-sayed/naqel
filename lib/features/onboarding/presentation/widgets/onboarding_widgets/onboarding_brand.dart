import 'package:flutter/material.dart';

class OnboardingBrand extends StatelessWidget {
  const OnboardingBrand();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          "MOMENTUM IN MOTION",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Color(0xFFFE6B00),
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Precision",
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(letterSpacing: -1),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            final (Alignment beginAlignment, Alignment endAlignment) = (
              Alignment.topCenter,
              Alignment.bottomCenter,
            );
            return LinearGradient(
              begin: beginAlignment,
              colors: [Theme.of(context).primaryColor, Colors.white],
              stops: [0.2, 1.0],
              end: endAlignment,
            ).createShader(bounds);
          },
          child: Text(
            "Tracking.",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              letterSpacing: -1,
              fontStyle: .italic,
            ),
            textScaler: TextScaler.linear(1.0),
          ),
        ),
      ],
    );
  }
}
