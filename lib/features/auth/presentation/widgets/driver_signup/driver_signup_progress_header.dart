import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class DriverSignupStepInfo {
  final String stepLabel;
  final String title;
  final double progress;

  const DriverSignupStepInfo({
    required this.stepLabel,
    required this.title,
    required this.progress,
  });
}

const driverSignupSteps = [
  DriverSignupStepInfo(
    stepLabel: 'STEP 1 OF 5',
    title: 'Personal Information',
    progress: 0.2,
  ),
  DriverSignupStepInfo(
    stepLabel: 'STEP 2 OF 5',
    title: 'Vehicle Information',
    progress: 0.4,
  ),
  DriverSignupStepInfo(
    stepLabel: 'STEP 3 OF 5',
    title: 'Vehicle Images',
    progress: 0.6,
  ),
  DriverSignupStepInfo(
    stepLabel: 'STEP 4 OF 5',
    title: 'Identity Verification',
    progress: 0.8,
  ),
  DriverSignupStepInfo(
    stepLabel: 'STEP 5 OF 5',
    title: 'Review Application',
    progress: 1.0,
  ),
];

class DriverSignupProgressHeader extends StatelessWidget {
  const DriverSignupProgressHeader({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final step = driverSignupSteps[currentStep];
    final percent = (step.progress * 100).round();
    final isReviewStep = currentStep == driverSignupSteps.length - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.stepLabel,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: const Color(0xFFA04100),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  step.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 28,
                      ),
                ),
              ),
              if (!isReviewStep)
                Text(
                  '$percent%',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: SwiftShipTheme.primaryBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (isReviewStep)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'COMPLETION',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: SwiftShipTheme.primaryBlue,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                  ),
                  Text(
                    '100%',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: SwiftShipTheme.primaryBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: step.progress,
              minHeight: 6,
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFFF6B00),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
