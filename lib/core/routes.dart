import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/utils/screen_transitions.dart';
import 'package:naqel/features/auth/data/models/user_model.dart';
import 'package:naqel/features/auth/presentation/pages/application_status_view.dart';
import 'package:naqel/features/driver/presentation/views/active_route_view.dart';
import 'package:naqel/features/driver/presentation/views/driver_dashboard_view.dart';
import 'package:naqel/features/driver/presentation/views/driver_wallet_view.dart';
import 'package:naqel/features/driver/presentation/views/driver_profile_view.dart';
import 'package:naqel/features/splash/presentation/pages/splash_view.dart';
import 'package:naqel/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:naqel/features/auth/presentation/pages/customer_signup_view.dart';
import 'package:naqel/features/auth/presentation/pages/driver_signup_view.dart';
import 'package:naqel/features/auth/presentation/pages/application_review_view.dart';
import 'package:naqel/features/auth/presentation/pages/login_view.dart';
import 'package:naqel/features/auth/presentation/pages/select_signup_type_view.dart';
import 'package:naqel/features/customer/presentation/pages/create_delivery_view.dart';
import 'package:naqel/features/customer/presentation/pages/customer_home_view.dart';
import 'package:naqel/features/customer/presentation/pages/live_tracking_view.dart';
import 'package:naqel/features/customer/presentation/pages/settings_view.dart';
import 'package:naqel/features/customer/presentation/pages/order_history_view.dart';
import 'package:naqel/features/customer/presentation/pages/profile_view.dart';
import 'package:naqel/features/driver/presentation/views/payment_method_view.dart';
import 'package:naqel/features/driver/presentation/views/payment_status_view.dart';
import 'package:naqel/features/driver/presentation/views/recharge_amount_view.dart';

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
    GoRoute(
      path: '/application-review',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ApplicationReviewView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/application-status',
      builder: (context, state) {
        final status = (state.extra as DriverModel?)?.applicationStatus;
        return ApplicationStatusView(applicationStatus: status);
      },
    ),
    GoRoute(
      path: '/customer-home',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const CustomerHomeView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/order-history',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const OrderHistoryView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/create-delivery',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const CreateDeliveryView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/live-tracking',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LiveTrackingView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/profile-driver',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const DriverProfileView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/profile-customer',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ProfileView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SettingsView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/active-route',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ActiveRouteScreen(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/driver-dashboard',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const DriverDashboardView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/driver-wallet',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const DriverWalletView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/recharge-amount',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const RechargeAmountView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/payment-method',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PaymentMethodView(),
        transitionsBuilder: slideTransition,
      ),
    ),
    GoRoute(
      path: '/payment-status',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PaymentStatusView(),
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
