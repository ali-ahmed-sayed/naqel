import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/usecases/usecase.dart';
import 'package:naqel/features/onboarding/domain/usecases/onboarding_status_usecase.dart';
import 'package:naqel/features/splash/presentation/Cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.getOnboardingStatus})
    : super(
        SplashState(
          progress: 0,
          hasInternet: false,
          onboardingStatus: false,
          isDone: false,
          isLoading: false,
        ),
      );

  final GetOnboardingStatusUseCase getOnboardingStatus;

  Future<bool> checkDeviceConnection() async {
    final result = await Connectivity().checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  void load() {
    setIsLoading(true);
    getOnboardingStatus(NoParams()).then((onboardingStatus) {
      emit(state.copywith(onboardingStatus: onboardingStatus));
      checkDeviceConnection().then((hasInternet) {
        setHasInternet(hasInternet);
      });
    });
  }

  Future<void> startLoadingLogic() async {
    double progress = 0;
    for (int i = 0; i < 100; i++) {
      if (!state.isLoading) break;
      await Future.delayed(Duration(milliseconds: 10));
      progress = i * 0.01;
      emit(state.copywith(progress: progress));
      if (i >= 99) {
        emit(state.copywith(progress: 1.0, isLoading: false, isDone: true));
      }
    }
  }

  void setHasInternet(bool hasInternet) {
    if (hasInternet != state.hasInternet) {
      emit(
        state.copywith(
          isLoading: hasInternet ? true : false,
          hasInternet: hasInternet,
          isDone: hasInternet ? false : true,
        ),
      ); // Not Done if it has internet, Done if it doesn't
    }
  }

  Future<void> setIsLoading(bool isLoading) async {
    if (!state.isLoading || !state.isDone) {
      emit(state.copywith(isLoading: isLoading));
      await startLoadingLogic();
    }
  }
}
