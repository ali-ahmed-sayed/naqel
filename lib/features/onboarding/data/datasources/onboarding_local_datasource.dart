import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> getOnboardingStatus();
  Future<void> setOnboardingDone();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  static const _kOnboardingDoneKey = 'onboarding_done';

  @override
  Future<bool> getOnboardingStatus() async {
    return _prefs.getBool(_kOnboardingDoneKey) ?? false;
  }

  @override
  Future<void> setOnboardingDone() async {
    await _prefs.setBool(_kOnboardingDoneKey, true);
  }
}