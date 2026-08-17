import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class DriverSignupNavigationBar extends StatelessWidget {
  const DriverSignupNavigationBar({
    super.key,
    required this.onBack,
    required this.onContinue,
    required this.isLastStep,
    this.isContinueEnabled = true,
  });

  final VoidCallback onBack;
  final VoidCallback onContinue;
  final bool isLastStep;
  final bool isContinueEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).floor()),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 52,
              child: OutlinedButton(
                onPressed: onBack,
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFF3F4F6),
                  foregroundColor: const Color(0xFF1C1B1B),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Back'),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: isContinueEnabled ? onContinue : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: SwiftShipTheme.primaryBlue,
                  disabledBackgroundColor: SwiftShipTheme.primaryBlue
                      .withAlpha((0.5 * 255).floor()),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLastStep ? 'Submit Application' : 'Continue',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      isLastStep ? Icons.send_outlined : Icons.arrow_forward,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
