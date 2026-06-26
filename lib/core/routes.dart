import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/utils/screen_transitions.dart';
import 'package:naqel/features/auth/presentation/pages/customer_signup_view.dart';
import 'package:naqel/features/auth/presentation/pages/driver_signup_view.dart';
import 'package:naqel/features/auth/presentation/pages/login_view.dart';
import 'package:naqel/features/auth/presentation/pages/select_signup_type_view.dart';
import 'package:naqel/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:naqel/features/splash/presentation/pages/splash_view.dart';

GoRouter goRouter = GoRouter(
  initialLocation: '/splash',
  debugLogDiagnostics: true, // remove in production
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SplashView(),
          transitionsBuilder: slideTransition,
        );
      },
    ),
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const OnboardingPage(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LoginView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/select-signup-type',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SelectSignupTypeView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/customer-signup',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const CustomerSignupView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/driver-signup',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const DriverSignupView(),
        transitionsBuilder: slideTransition,
      ),
    ),
  ],

  // ──────────────────────────── Error Page ───────────────────────────────────
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  ),
);
