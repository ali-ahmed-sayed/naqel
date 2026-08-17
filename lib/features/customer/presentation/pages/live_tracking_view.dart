import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/screen_appbar.dart';
import 'package:naqel/features/customer/presentation/widgets/live_tracking_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/live_tracking_cubit.dart';

class LiveTrackingView extends StatelessWidget {
  const LiveTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LiveTrackingCubit(),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   leading: BackButton(
          //     color: SwiftShipTheme.primaryBlue,
          //     onPressed: () => context.go("customer-home"),
          //   ),
          //   title: Text(
          //     'SwiftShip',
          //     style: Theme.of(
          //       context,
          //     ).textTheme.titleLarge?.copyWith(color: SwiftShipTheme.primaryBlue),
          //   ),
          // ),
          appBar: screenAppBar(context, "Live Tracking"),
          body: LiveTrackingViewBody(),
        ),
      ),
    );
  }
}
