import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/features/auth/presentation/widgets/select_signup_type_widgets/select_signup_type_body.dart';
import 'package:naqel/features/auth/presentation/widgets/select_signup_type_widgets/select_signup_type_footer.dart';
import 'package:naqel/features/auth/presentation/widgets/select_signup_type_widgets/select_signup_type_title.dart';
import 'package:naqel/features/auth/presentation/widgets/signup_header_widget.dart';

class SelectSignupTypeViewBody extends StatefulWidget {
  const SelectSignupTypeViewBody({super.key});

  @override
  State<SelectSignupTypeViewBody> createState() =>
      _SelectSignupTypeViewBodyState();
}

class _SelectSignupTypeViewBodyState extends State<SelectSignupTypeViewBody> {
  // Simple UI state tracking for selection
  String _selectedType = 'customer';
  void customerCallback() => setState(() => _selectedType = 'customer');
  void driverCallback() => setState(() => _selectedType = 'driver');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Screen Header
          SignupHeaderWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            child: Column(
              children: [
                // Title Block
                SelectSignupTypeTitle(),
                SelectSignupTypeBody(
                  selectedType: _selectedType,
                  customerCallback: customerCallback,
                  driverCallback: driverCallback,
                ),
                // Signup Forms Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedType == 'customer') {
                        // Navigate to customer signup page
                        context.push('/customer-signup');
                      } else if (_selectedType == 'driver') {
                        // Navigate to driver signup page
                        context.push('/driver-signup');
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
                          'Continue',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Legal/Terms Text Link
                SelectSignupTypeFooter(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
