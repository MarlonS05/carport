import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/repositories/mpg_entry_repository.dart';
import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/repositories/reminder_repository.dart';
import 'package:carport/domain/repositories/vehicle_attachment_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/vehicle_attachment_storage.dart';
import 'package:carport/domain/use_cases/attach_vehicle_file_use_case.dart';
import 'package:carport/domain/use_cases/connect_portal_use_case.dart';
import 'package:carport/domain/use_cases/reregister_portal_use_case.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/repositories/settings_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/services/reminder_notification_scheduler.dart';
import 'package:carport/domain/use_cases/authenticate_with_biometrics_use_case.dart';
import 'package:carport/domain/use_cases/create_or_update_reminder_use_case.dart';
import 'package:carport/domain/use_cases/create_or_update_service_item_use_case.dart';
import 'package:carport/domain/use_cases/create_or_update_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/delete_reminder_use_case.dart';
import 'package:carport/domain/use_cases/delete_service_item_use_case.dart';
import 'package:carport/domain/use_cases/delete_vehicle_attachment_use_case.dart';
import 'package:carport/domain/use_cases/delete_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/get_mobile_id_use_case.dart';
import 'package:carport/domain/use_cases/get_portal_base_url_use_case.dart';
import 'package:carport/domain/use_cases/get_garage_home_stats_use_case.dart';
import 'package:carport/domain/use_cases/set_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/get_color_theme_preset_use_case.dart';
import 'package:carport/router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class MockVehicleRepository extends Mock implements VehicleRepository {}

class MockVehicleAttachmentRepository extends Mock
    implements VehicleAttachmentRepository {}

class MockVehicleAttachmentStorage extends Mock
    implements VehicleAttachmentStorage {}

class MockServiceItemRepository extends Mock
    implements ServiceItemRepository {}

class MockMpgEntryRepository extends Mock implements MpgEntryRepository {}

class MockReminderRepository extends Mock implements ReminderRepository {}

class MockSettingsRepository extends Mock implements SettingsRepository {}

class MockReminderNotificationScheduler extends Mock
    implements ReminderNotificationScheduler {}

class MockAppRouter extends Mock implements AppRouter {}

class MockGetGarageHomeStatsUseCase extends Mock
    implements GetGarageHomeStatsUseCase {}

class MockCreateOrUpdateVehicleUseCase extends Mock
    implements CreateOrUpdateVehicleUseCase {}

class MockCreateOrUpdateServiceItemUseCase extends Mock
    implements CreateOrUpdateServiceItemUseCase {}

class MockCreateOrUpdateReminderUseCase extends Mock
    implements CreateOrUpdateReminderUseCase {}

class MockDeleteVehicleUseCase extends Mock implements DeleteVehicleUseCase {}

class MockAttachVehicleFileUseCase extends Mock
    implements AttachVehicleFileUseCase {}

class MockDeleteVehicleAttachmentUseCase extends Mock
    implements DeleteVehicleAttachmentUseCase {}

class MockDeleteServiceItemUseCase extends Mock
    implements DeleteServiceItemUseCase {}

class MockDeleteReminderUseCase extends Mock implements DeleteReminderUseCase {}

class MockGetDistanceUnitUseCase extends Mock
    implements GetDistanceUnitUseCase {}

class MockAuthenticateWithBiometricsUseCase extends Mock
    implements AuthenticateWithBiometricsUseCase {}

class MockGetColorThemePresetUseCase extends Mock
    implements GetColorThemePresetUseCase {}

class MockGetPortalBaseUrlUseCase extends Mock
    implements GetPortalBaseUrlUseCase {}

class MockGetMobileIdUseCase extends Mock implements GetMobileIdUseCase {}

class MockPortalConnectionRepository extends Mock
    implements PortalConnectionRepository {}

class MockPortalMonitorApi extends Mock implements PortalMonitorApi {}

class MockConnectPortalUseCase extends Mock implements ConnectPortalUseCase {}

class MockReregisterPortalUseCase extends Mock
    implements ReregisterPortalUseCase {}

class MockSetDistanceUnitUseCase extends Mock
    implements SetDistanceUnitUseCase {}

/// Stubs [AppRouter.push] so awaited navigation calls complete in BLoC tests.
/// `pop`, `go`, and `goHome` return void and need no stubbing.
void stubRouterPush(MockAppRouter router) {
  when(() => router.push<Object?>(any())).thenAnswer((_) async => null);
}

/// Registers fallback values for types used as `any()` matchers in mocktail.
/// Call once from `setUpAll` in tests that stub methods with entity arguments.
void registerCommonFallbacks() {
  registerFallbackValue(
    const Vehicle(
      id: '',
      name: '',
      description: '',
      maintenancePlanImage: null,
      documentsImage: null,
      userManualLink: null,
      maintenanceManualLink: null,
      mileage: 0,
    ),
  );
  registerFallbackValue(
    ServiceItem(
      id: '',
      vehicleId: '',
      title: '',
      description: '',
      date: DateTime.fromMillisecondsSinceEpoch(0),
      mileage: 0,
    ),
  );
  registerFallbackValue(
    Reminder(
      id: '',
      name: '',
      body: '',
      dueAt: DateTime.fromMillisecondsSinceEpoch(0),
    ),
  );
  registerFallbackValue(
    VehicleAttachment(
      id: '',
      vehicleId: '',
      displayName: '',
      filePath: '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(0),
    ),
  );
  registerFallbackValue(DistanceUnit.miles);
  registerFallbackValue(ColorThemePreset.legacy);
}
