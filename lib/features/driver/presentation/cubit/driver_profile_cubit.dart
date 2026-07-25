// lib/features/profile/presentation/cubit/driver_profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/driver/presentation/cubit/driver_profile_state.dart';

class DriverProfileCubit extends Cubit<DriverProfileState> {
  DriverProfileCubit() : super(DriverProfileInitial());

  void loadProfile() {
    emit(DriverProfileLoading());
    // Execute domain usecase here
    emit(DriverProfileSuccess());
  }
}
