import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/features/auth/data/models/user_model.dart';
import 'package:naqel/features/auth/presentation/bloc/application_status_state.dart';
import 'package:naqel/features/auth/presentation/bloc/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    // 2. Clean up memory immediately when screen is closed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email Field
          Text(
            'EMAIL OR PHONE NUMBER',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(letterSpacing: 0.6),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            onChanged: (value) => cubit.updateEmail(value),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person_outline,
                size: 20,
                color: Color(0xFF737688),
              ),
              hint: Text(
                'Enter your credentials',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  color: Color(0x80737688),
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF3F4F6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Password Field
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PASSWORD',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(letterSpacing: 0.6),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: _isObscure,
            controller: _passwordController,
            onChanged: (value) => cubit.updatePassword(value),
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
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline,
                size: 20,
                color: Color(0xFF737688),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: Color(0xFF737688),
                ),
                onPressed: () => setState(() {
                  _isObscure = !_isObscure;
                }),
              ),
              hint: Text(
                '••••••••',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  color: Color(0x80737688),
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF3F4F6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Login Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF003EC7), Theme.of(context).primaryColor],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  log("State: ${state.runtimeType}");
                  if (state is LoginSuccess) {
                    final targetRoute = state.user is CustomerModel
                        ? '/customer-home'
                        : ((state.user as DriverModel).applicationStatus ==
                                  ApplicationStatus.Activated
                              ? "/driver-dashboard"
                              : "/application-status");

                    context.go(targetRoute, extra: state.user);
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    final validation = _formKey.currentState?.validate();
                    if (validation ?? false) {
                      log("Started Login");
                      cubit.login();
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
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
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
                    backgroundColor: const Color(0xFF0047FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                    shadowColor: const Color(
                      0xFF0047FF,
                    ).withAlpha((0.4 * 255).floor()),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login to Dashboard',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
