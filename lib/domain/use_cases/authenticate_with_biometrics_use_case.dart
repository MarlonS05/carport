import 'package:carport/domain/services/device_biometric_authenticator.dart';

/// Prompts for device biometrics / passcode via [DeviceBiometricAuthenticator].
class AuthenticateWithBiometricsUseCase {
  const AuthenticateWithBiometricsUseCase({
    required DeviceBiometricAuthenticator authenticator,
  }) : _authenticator = authenticator;

  final DeviceBiometricAuthenticator _authenticator;

  Future<bool> call({required String reason}) {
    return _authenticator.authenticate(reason: reason);
  }
}
