import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_state.dart';

class StepTimeline extends StatelessWidget {
  final LiveTrackingState state;
  const StepTimeline({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final steps = TrackingStep.values;
    final currentIndex = steps.indexOf(state.currentStep);

    String labelFor(TrackingStep s) => switch (s) {
      TrackingStep.searching => 'Searching for courier',
      TrackingStep.courierAccepted => 'Courier accepted',
      TrackingStep.pickingUp => 'Picking up your order',
      TrackingStep.onTheWay => 'Courier is on the way',
      TrackingStep.delivered => 'Delivered',
    };

    String subtitleFor(int index) {
      if (index < currentIndex) return 'Completed at 14:0${index + 2}';
      if (index == currentIndex) return state.etaText;
      if (index == currentIndex + 1) return 'Next step';
      return '';
    }

    return Column(
      children: List.generate(steps.length, (index) {
        final isDone = index < currentIndex;
        final isCurrent = index == currentIndex;
        final isLast = index == steps.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (isDone || isCurrent)
                          ? SwiftShipTheme.primaryBlue
                          : Colors.black12,
                    ),
                    child: Icon(
                      isDone
                          ? Icons.check
                          : isCurrent
                          ? Icons.radio_button_checked
                          : null,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: isDone
                            ? SwiftShipTheme.primaryBlue
                            : Colors.black12,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        labelFor(steps[index]),
                        style: TextStyle(
                          fontWeight: isCurrent
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: (isDone || isCurrent)
                              ? Colors.black87
                              : Colors.black45,
                        ),
                      ),
                      if (subtitleFor(index).isNotEmpty)
                        Text(
                          subtitleFor(index),
                          style: TextStyle(
                            fontSize: 12,
                            color: isCurrent
                                ? SwiftShipTheme.primaryBlue
                                : Colors.black45,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
