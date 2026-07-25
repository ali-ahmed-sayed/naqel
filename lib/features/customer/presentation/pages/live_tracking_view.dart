import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/widgets/live_tracking_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_cubit.dart';

class LiveTrackingView extends StatelessWidget {
  const LiveTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LiveTrackingCubit(),
      child: LiveTrackingViewBody(),
    );
  }
}
