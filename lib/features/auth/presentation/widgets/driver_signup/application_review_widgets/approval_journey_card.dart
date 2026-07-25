import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class ApprovalJourneyCard extends StatelessWidget {
  const ApprovalJourneyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.fact_check,
                color: SwiftShipTheme.primaryBlue,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'The Approval Journey',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  color: const Color(0xFF1C1B1B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _JourneyStep(
            title: 'Application Submitted',
            subtitle: 'Received on May 24, 10:42 AM',
            status: JourneyStatus.completed,
          ),
          _JourneyStep(
            title: 'Document Verification',
            subtitle: 'Checking ID, License, and Insurance',
            status: JourneyStatus.active,
          ),
          _JourneyStep(
            title: 'Background Check',
            subtitle: 'Standard safety screening protocol',
            status: JourneyStatus.pending,
          ),
          _JourneyStep(
            title: 'Account Activation',
            subtitle: 'Full access to SwiftShip Driver app',
            status: JourneyStatus.locked,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

enum JourneyStatus { completed, active, pending, locked }

class _JourneyStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final JourneyStatus status;
  final bool isLast;

  const _JourneyStep({
    required this.title,
    required this.subtitle,
    required this.status,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFFD1D1D1);
    IconData icon = Icons.circle;

    if (status == JourneyStatus.completed || status == JourneyStatus.active) {
      color = SwiftShipTheme.primaryBlue;
      icon = Icons.check_circle;
    } else if (status == JourneyStatus.locked) {
      icon = Icons.lock_outline;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 14, color: Colors.white),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color:
                          status == JourneyStatus.completed ||
                              status == JourneyStatus.active
                          ? SwiftShipTheme.primaryBlue
                          : const Color(0xFFE0E0E0),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color:
                          status == JourneyStatus.pending ||
                              status == JourneyStatus.locked
                          ? const Color(0xFF9E9E9E)
                          : const Color(0xFF1C1B1B),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 12,
                      color: const Color(0xFF737688),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
