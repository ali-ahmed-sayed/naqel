import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_state.dart';
import 'package:naqel/features/driver/presentation/widgets/active_route/otp_verification_body.dart';
import 'package:naqel/features/driver/presentation/widgets/active_route/route_stops_body.dart';

class ActiveRouteViewBody extends StatelessWidget {
  const ActiveRouteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveRouteCubit, ActiveRouteState>(
      builder: (context, state) {
        return state.stage == RouteStage.verifyingOtp
            ? OtpVerificationBody(state: state)
            : RouteStopsBody(state: state);
      },
    );
  }
}
