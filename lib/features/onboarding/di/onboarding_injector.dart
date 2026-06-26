import 'package:naqel/injection_container.dart';
import 'package:naqel/features/onboarding/domain/usecases/onboarding_done_usecase.dart';
import 'package:naqel/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:naqel/features/onboarding/domain/usecases/onboarding_status_usecase.dart';
import 'package:naqel/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:naqel/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupOnboardingInjector() {
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl<OnboardingLocalDataSource>()),
  );
  sl.registerLazySingleton(
    () => GetOnboardingStatusUseCase(sl<OnboardingRepository>()),
  );
  sl.registerLazySingleton(
    () => SetOnboardingDoneUseCase(sl<OnboardingRepository>()),
  );
}
