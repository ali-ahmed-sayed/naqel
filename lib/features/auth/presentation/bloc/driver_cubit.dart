import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naqel/features/auth/domain/usecases/driver_signup_usecase.dart';
import 'package:naqel/features/auth/domain/usecases/params/driver_signup_params.dart';

class DriverSignupState {
  final DriverSignupParams params;
  final bool agreeToTerms;

  const DriverSignupState({
    required this.params,
    this.agreeToTerms = false,
  });

  DriverSignupState copyWith({
    DriverSignupParams? params,
    bool? agreeToTerms,
  }) {
    return DriverSignupState(
      params: params ?? this.params,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
    );
  }
}

class DriverSignupCubit extends Cubit<DriverSignupState> {
  DriverSignupCubit({required this.signupUsecase})
      : super(
          DriverSignupState(
            params: DriverSignupParams(
              name: '',
              email: '',
              phone: '',
              password: '',
              driverImagePath: null,
              vehicleType: VehicleType.car,
              vehicleModel: '',
              plateNumber: '',
              frontPlateImagePath: null,
              backPlateImagePath: null,
              frontLicenseImagePath: null,
              backLicenseImagePath: null,
              frontIdImagePath: null,
              backIdImagePath: null,
            ),
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

  void updateVehicleType(VehicleType type) => emit(
        state.copyWith(params: state.params.copyWith(vehicleType: type)),
      );

  void updateVehicleModel(String model) => emit(
        state.copyWith(params: state.params.copyWith(vehicleModel: model)),
      );

  void updatePlateNumber(String plate) => emit(
        state.copyWith(params: state.params.copyWith(plateNumber: plate)),
      );

  void updateFrontPlateImage(XFile? path) => emit(
        state.copyWith(params: state.params.copyWith(frontPlateImagePath: path)),
      );

  void updateBackPlateImage(XFile? path) => emit(
        state.copyWith(params: state.params.copyWith(backPlateImagePath: path)),
      );

  void updateFrontLicenseImage(XFile? path) => emit(
        state.copyWith(
          params: state.params.copyWith(frontLicenseImagePath: path),
        ),
      );

  void updateBackLicenseImage(XFile? path) => emit(
        state.copyWith(
          params: state.params.copyWith(backLicenseImagePath: path),
        ),
      );

  void updateFrontIdImage(XFile? path) => emit(
        state.copyWith(params: state.params.copyWith(frontIdImagePath: path)),
      );

  void updateBackIdImage(XFile? path) => emit(
        state.copyWith(params: state.params.copyWith(backIdImagePath: path)),
      );

  void toggleAgreeToTerms() =>
      emit(state.copyWith(agreeToTerms: !state.agreeToTerms));

  void signUp() {
    log('Driver signup: ${state.params.email}');
    signupUsecase(state.params);
  }
}
