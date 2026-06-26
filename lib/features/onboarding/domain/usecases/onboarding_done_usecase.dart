import 'package:naqel/core/usecases/usecase.dart';
import '../repositories/onboarding_repository.dart';

class SetOnboardingDoneUseCase extends UseCase<void, NoParams> {
  SetOnboardingDoneUseCase(this._repository);

  final OnboardingRepository _repository;

  @override
  Future<void> call(NoParams noParams) => _repository.setOnboardingDone();
}
