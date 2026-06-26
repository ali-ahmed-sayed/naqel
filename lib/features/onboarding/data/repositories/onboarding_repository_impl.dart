import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(this._localDataSource);

  final OnboardingLocalDataSource _localDataSource;

  @override
  Future<bool> getOnboardingStatus() => _localDataSource.getOnboardingStatus();

  @override
  Future<void> setOnboardingDone() => _localDataSource.setOnboardingDone();
}
