import 'package:carport/domain/repositories/portal_connection_repository.dart';

class SetPortalBaseUrlUseCase {
  const SetPortalBaseUrlUseCase({
    required PortalConnectionRepository portalConnectionRepository,
  }) : _portalConnectionRepository = portalConnectionRepository;

  final PortalConnectionRepository _portalConnectionRepository;

  Future<void> call(String url) =>
      _portalConnectionRepository.setPortalBaseUrl(url);
}
