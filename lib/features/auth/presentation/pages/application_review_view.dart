import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/logo.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/application_review_widgets/application_id_card.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/application_review_widgets/approval_journey_card.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/application_review_widgets/estimated_time_card.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/application_review_widgets/return_home_button.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/application_review_widgets/review_header.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/application_review_widgets/review_status_card.dart';

class ApplicationReviewView extends StatelessWidget {
  const ApplicationReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: const Logo(),
        // ),
        appBar: defaultAppBar(
          context,
          withSpace: false,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReviewHeader(),
              const SizedBox(height: 24),
              const EstimatedTimeCard(),
              const SizedBox(height: 24),
              const ReviewStatusCard(),
              const SizedBox(height: 32),
              const ApprovalJourneyCard(),
              const SizedBox(height: 32),
              const ApplicationIdCard(),
              const SizedBox(height: 32),
              const ReturnHomeButton(),
              const SizedBox(height: 24),
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    // Handle support navigation
                  },
                  icon: const Icon(
                    Icons.headset_mic,
                    color: SwiftShipTheme.primaryBlue,
                    size: 20,
                  ),
                  label: Text(
                    'Contact Support',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: SwiftShipTheme.primaryBlue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
