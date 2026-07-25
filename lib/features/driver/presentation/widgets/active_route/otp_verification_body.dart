import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_cubit.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_state.dart';
import 'package:naqel/features/driver/presentation/widgets/active_route/otp_keypad.dart';

class OtpVerificationBody extends StatelessWidget {
  final ActiveRouteState state;
  const OtpVerificationBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActiveRouteCubit>();

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [SwiftShipTheme.primaryBlue, Color(0xFF0037B3)],
                ),
                borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
              ),
              child: Column(
                children: [
                  const Text(
                    'SECURITY VERIFICATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ask the recipient for the 4-digit OTP to complete the delivery.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(state.otpLength, (index) {
                      final filled = index < state.otpInput.length;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 48,
                        height: 48,
                        alignment: .center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(filled ? 0.35 : 0.15),
                          borderRadius: BorderRadius.circular(
                            SwiftShipTheme.radiusSm,
                          ),
                          border: state.otpError
                              ? Border.all(
                                  color: SwiftShipTheme.errorRed,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Text(
                          state.otpInput.length <= index
                              ? ""
                              : state.otpInput[index],
                          style: SwiftShipTheme
                              .lightTheme
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      );
                    }),
                  ),
                  if (state.otpError) ...[
                    const SizedBox(height: 12),
                    const Text(
                      'Incorrect code, try again.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  const SizedBox(height: 28),
                  OtpKeypad(cubit: cubit),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: state.otpComplete && !state.isSubmittingOtp
                      ? cubit.submitOtp
                      : null,
                  child: state.isSubmittingOtp
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, size: 20),
                            SizedBox(width: 8),
                            Text('Accept'),
                          ],
                        ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: cubit.reportOtpTrouble,
                  child: const Text(
                    'Having trouble with OTP?',
                    style: TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
