import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/usecases/usecase.dart';
import 'package:naqel/features/onboarding/domain/usecases/onboarding_done_usecase.dart';
import 'package:naqel/injection_container.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2.4375,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          sl<SetOnboardingDoneUseCase>().call(NoParams());
          context.pushReplacement('/login');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Continue", style: Theme.of(context).textTheme.titleMedium),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.arrow_forward, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
