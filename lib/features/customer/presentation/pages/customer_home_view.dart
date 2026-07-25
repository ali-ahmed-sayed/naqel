import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/widgets/customer_home_view_body.dart';
import 'package:naqel/features/customer/presentation/cubit/customer_home_cubit.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const CustomerHomeViewBody(),
    );
  }
}
