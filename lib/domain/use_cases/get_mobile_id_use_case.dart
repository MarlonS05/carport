import 'package:carport/domain/repositories/portal_connection_repository.dart';

class GetMobileIdUseCase {
  const GetMobileIdUseCase({
    required PortalConnectionRepository portalConnectionRepository,
  }) : _portalConnectionRepository = portalConnectionRepository;

  final PortalConnectionRepository _portalConnectionRepository;

  Future<String?> call() => _portalConnectionRepository.getMobileId();
}
