import 'package:flutter/material.dart';
import 'package:naqel/core/widgets/default_appbar.dart';
import 'package:naqel/features/onboarding/presentation/widgets/onboarding_view_body.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: context.canPop() ? BackButton(color: Colors.blue) : null,
        //   title: Logo(),
        // ),
        appBar: defaultAppBar(context),
        body: OnboardingViewBody(),
      ),
    );
  }
}
