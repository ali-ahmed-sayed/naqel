import 'package:flutter/material.dart';

@immutable
class CustomerSignupParams {
  final String name;
  final String email;
  final String phone;
  final String password;

  const CustomerSignupParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  CustomerSignupParams copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) {
    return CustomerSignupParams(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}
