import 'package:flutter/material.dart';
import 'package:naqel/features/onboarding/presentation/widgets/onboarding_widgets/onboarding_brand.dart';
import 'package:naqel/features/onboarding/presentation/widgets/onboarding_widgets/onboarding_data.dart';
import 'package:naqel/features/onboarding/presentation/widgets/onboarding_widgets/onboarding_header.dart';
import 'package:naqel/features/onboarding/presentation/widgets/onboarding_widgets/onboarding_image.dart';
import 'package:naqel/features/onboarding/presentation/widgets/onboarding_widgets/onboarding_next_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          const OnboardingHeader(),
          const OnboardingImage(),
          SizedBox(height: 16),
          const OnboardingData(),
          Column(
            crossAxisAlignment: .end,
            children: [const OnboardingBrand(), const OnboardingNextButton()],
          ),
        ],
      ),
    );
  }
}

