import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/widgets/live_tracking/courier_card.dart';
import 'package:naqel/features/customer/presentation/widgets/live_tracking/map_fab.dart';
import 'package:naqel/features/customer/presentation/widgets/live_tracking/order_meta_card.dart';
import 'package:naqel/features/customer/presentation/widgets/live_tracking/otp_badge.dart';
import 'package:naqel/features/customer/presentation/widgets/live_tracking/step_timeline.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_cubit.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_state.dart';

class LiveTrackingViewBody extends StatelessWidget {
  const LiveTrackingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Map placeholder
        Positioned.fill(
          child: Image.asset("assets/Images/live-track-map.png", fit: .cover),
        ),
        Positioned(
          right: 16,
          top: 100,
          child: Column(
            children: [
              MapFab(icon: Icons.my_location, onTap: () {}),
              const SizedBox(height: 12),
              MapFab(icon: Icons.layers_outlined, onTap: () {}),
            ],
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.55,
          minChildSize: 0.4,
          maxChildSize: 0.85,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: SwiftShipTheme.surfaceWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(SwiftShipTheme.radiusLg),
                ),
              ),
              child: BlocBuilder<LiveTrackingCubit, LiveTrackingState>(
                builder: (context, state) {
                  return ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(
                              SwiftShipTheme.radiusFull,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.courierAssigned
                                      ? 'ARRIVING IN 12 MINS'
                                      : 'STATUS',
                                  style: TextStyle(
                                    color: SwiftShipTheme.accentOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Picking Up Order',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                              ],
                            ),
                          ),
                          if (state.courierAssigned) OtpBadge(otp: state.otp),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (state.courierAssigned) ...[
                        CourierCard(state: state),
                        const SizedBox(height: 12),
                        OrderMetaCard(state: state),
                        const SizedBox(height: 20),
                      ],
                      StepTimeline(state: state),
                      if (!state.courierAssigned) ...[
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<LiveTrackingCubit>().assignCourier(),
                          child: const Text('Simulate Courier Accepted'),
                        ),
                      ],
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
