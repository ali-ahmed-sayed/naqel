import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_cubit.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_state.dart';
import 'package:naqel/features/auth/presentation/widgets/application_status/journey_step_tile.dart';

class ApplicationStatusViewBody extends StatelessWidget {
  const ApplicationStatusViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationStatusCubit, ApplicationStatusState>(
      builder: (context, state) {
        final cubit = context.read<ApplicationStatusCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'SwiftShip',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: SwiftShipTheme.primaryBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        state.applicationStatus == ApplicationStatus.Activated
                        ? SwiftShipTheme.successGreen
                        : SwiftShipTheme.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusFull,
                    ),
                  ),
                  child: Text(
                    state.applicationStatus == ApplicationStatus.Activated
                        ? 'APPLICATION APPROVED'
                        : 'PROCCESSING APPLICATION',
                    style: TextStyle(
                      color:
                          state.applicationStatus == ApplicationStatus.Activated
                          ? SwiftShipTheme.successText
                          : SwiftShipTheme.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  state.applicationStatus == ApplicationStatus.Activated
                      ? 'You\'re Approved!'
                      : 'Application Under Review',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 12),
                Text(
                  state.applicationStatus == ApplicationStatus.Activated
                      ? 'Your documents and vehicle information have been verified. You now have full access to the SwiftShip Driver app.'
                      : 'Our specialized compliance team is currently verifying your documents and vehicle information to ensure the highest safety standards.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                if (!(state.applicationStatus ==
                    ApplicationStatus.Activated)) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F3F2),
                      borderRadius: BorderRadius.circular(
                        SwiftShipTheme.radiusMd,
                      ),
                      border: const Border(
                        left: BorderSide(
                          color: SwiftShipTheme.accentOrange,
                          width: 4,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          color: SwiftShipTheme.accentOrange,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ESTIMATED TIME',
                                style: TextStyle(
                                  color: SwiftShipTheme.accentOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                state.estimatedTimeText,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                if (state.currentStep != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: SwiftShipTheme.surfaceWhite,
                      borderRadius: BorderRadius.circular(
                        SwiftShipTheme.radiusLg,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: SwiftShipTheme.primaryBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.fact_check_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Review in Progress',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Queue: ${state.queueNumber}',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F3F2),
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusLg,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.assignment_turned_in_outlined,
                            color: SwiftShipTheme.primaryBlue,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'The Approval Journey',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      for (int i = 0; i < state.journey.length; i++)
                        JourneyStepTile(
                          index: i + 1,
                          step: state.journey[i],
                          isLast: i == state.journey.length - 1,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F3F2),
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusMd,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'APPLICATION ID',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        state.applicationId,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.returnToHome();
                      context.go(
                        state.applicationStatus == ApplicationStatus.Activated
                            ? '/driver-dashboard'
                            : '/login',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          state.applicationStatus == ApplicationStatus.Activated
                              ? Icons.dashboard_outlined
                              : Icons.login_rounded,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.applicationStatus ==
                                      ApplicationStatus.Activated
                                  ? 'Go to Dashboard'
                                  : 'Return to Login',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              state.applicationStatus ==
                                      ApplicationStatus.Activated
                                  ? 'Start accepting deliveries'
                                  : 'Log in with the same credentials',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton.icon(
                    onPressed: cubit.contactSupport,
                    icon: const Icon(
                      Icons.support_agent_outlined,
                      color: SwiftShipTheme.primaryBlue,
                      size: 18,
                    ),
                    label: const Text(
                      'Contact Support',
                      style: TextStyle(
                        color: SwiftShipTheme.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
