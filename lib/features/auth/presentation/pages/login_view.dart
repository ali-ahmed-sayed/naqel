import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/core/widgets/logo.dart';
import 'package:naqel/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9FB),
        // appBar: AppBar(
        //   leading: context.canPop()
        //       ? BackButton(color: Colors.blue)
        //       : SizedBox(),
        //   elevation: 0,
        //   surfaceTintColor: Colors.transparent,
        //   title: Logo(),
        // ),
        appBar: defaultAppBar(context),
        body: LoginViewBody(),
      ),
    );
  }
}
