import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const validator = PortalUrlValidator();

  test('apiBaseUrl appends /api to portal base URL', () {
    expect(
      validator.apiBaseUrl('https://monitor.example.com'),
      'https://monitor.example.com/api',
    );
  });

  test('apiBaseUrl preserves path on portal base URL', () {
    expect(
      validator.apiBaseUrl('https://monitor.example.com/carport'),
      'https://monitor.example.com/carport/api',
    );
  });
}
