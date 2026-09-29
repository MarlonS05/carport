import 'package:carport/domain/services/device_biometric_authenticator.dart';
import 'package:carport/logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

/// [DeviceBiometricAuthenticator] backed by `local_auth`.
class LocalDeviceBiometricAuthenticator
    implements DeviceBiometricAuthenticator {
  LocalDeviceBiometricAuthenticator({LocalAuthentication? localAuth})
      : _localAuth = localAuth ?? LocalAuthentication();

  final LocalAuthentication _localAuth;

  @override
  Future<bool> canAuthenticate() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isSupported = await _localAuth.isDeviceSupported();
      return canCheck || isSupported;
    } on PlatformException catch (e, st) {
      logger.e(
        'Failed to check biometric availability',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  @override
  Future<bool> authenticate({required String reason}) async {
    try {
      if (!await canAuthenticate()) {
        return false;
      }

      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e, st) {
      logger.e(
        'Biometric authentication failed',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }
}
