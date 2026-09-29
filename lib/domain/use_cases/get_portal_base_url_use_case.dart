import 'package:carport/domain/repositories/portal_connection_repository.dart';

class GetPortalBaseUrlUseCase {
  const GetPortalBaseUrlUseCase({
    required PortalConnectionRepository portalConnectionRepository,
  }) : _portalConnectionRepository = portalConnectionRepository;

  final PortalConnectionRepository _portalConnectionRepository;

  Future<String?> call() => _portalConnectionRepository.getPortalBaseUrl();
}
