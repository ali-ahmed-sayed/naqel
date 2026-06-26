import 'package:flutter/material.dart';

class SelectSignupTypeFooter extends StatelessWidget {
  const SelectSignupTypeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            'By continuing, you agree to our ',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: const Color(0xFF737688)),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Terms of Service',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color(0xFF0047FF),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
