import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_state.dart';

class JourneyStepTile extends StatelessWidget {
  final int index;
  final ApprovalStep step;
  final bool isLast;

  const JourneyStepTile({
    required this.index,
    required this.step,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = step.status == ApprovalStepStatus.completed;
    final isCurrent = step.status == ApprovalStepStatus.current;
    final isLocked = step.status == ApprovalStepStatus.locked;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (isCompleted || isCurrent)
                      ? SwiftShipTheme.primaryBlue
                      : Colors.black12,
                ),
                child: Center(
                  child: isCompleted
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : isCurrent
                      ? Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        )
                      : isLocked
                      ? const Icon(
                          Icons.lock_outline,
                          size: 14,
                          color: Colors.black45,
                        )
                      : Text(
                          '$index',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isCompleted
                        ? SwiftShipTheme.primaryBlue
                        : Colors.black12,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isLocked
                          ? Colors.black38
                          : (isCurrent
                                ? SwiftShipTheme.primaryBlue
                                : Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    step.subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: isLocked ? Colors.black26 : Colors.black54,
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
