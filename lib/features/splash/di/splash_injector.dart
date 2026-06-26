import 'package:naqel/features/onboarding/domain/usecases/onboarding_status_usecase.dart';
import 'package:naqel/features/splash/presentation/Cubit/splash_cubit.dart';
import 'package:naqel/injection_container.dart';

void setupSplashInjector() {
  sl.registerFactory(
    () => SplashCubit(getOnboardingStatus: sl<GetOnboardingStatusUseCase>()),
  );
}