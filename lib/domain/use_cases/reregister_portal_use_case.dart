import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/use_cases/connect_portal_use_case.dart';
import 'package:carport/logger/logger.dart';

class ReregisterPortalUseCase {
  const ReregisterPortalUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required ConnectPortalUseCase connectPortalUseCase,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _connectPortalUseCase = connectPortalUseCase;

  final PortalConnectionRepository _portalConnectionRepository;
  final ConnectPortalUseCase _connectPortalUseCase;

  Future<void> call({void Function()? onSyncStarting}) async {
    final url = await _portalConnectionRepository.getPortalBaseUrl();
    if (url == null) {
      logSkipped('Portal re-registration skipped: no portal URL stored');
      return;
    }
    await _connectPortalUseCase(
      url,
      forceReregister: true,
      onSyncStarting: onSyncStarting,
    );
  }
}
