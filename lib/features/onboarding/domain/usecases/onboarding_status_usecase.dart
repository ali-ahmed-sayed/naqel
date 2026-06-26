import 'package:naqel/core/usecases/usecase.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingStatusUseCase extends UseCase<bool, NoParams> {
  GetOnboardingStatusUseCase(this._repository);

  final OnboardingRepository _repository;

  @override
  Future<bool> call(NoParams noParams) => _repository.getOnboardingStatus();
}
