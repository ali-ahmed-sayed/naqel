import 'package:flutter/material.dart';
import 'package:naqel/features/auth/presentation/widgets/customer_signup/customer_signup_form.dart';
import 'package:naqel/features/auth/presentation/widgets/customer_signup/customer_signup_title.dart';

class CustomerSignupBody extends StatelessWidget {
  const CustomerSignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.03 * 255).floor()),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // top right circle
          Positioned(
            top: -64,
            right: -64,
            child: Container(
              width: 128,
              height: 128,
              decoration: const BoxDecoration(
                color: Color(0xFFEDF2FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // bottom left circle
          Positioned(
            bottom: -64,
            left: -64,
            child: Container(
              width: 128,
              height: 128,
              decoration: const BoxDecoration(
                color: Color(0x0DA04100),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // inner form
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // form title
                CustomerSignupTitle(),
                SizedBox(height: 32),
                // form fields
                CustomerSignupForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
