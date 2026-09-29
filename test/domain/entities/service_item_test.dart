import 'package:carport/domain/entities/service_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServiceItem', () {
    test('empty() has blank fields, zero mileage, epoch UTC date', () {
      final item = ServiceItem.empty();
      expect(item.id, '');
      expect(item.vehicleId, '');
      expect(item.title, '');
      expect(item.description, '');
      expect(item.mileage, 0);
      expect(item.date, DateTime.fromMillisecondsSinceEpoch(0, isUtc: true));
    });
  });
}
