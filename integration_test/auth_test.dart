import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:naqel/src/core/core.dart';
import 'package:naqel/src/features/auth/auth.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Firebase Auth Integration Test', () {
    testWidgets('Should successfully sign up a real user in Firebase', (
      WidgetTester tester,
    ) async {
      // 1. Initialize Firebase
      await AppConfig.init();

      // 2. Setup Repository and UseCase
      final authRepository = AuthRepositoryImpl();
      final signUpUseCase = SignUpUseCase(authRepository);

      // 3. Generate a random email to ensure uniqueness
      final randomNum = Random().nextInt(10000);
      final testEmail = 'testuser$randomNum@example.com';
      final testPassword = 'Password123!';

      print('📝 Attempting sign up with: $testEmail');

      // 4. Execute Sign Up
      final result = await signUpUseCase(
        SignUpParams(
          name: 'Integration Test User',
          email: testEmail,
          password: testPassword,
        ),
      );

      // 5. Verify Result
      result.fold(
        (failure) {
          print('❌ Integration Test Failed: ${failure.message}');
          fail('Sign up failed: ${failure.message}');
        },
        (user) {
          print('✅ Integration Test Success! Created user: ${user.id}');
          expect(user.email, equals(testEmail));
          expect(user.id, isNotEmpty);
        },
      );

      // 6. Cleanup: Sign out
      await authRepository.logout();
      print('👋 Signed out successfully.');
    });
  });
}
