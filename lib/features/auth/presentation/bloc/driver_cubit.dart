import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';
import 'package:naqel/features/auth/domain/usecases/driver_signup_usecase.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';

enum DriverSignupStatus { initial, loading, success, failure }

class DriverSignupState {
  final DriverSignupStatus status;
  final DriverSignupParams params;
  final UserEntity? user; // 👈 ضيف دا هنا
  final String? errorMessage;

  DriverSignupState({
    required this.status,
    required this.params,
    this.user,
    this.errorMessage,
  });

  DriverSignupState copyWith({
    DriverSignupStatus? status,
    DriverSignupParams? params,
    UserEntity? user,
    String? errorMessage,
  }) {
    return DriverSignupState(
      status: status ?? this.status,
      params: params ?? this.params,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class DriverSignupCubit extends Cubit<DriverSignupState> {
  DriverSignupCubit({required this.signupUsecase})
    : super(
        DriverSignupState(
          status: DriverSignupStatus.initial,
          params: DriverSignupParams.initial(),
        ),
      );

  final DriverSignupUsecase signupUsecase;

  void updateName(String name) =>
      emit(state.copyWith(params: state.params.copyWith(name: name)));

  void updateEmail(String email) =>
      emit(state.copyWith(params: state.params.copyWith(email: email)));

  void updatePhone(String phone) =>
      emit(state.copyWith(params: state.params.copyWith(phone: phone)));

  void updatePassword(String password) =>
      emit(state.copyWith(params: state.params.copyWith(password: password)));

  void updateDriverImage(XFile? path) => emit(
    state.copyWith(params: state.params.copyWith(driverImagePath: path)),
  );

  void updateVehicleType(VehicleType type) =>
      emit(state.copyWith(params: state.params.copyWith(vehicleType: type)));

  void updateVehicleModel(String model) =>
      emit(state.copyWith(params: state.params.copyWith(vehicleModel: model)));

  void updatePlateNumber(String plate) =>
      emit(state.copyWith(params: state.params.copyWith(plateNumber: plate)));

  void updateFrontPlateImage(XFile? path) => emit(
    state.copyWith(params: state.params.copyWith(frontPlateImagePath: path)),
  );

  void updateBackPlateImage(XFile? path) => emit(
    state.copyWith(params: state.params.copyWith(backPlateImagePath: path)),
  );

  void updateFrontLicenseImage(XFile? path) => emit(
    state.copyWith(params: state.params.copyWith(frontLicenseImagePath: path)),
  );

  void updateBackLicenseImage(XFile? path) => emit(
    state.copyWith(params: state.params.copyWith(backLicenseImagePath: path)),
  );

  void updateFrontIdImage(XFile? path) => emit(
    state.copyWith(params: state.params.copyWith(frontIdImagePath: path)),
  );

  void updateBackIdImage(XFile? path) => emit(
    state.copyWith(params: state.params.copyWith(backIdImagePath: path)),
  );

  void toggleAgreeToTerms() => emit(
    state.copyWith(
      params: state.params.copyWith(agreeToTerms: !state.params.agreeToTerms),
    ),
  );

  Future<void> signUp() async {
    log('Driver signup: ${state.params.email}');
    emit(state.copyWith(status: DriverSignupStatus.loading));

    final result = await signupUsecase(state.params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DriverSignupStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (user) {
        emit(state.copyWith(status: DriverSignupStatus.success, user: user));
      },
    );
  }
}
