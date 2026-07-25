import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class OtpBadge extends StatelessWidget {
  final String otp;
  const OtpBadge({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: SwiftShipTheme.primaryBlue.withOpacity(0.08),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusMd),
      ),
      child: Column(
        children: [
          const Text(
            'SECURITY OTP',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: SwiftShipTheme.primaryBlue,
            ),
          ),
          Text(
            otp.split('').join(' '),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: SwiftShipTheme.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
