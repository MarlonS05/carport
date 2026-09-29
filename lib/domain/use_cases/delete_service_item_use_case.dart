import '../repositories/service_item_repository.dart';

class DeleteServiceItemUseCase {
  DeleteServiceItemUseCase({
    required ServiceItemRepository serviceItemRepository,
  }) : _serviceItemRepository = serviceItemRepository;

  final ServiceItemRepository _serviceItemRepository;

  Future<void> call(String serviceItemId) async {
    await _serviceItemRepository.delete(serviceItemId);
  }
}
