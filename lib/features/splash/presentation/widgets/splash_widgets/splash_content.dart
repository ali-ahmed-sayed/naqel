import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/features/splash/presentation/Cubit/splash_cubit.dart';
import 'package:naqel/features/splash/presentation/Cubit/splash_state.dart';

class SplashContent extends StatelessWidget {
  const SplashContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listenWhen: (previous, current) =>
          !previous.isDone && current.isDone && current.hasInternet,
      listener: (context, state) {
        if (state.onboardingStatus) {
          context.pushReplacement('/onboarding');
        } else {
          context.pushReplacement('/onboarding');
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return SizedBox(
            width: 192,
            child: LinearProgressIndicator(
              color: Color(0xFFFE6B00),
              value: state.progress,
              borderRadius: BorderRadius.circular(16),
              backgroundColor: Color(0xFFE5E2E1),
            ),
          );
        }
        if (!state.hasInternet && state.isDone) {
          return const _NoConnection();
        }
        return Center(child: Icon(Icons.check, color: Colors.green));
      },
    );
  }
}

class _NoConnection extends StatelessWidget {
  const _NoConnection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final splashCubit = context.read<SplashCubit>();
          splashCubit.load();
        },
        child: Column(
          spacing: 12.0,
          children: [
            Text(
              "No internet connection",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            Icon(
              Icons.refresh_sharp,
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}
