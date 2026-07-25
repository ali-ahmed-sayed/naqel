import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

import 'package:naqel/features/driver/presentation/widgets/active_route_view_body.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_state.dart';

class ActiveRouteScreen extends StatelessWidget {
  const ActiveRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActiveRouteCubit(),
      child: const ActiveRouteView(),
    );
  }
}

class ActiveRouteView extends StatelessWidget {
  const ActiveRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveRouteCubit, ActiveRouteState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              color: SwiftShipTheme.primaryBlue,
              onPressed: () => context.pop(),
            ),
            title: Text(
              'Active Route: ${state.routeId}',
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.black54),
              ),
            ],
          ),
          body: ActiveRouteViewBody(),
        );
      },
    );
  }
}






