import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/auth/domain/usecases/customer_signup_usecase.dart';
import 'package:naqel/features/auth/domain/usecases/params/customer_signup_params.dart';

class CustomerSignupState {
  final CustomerSignupParams customerSignupParams;
  final bool agreeToTerms;

  CustomerSignupState({
    required this.customerSignupParams,
    required this.agreeToTerms,
  });

  CustomerSignupState copyWith({
    CustomerSignupParams? customerSignupParams,
    bool? agreeToTerms,
  }) {
    return CustomerSignupState(
      customerSignupParams: customerSignupParams ?? this.customerSignupParams,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
    );
  }
}

class CustomerSignupCubit extends Cubit<CustomerSignupState> {
  final CustomerSignupUsecase signupUsecase;

  CustomerSignupCubit({required this.signupUsecase})
    : super(
        CustomerSignupState(
          customerSignupParams: CustomerSignupParams(
            name: '',
            email: '',
            phone: '',
            password: '',
          ),
          agreeToTerms: false,
        ),
      );

  void toggleAgreeToTerms() {
    emit(state.copyWith(agreeToTerms: !state.agreeToTerms));
  }

  void updateName(String name) {
    emit(
      state.copyWith(
        customerSignupParams: state.customerSignupParams.copyWith(name: name),
      ),
    );
  }

  void updateEmail(String email) {
    emit(
      state.copyWith(
        customerSignupParams: state.customerSignupParams.copyWith(email: email),
      ),
    );
  }

  void updatePhoneNumber(String phone) {
    emit(
      state.copyWith(
        customerSignupParams: state.customerSignupParams.copyWith(phone: phone),
      ),
    );
  }

  void updatePassword(String password) {
    emit(
      state.copyWith(
        customerSignupParams: state.customerSignupParams.copyWith(
          password: password,
        ),
      ),
    );
  }

  void signUp() {
    log(
      'Signing up with params: ${state.customerSignupParams.email}, ${state.customerSignupParams.phone}, ${state.customerSignupParams.password}, ${state.customerSignupParams.name}',
    );
    signupUsecase(state.customerSignupParams);
  }
}
