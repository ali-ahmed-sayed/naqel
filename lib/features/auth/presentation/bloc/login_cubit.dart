import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/auth/domain/usecases/login_usecase.dart';
import 'package:naqel/features/auth/domain/usecases/params/login_params.dart';

class LoginState {
  final LoginParams loginParams;

  LoginState(this.loginParams);

  LoginState copyWith({LoginParams? loginParams}) {
    return LoginState(loginParams ?? this.loginParams);
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUsecase})
    : super(LoginState(LoginParams(email: '', password: '')));

  LoginUsecase loginUsecase;

  void updateEmail(String email) {
    emit(state.copyWith(loginParams: state.loginParams.copyWith(email: email)));
  }

  void updatePassword(String password) {
    emit(
      state.copyWith(
        loginParams: state.loginParams.copyWith(password: password),
      ),
    );
  }

  void login() {
    loginUsecase(state.loginParams);
  }
}
