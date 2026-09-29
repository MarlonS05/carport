import 'package:carport/domain/use_cases/verify_portal_sync_use_case.dart';

class VerifyPortalSyncOnAppStartUseCase {
  const VerifyPortalSyncOnAppStartUseCase({
    required VerifyPortalSyncUseCase verifyPortalSyncUseCase,
  }) : _verifyPortalSyncUseCase = verifyPortalSyncUseCase;

  final VerifyPortalSyncUseCase _verifyPortalSyncUseCase;

  Future<void> call() async {
    await _verifyPortalSyncUseCase();
  }
}
