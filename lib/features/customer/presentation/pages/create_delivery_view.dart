import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/widgets/create_delivery_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/create_delivery_cubit.dart';

class CreateDeliveryView extends StatelessWidget {
  const CreateDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateDeliveryCubit(),
      child: const CreateDeliveryViewBody(),
    );
  }
}