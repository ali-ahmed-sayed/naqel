import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/auth/domain/usecases/login_usecase.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';
import 'package:naqel/features/auth/domain/entities/user_entity.dart';

sealed class LoginState {
  final LoginParams params;
  LoginState(this.params);
}

class LoginInitial extends LoginState {
  LoginInitial(super.params);
}

class LoginLoading extends LoginState {
  LoginLoading(super.params);
}

class LoginSuccess extends LoginState {
  final UserEntity user;
  LoginSuccess(super.params, this.user);
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(super.params, this.message);
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUsecase})
    : super(LoginInitial(LoginParams(email: '', password: '')));

  final LoginUsecase loginUsecase;

  void updateEmail(String email) {
    emit(LoginInitial(state.params.copyWith(email: email)));
  }

  void updatePassword(String password) {
    emit(LoginInitial(state.params.copyWith(password: password)));
  }

  void login() async {
    final currentParams = state.params;
    emit(LoginLoading(currentParams));
    final result = await loginUsecase(currentParams);
    log("Result: ${result}");
    result.fold(
      (failure) => emit(LoginFailure(currentParams, failure.message)),
      (user) => emit(LoginSuccess(currentParams, user)),
    );
  }
}
