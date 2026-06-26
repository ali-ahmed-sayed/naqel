class SplashState {
  final double progress;
  final bool hasInternet;
  final bool onboardingStatus;
  final bool isDone;
  final bool isLoading;

  SplashState({
    required this.progress,
    required this.hasInternet,
    required this.onboardingStatus,
    required this.isDone,
    required this.isLoading,
  });

  SplashState copywith({
    double? progress,
    bool? hasInternet,
    bool? onboardingStatus,
    bool? isDone,
    bool? isLoading,
  }) => SplashState(
    progress: progress ?? this.progress,
    hasInternet: hasInternet ?? this.hasInternet,
    onboardingStatus: onboardingStatus ?? this.onboardingStatus,
    isDone: isDone ?? this.isDone,
    isLoading: isLoading ?? this.isLoading,
  );
}
