/// Platform port for device biometric / passcode authentication.
abstract class DeviceBiometricAuthenticator {
  /// Whether the device can prompt for biometrics or device credentials.
  Future<bool> canAuthenticate();

  /// Prompts the user to authenticate. Returns `true` on success.
  ///
  /// Uses biometrics when available, with device PIN/passcode fallback.
  /// Returns `false` when the user cancels or authentication fails.
  Future<bool> authenticate({required String reason});
}
