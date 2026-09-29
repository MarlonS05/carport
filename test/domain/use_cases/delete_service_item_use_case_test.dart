import 'package:carport/domain/use_cases/delete_service_item_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  test('delegates deletion to the service item repository', () async {
    final repository = MockServiceItemRepository();
    when(() => repository.delete(any())).thenAnswer((_) async {});
    final useCase = DeleteServiceItemUseCase(serviceItemRepository: repository);

    await useCase('s1');

    verify(() => repository.delete('s1')).called(1);
  });
}
