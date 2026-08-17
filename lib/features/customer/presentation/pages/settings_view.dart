import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/core/widgets/screen_appbar.dart';
import 'package:naqel/features/customer/presentation/cubit/settings_cubit.dart';
import 'package:naqel/features/customer/presentation/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: BackButton(
          //     color: SwiftShipTheme.primaryBlue,
          //     onPressed: () => context.pop(),
          //   ),
          //   title: const Text(
          //     'Settings',
          //     style: TextStyle(color: Colors.black87),
          //   ),
          // ),
          appBar: screenAppBar(context, "Settings"),
          body: const SettingsViewBody(),
        ),
      ),
    );
  }
}
