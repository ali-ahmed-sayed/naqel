import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_state.dart';
import 'package:naqel/features/driver/presentation/widgets/active_route/round_icon_button.dart';
import 'package:naqel/features/driver/presentation/widgets/active_route/stop_card.dart';

class RouteStopsBody extends StatelessWidget {
  final ActiveRouteState state;
  const RouteStopsBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActiveRouteCubit>();
    final buttonLabel = state.stage == RouteStage.headingToPickup
        ? 'Picked Up'
        : 'Delivered';

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            children: [
              StopCard(
                iconColor: SwiftShipTheme.primaryBlue,
                icon: Icons.location_on,
                titleColor: SwiftShipTheme.primaryBlue,
                stop: state.pickup,
                onStartNavigation: cubit.startNavigationToPickup,
              ),
              const SizedBox(height: 16),
              StopCard(
                iconColor: SwiftShipTheme.accentOrange,
                icon: Icons.flag,
                titleColor: SwiftShipTheme.accentOrange,
                stop: state.dropoff,
                onStartNavigation: cubit.startNavigationToDropoff,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SwiftShipTheme.surfaceWhite,
                  borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black26,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.recipientName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Recipient • ${state.recipientRating.toStringAsFixed(1)} Rating',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    RoundIconButton(
                      icon: Icons.phone,
                      background: SwiftShipTheme.primaryBlue.withValues(
                        alpha: 0.1,
                      ),
                      iconColor: SwiftShipTheme.primaryBlue,
                      onTap: cubit.callRecipient,
                    ),
                    const SizedBox(width: 8),
                    RoundIconButton(
                      icon: Icons.chat_bubble_outline,
                      background: const Color(0xFFF6F3F2),
                      iconColor: Colors.black54,
                      onTap: cubit.messageRecipient,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: ElevatedButton(
              onPressed: cubit.primaryActionPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, size: 20),
                  const SizedBox(width: 8),
                  Text(buttonLabel),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
