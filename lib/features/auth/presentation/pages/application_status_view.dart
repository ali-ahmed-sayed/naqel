import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_cubit.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_state.dart';
import 'package:naqel/features/auth/presentation/widgets/application_status_view_body.dart';

class ApplicationStatusView extends StatelessWidget {
  /// Pass the real value read from the driver's auth document
  /// (`DriverEntity.isApproved`) — e.g. from the signup result, or from a
  /// freshly-fetched user when re-opening this screen. Defaults to false
  /// (still under review) only as a safe fallback for callers that haven't
  /// been wired up to pass it yet — see the recommendation about the
  /// router's `extra` param.
  const ApplicationStatusView({
    super.key,
    this.applicationStatus = ApplicationStatus.Submitted,
  });

  final ApplicationStatus? applicationStatus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ApplicationStatusCubit(applicationStatus: applicationStatus),
      child: SafeArea(child: const Scaffold(body: ApplicationStatusViewBody())),
    );
  }
}
