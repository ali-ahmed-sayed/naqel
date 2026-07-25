import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/driver_signup_navigation_bar.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/driver_signup_progress_header.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/steps/identity_verification_step.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/steps/personal_info_step.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/steps/review_application_step.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/steps/vehicle_images_step.dart';
import 'package:naqel/features/auth/presentation/widgets/driver_signup/steps/vehicle_info_step.dart';

class DriverSignupViewBody extends StatefulWidget {
  const DriverSignupViewBody({super.key});

  @override
  State<DriverSignupViewBody> createState() => _DriverSignupViewBodyState();
}

class _DriverSignupViewBodyState extends State<DriverSignupViewBody> {
  static const _totalSteps = 5;

  final PageController _pageController = PageController();
  int _currentStep = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToStep(int step) {
    setState(() => _currentStep = step);
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onBack() {
    if (_currentStep == 0) {
      context.pop();
      return;
    }
    _goToStep(_currentStep - 1);
  }

  void _onContinue() {
    if (_currentStep == _totalSteps - 1) {
      final cubit = context.read<DriverSignupCubit>();
      if (cubit.state.params.agreeToTerms &&
          cubit.state.params.name.isNotEmpty &&
          cubit.state.params.email.isNotEmpty &&
          cubit.state.params.phone.isNotEmpty &&
          cubit.state.params.password.isNotEmpty &&
          cubit.state.params.vehicleModel.isNotEmpty &&
          cubit.state.params.plateNumber.isNotEmpty &&
          cubit.state.params.driverImagePath != null &&
          cubit.state.params.frontPlateImagePath != null &&
          cubit.state.params.backPlateImagePath != null &&
          cubit.state.params.frontLicenseImagePath != null &&
          cubit.state.params.backLicenseImagePath != null &&
          cubit.state.params.frontIdImagePath != null &&
          cubit.state.params.backIdImagePath != null) {
        cubit.signUp();
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Invalid Input'),
            content: Text('Please fill in all fields correctly.'),
            actions: [
              ElevatedButton(
                onPressed: () => context.pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
      return;
    }
    _goToStep(_currentStep + 1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DriverSignupCubit, DriverSignupState>(
      listener: (context, state) {
        if (state.status == DriverSignupStatus.success) {
          context.go('/application-status', extra: state.user);
        } else if (state.status == DriverSignupStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Signup failed')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: SwiftShipTheme.primaryBlue,
            ),
            onPressed: _onBack,
          ),
          centerTitle: true,
          title: Text(
            'Driver Registration',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 18,
              color: const Color(0xFF1C1B1B),
            ),
          ),
        ),
        body: Column(
          children: [
            DriverSignupProgressHeader(currentStep: _currentStep),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentStep = index),
                children: [
                  const PersonalInfoStep(),
                  const VehicleInfoStep(),
                  const VehicleImagesStep(),
                  const IdentityVerificationStep(),
                  ReviewApplicationStep(onEditStep: _goToStep),
                ],
              ),
            ),
            BlocBuilder<DriverSignupCubit, DriverSignupState>(
              buildWhen: (prev, curr) =>
                  prev.params.agreeToTerms != curr.params.agreeToTerms,
              builder: (context, state) {
                final isLastStep = _currentStep == _totalSteps - 1;
                return DriverSignupNavigationBar(
                  onBack: _onBack,
                  onContinue: _onContinue,
                  isLastStep: isLastStep,
                  isContinueEnabled: !isLastStep || state.params.agreeToTerms,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
