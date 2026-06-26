import 'package:get_it/get_it.dart';
import 'package:naqel/core/di/core_injector.dart';
import 'package:naqel/features/auth/di/auth_injectors.dart';
import 'package:naqel/features/onboarding/di/onboarding_injector.dart';
import 'package:naqel/features/splash/di/splash_injector.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await setupCoreInjector();
  setupOnboardingInjector();
  setupSplashInjector();
  initAuthDependencies();
}
