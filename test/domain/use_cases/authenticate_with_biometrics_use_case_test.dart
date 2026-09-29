import 'package:carport/domain/services/device_biometric_authenticator.dart';
import 'package:carport/domain/use_cases/authenticate_with_biometrics_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticator extends Mock implements DeviceBiometricAuthenticator {}

void main() {
  late _MockAuthenticator authenticator;
  late AuthenticateWithBiometricsUseCase useCase;

  setUp(() {
    authenticator = _MockAuthenticator();
    useCase = AuthenticateWithBiometricsUseCase(authenticator: authenticator);
  });

  test('forwards reason to the authenticator', () async {
    when(
      () => authenticator.authenticate(reason: any(named: 'reason')),
    ).thenAnswer((_) async => true);

    final result = await useCase(reason: 'Unlock documents');

    expect(result, isTrue);
    verify(
      () => authenticator.authenticate(reason: 'Unlock documents'),
    ).called(1);
  });

  test('returns false when authentication fails', () async {
    when(
      () => authenticator.authenticate(reason: any(named: 'reason')),
    ).thenAnswer((_) async => false);

    final result = await useCase(reason: 'Unlock documents');

    expect(result, isFalse);
  });
}
