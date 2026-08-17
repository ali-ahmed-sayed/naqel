import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/screen_appbar.dart';
import 'package:naqel/features/customer/presentation/widgets/create_delivery_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/create_delivery_cubit.dart';

class CreateDeliveryView extends StatelessWidget {
  const CreateDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateDeliveryCubit(),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
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
          appBar: screenAppBar(context, "Create Delivery"),
          body: const CreateDeliveryViewBody(),
        ),
      ),
    );
  }
}
