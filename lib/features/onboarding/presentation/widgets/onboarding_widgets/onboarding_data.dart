import 'package:flutter/material.dart';

class OnboardingData extends StatelessWidget {
  const OnboardingData();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      crossAxisAlignment: .start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
            ),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.bolt, color: Color(0xFFA04100), size: 20),
                    SizedBox(width: 4),
                    Text(
                      "INSTANT",
                      textAlign: .left,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(letterSpacing: 1.2),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Under 30m",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(letterSpacing: -0.5),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: .stretch,
              children: [
                Row(
                  mainAxisSize: .min,
                  children: [
                    Icon(Icons.verified_user, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      "SECURE",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Color(0xB2FFFFFF),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Live\nTracking",
                  textAlign: .start,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
