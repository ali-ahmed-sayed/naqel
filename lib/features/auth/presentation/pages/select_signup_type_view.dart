import 'package:flutter/material.dart';
import 'package:naqel/features/auth/presentation/widgets/select_signup_type_view_body.dart';

class SelectSignupTypeView extends StatelessWidget {
  const SelectSignupTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      body: SafeArea(child: SelectSignupTypeViewBody()),
    );
  }
}
