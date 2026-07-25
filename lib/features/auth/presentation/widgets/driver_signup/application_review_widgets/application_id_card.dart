import 'package:flutter/material.dart';

class ApplicationIdCard extends StatelessWidget {
  final String applicationId;
  const ApplicationIdCard({super.key, this.applicationId = 'SWFT-990-21A'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'APPLICATION ID',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: const Color(0xFF737688),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            applicationId,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1C1B1B),
            ),
          ),
        ],
      ),
    );
  }
}
