import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naqel/src/features/auth/auth.dart';
import 'package:naqel/src/core/core.dart';

// ── Mocks ────────────────────────────────────────────────────────────────────
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late LoginUseCase loginUseCase;
  late SignUpUseCase signUpUseCase;

  setUp(() {
    mockRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockRepository);
    signUpUseCase = SignUpUseCase(mockRepository);
  });

  const tUser = AppUser(
    id: '123',
    email: 'test@example.com',
    name: 'Test User',
  );

  group('Auth UseCases Tests', () {
    test(
      'LoginUseCase should return AppUser when login is successful',
      () async {
        // Arrange
        when(
          () => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => right(tUser));

        // Act
        final result = await loginUseCase(
          LoginParams(email: 'test@example.com', password: 'password123'),
        );

        // Assert
        expect(result, equals(right(tUser)));
        verify(
          () => mockRepository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).called(1);
      },
    );

    test(
      'SignUpUseCase should return AppUser when signup is successful',
      () async {
        // Arrange
        when(
          () => mockRepository.signUp(
            name: any(named: 'name'),
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => right(tUser));

        // Act
        final result = await signUpUseCase(
          SignUpParams(
            name: 'Test User',
            email: 'test@example.com',
            password: 'password123',
          ),
        );

        // Assert
        expect(result, equals(right(tUser)));
        verify(
          () => mockRepository.signUp(
            name: 'Test User',
            email: 'test@example.com',
            password: 'password123',
          ),
        ).called(1);
      },
    );

    test('LoginUseCase should return Failure when login fails', () async {
      // Arrange
      const tFailure = ServerFailure('Invalid credentials');
      when(
        () => mockRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => left(tFailure));

      // Act
      final result = await loginUseCase(
        LoginParams(email: 'wrong@example.com', password: 'wrong_password'),
      );

      // Assert
      expect(result, equals(left(tFailure)));
    });
  });
}
