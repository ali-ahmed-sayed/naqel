import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/brand_footer.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Divider
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'OR',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 30),
        // Create Account Button
        SizedBox(
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: () {
              context.push('/select-signup-type');
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFEBE7E7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Create an Account',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Color(0xFF1C1F1B)),
            ),
          ),
        ),
        const SizedBox(height: 60),
        // Footer
        BrandFooter(),
        const SizedBox(height: 20),
      ],
    );
  }
}
