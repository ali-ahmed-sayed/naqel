import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/features/auth/presentation/bloc/customer_cubit.dart';

class CustomerSignupForm extends StatefulWidget {
  const CustomerSignupForm({super.key});

  @override
  State<CustomerSignupForm> createState() => _CustomerSignupFormState();
}

class _CustomerSignupFormState extends State<CustomerSignupForm> {
  final _formKey = GlobalKey<FormState>();

  // Explicit UI Controllers matching your layer requirements
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isObscured = true;

  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Label structural style helper mapping directly from your typography tokens
    final labelStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: const Color(0xFF1C1F1B),
      fontSize: 14,
    );
    final cubit = context.read<CustomerSignupCubit>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full Name Input
          Text('Full Name', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameController,
            onChanged: (value) => cubit.updateName(value),
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(hintText: 'Johnathan Doe'),
          ),
          const SizedBox(height: 20),

          // Email Input
          Text('Email Address', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            onChanged: (value) => cubit.updateEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'john@swiftship.com'),
          ),
          const SizedBox(height: 20),

          // Phone Number Input
          Text('Phone Number', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            controller: _phoneController,
            onChanged: (value) => cubit.updatePhoneNumber(value),
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: '+1 (555) 000-0000'),
          ),
          const SizedBox(height: 20),

          // Password Input
          Text('Password', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            onChanged: (value) => cubit.updatePassword(value),
            obscureText: !_isObscured,
            decoration: InputDecoration(
              hintText: '••••••••',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: Color(0xFF737688),
                ),
                onPressed: () => setState(() {
                  _isObscured = !_isObscured;
                }),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
                return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Confirm Password Input
          Text('Confirm Password', style: labelStyle),
          const SizedBox(height: 8),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_isObscured,
            decoration: InputDecoration(
              hintText: '••••••••',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: Color(0xFF737688),
                ),
                onPressed: () => setState(() {
                  _isObscured = !_isObscured;
                }),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Terms and Privacy Checklist Link
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _agreeToTerms,
                  fillColor: WidgetStateProperty.fromMap(
                    <WidgetStatesConstraint, Color?>{
                      WidgetState.selected: Theme.of(context).primaryColor,
                      WidgetState.any: const Color(0xFFEBE7E7),
                    },
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: const BorderSide(width: 0, color: Colors.transparent),
                  onChanged: (val) => setState(() => _agreeToTerms = val!),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Wrap(
                  children: [
                    Text(
                      'I agree to the ',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF434656),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Terms of Service ',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'and ',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF434656),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Privacy Policy',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text('.', style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Form Execution Submit Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                if ((_formKey.currentState?.validate() ?? false) &&
                    _agreeToTerms) {
                  // Bind layout state values straight to your respective Cubit here
                  cubit.signUp();
                  context.go('/customer-home');
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        constraints: BoxConstraints(
                          maxWidth: 300,
                          maxHeight: 200,
                        ),
                        child: AlertDialog(
                          insetPadding: EdgeInsets.all(4.0),
                          title: Text('Invalid Input'),
                          content: Wrap(
                            children: [
                              Text('Please fill in all fields correctly.'),
                            ],
                          ),
                          actionsAlignment: .center,
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.error,
                                ),
                              ),
                              onPressed: () {
                                context.pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  log('validation failed');
                }
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Theme.of(
                  context,
                ).primaryColor.withAlpha((0.4 * 255).floor()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Routing Switch Footer Link Action
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xFF434656),
                ),
              ),
              GestureDetector(
                onTap: () => context.go('/login'),
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
