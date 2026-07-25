import 'package:flutter/material.dart';
import 'package:naqel/features/driver/presentation/cubit/active_route_cubit.dart';
import 'package:naqel/features/driver/presentation/widgets/active_route/keypad_button.dart';

class OtpKeypad extends StatelessWidget {
  final ActiveRouteCubit cubit;
  const OtpKeypad({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    const rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];

    return Column(
      children: [
        for (final row in rows)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: row
                  .map(
                    (digit) => KeypadButton(
                      label: digit,
                      onTap: () => cubit.enterOtpDigit(digit),
                    ),
                  )
                  .toList(),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeypadButton(onTap: () {}),
            KeypadButton(label: '0', onTap: () => cubit.enterOtpDigit('0')),
            KeypadButton(
              icon: Icons.backspace_outlined,
              onTap: cubit.deleteOtpDigit,
            ),
          ],
        ),
      ],
    );
  }
}
