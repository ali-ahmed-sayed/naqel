import 'package:flutter/material.dart';

@immutable
class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  LoginParams copyWith({String? email, String? password}) {
    return LoginParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
