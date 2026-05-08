import 'package:naqel/src/features/auth/auth.dart';
import 'package:naqel/src/core/core.dart';

void main() async {
  // 1. Initialize core services (Firebase, etc.)
  // Note: This requires a valid firebase setup to work on a real device/emulator
  // For pure logic testing, use the Unit Tests (flutter test).
  print('🚀 Starting Naqel Backend Test Runner...');

  // 2. Initialize Repositories
  final authRepository = AuthRepositoryImpl();

  // 3. Instantiate Use Cases
  final loginUseCase = LoginUseCase(authRepository);
  final signUpUseCase = SignUpUseCase(authRepository);

  print('\n--- Testing Sign Up ---');
  final signUpResult = await signUpUseCase(
    SignUpParams(
      name: 'Omar Ahmed',
      email: 'omar@example.com',
      password: 'password123',
    ),
  );

  signUpResult.fold(
    (failure) => print('❌ Sign Up Failed: ${failure.message}'),
    (user) => print('✅ Sign Up Success! User ID: ${user.id}'),
  );

  print('\n--- Testing Login ---');
  final loginResult = await loginUseCase(
    LoginParams(email: 'omar@example.com', password: 'password123'),
  );

  loginResult.fold(
    (failure) => print('❌ Login Failed: ${failure.message}'),
    (user) => print('✅ Login Success! Welcome, ${user.name}'),
  );

  print('\n🏁 Testing completed.');
}
