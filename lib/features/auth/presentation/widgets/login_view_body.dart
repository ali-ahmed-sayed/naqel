import 'package:flutter/material.dart';
import 'package:naqel/features/auth/presentation/widgets/login_widgets/login_bottom.dart';
import 'package:naqel/features/auth/presentation/widgets/login_widgets/login_form.dart';
import 'package:naqel/features/auth/presentation/widgets/login_widgets/login_title.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 48.0),
      child: Column(
        children: [const LoginTitle(), const LoginForm(), const LoginBottom()],
      ),
    );
  }
}
