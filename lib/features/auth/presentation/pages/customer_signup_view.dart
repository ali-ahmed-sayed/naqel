import 'package:flutter/material.dart';
import 'package:naqel/features/auth/presentation/widgets/customer_signup_view_body.dart';

class CustomerSignupView extends StatelessWidget {
  const CustomerSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomerSignupViewBody(),
    );
  }
}