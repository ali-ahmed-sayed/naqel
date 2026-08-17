import 'package:flutter/material.dart';
import 'package:naqel/core/widgets/brand_footer.dart';
import 'package:naqel/features/auth/presentation/widgets/customer_signup/customer_signup_body.dart';
import 'package:naqel/features/auth/presentation/widgets/signup_header_widget.dart';

class CustomerSignupViewBody extends StatelessWidget {
  const CustomerSignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // header
          const SignupHeaderWidget(),
          // form container
          CustomerSignupBody(),
          const SizedBox(height: 32),
          // Global Footer Branding text
          BrandFooter(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
