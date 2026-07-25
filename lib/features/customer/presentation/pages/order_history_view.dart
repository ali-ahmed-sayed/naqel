import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/widgets/order_history_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_cubit.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderHistoryCubit(),
      child: const OrderHistoryViewBody(),
    );
  }
}
