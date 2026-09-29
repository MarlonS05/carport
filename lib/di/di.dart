import 'package:carport/db/database_helper.dart';
import 'package:carport/domain/repositories/mpg_entry_repository.dart';
import 'package:carport/domain/repositories/reminder_repository.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/repositories/vehicle_attachment_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/services/device_biometric_authenticator.dart';
import 'package:carport/domain/services/vehicle_attachment_storage.dart';
import 'package:carport/domain/use_cases/attach_vehicle_file_use_case.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/reminder_notification_scheduler.dart';
import 'package:carport/domain/use_cases/authenticate_with_biometrics_use_case.dart';
import 'package:carport/domain/use_cases/connect_portal_use_case.dart';
import 'package:carport/domain/use_cases/reregister_portal_use_case.dart';
import 'package:carport/domain/use_cases/create_or_update_reminder_use_case.dart';
import 'package:carport/domain/use_cases/create_or_update_service_item_use_case.dart';
import 'package:carport/domain/use_cases/create_or_update_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/mpg/create_mpg_entry_use_case.dart';
import 'package:carport/domain/use_cases/delete_reminder_use_case.dart';
import 'package:carport/domain/use_cases/delete_service_item_use_case.dart';
import 'package:carport/domain/use_cases/delete_vehicle_attachment_use_case.dart';
import 'package:carport/domain/use_cases/delete_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/get_garage_home_stats_use_case.dart';
import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/repositories/settings_repository.dart';
import 'package:carport/domain/use_cases/get_color_theme_preset_use_case.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/get_latest_garage_updated_at_use_case.dart';
import 'package:carport/domain/use_cases/get_mobile_id_use_case.dart';
import 'package:carport/domain/use_cases/get_portal_base_url_use_case.dart';
import 'package:carport/domain/use_cases/get_web_portal_users_use_case.dart';
import 'package:carport/domain/use_cases/set_color_theme_preset_use_case.dart';
import 'package:carport/domain/use_cases/set_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/set_portal_base_url_use_case.dart';
import 'package:carport/domain/use_cases/set_web_portal_user_access_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/repo/mpg_entry_repository_impl.dart';
import 'package:carport/repo/portal_connection_repository_impl.dart';
import 'package:carport/repo/settings_repository_impl.dart';
import 'package:carport/repo/reminder_repository_impl.dart';
import 'package:carport/repo/service_item_repository_impl.dart';
import 'package:carport/repo/vehicle_attachment_repository_impl.dart';
import 'package:carport/repo/vehicle_repository_impl.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/theme/app_themes/app_theme_cubit.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_bloc.dart';
import 'package:carport/screens/garage/home/garage_home_bloc.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_bloc.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_bloc.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_bloc.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_bloc.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_bloc.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_bloc.dart';
import 'package:carport/screens/garage/service_log/service_log_bloc.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_bloc.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_bloc.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_bloc.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_bloc.dart';
import 'package:carport/domain/use_cases/sync_reminder_notifications_use_case.dart';
import 'package:carport/domain/use_cases/sync_all_garage_data_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_service_item_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_on_app_start_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_on_app_start_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_use_case.dart';
import 'package:carport/platform/http_portal_monitor_api.dart';
import 'package:carport/platform/local_device_biometric_authenticator.dart';
import 'package:carport/platform/local_vehicle_attachment_storage.dart';
import 'package:carport/platform/local_reminder_notification_scheduler.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_bloc.dart';
import 'package:carport/screens/settings/garage_settings_bloc.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_bloc.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_bloc.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_bloc.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_bloc.dart';
import 'package:carport/screens/settings/units/garage_settings_units_bloc.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await registerDatabase();
  await registerPreferences();
  registerRouter();
  registerPlatformServices();
  registerRepositories();
  registerUseCases();
  registerAppTheme();
  registerScreens();
  await _bootstrapNotifications();
  await _bootstrapPortalSync();
}

Future<void> registerPreferences() async {
  final preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(preferences);
}

Future<void> registerDatabase() async {
  final dbHelper = DatabaseHelper();
  await dbHelper.database;
  getIt.registerSingleton<DatabaseHelper>(dbHelper);
}

void registerRouter() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}

void registerPlatformServices() {
  getIt.registerLazySingleton<ReminderNotificationScheduler>(
    () => LocalReminderNotificationScheduler(),
  );
  getIt.registerLazySingleton<VehicleAttachmentStorage>(
    () => LocalVehicleAttachmentStorage(),
  );
  getIt.registerLazySingleton<PortalMonitorApi>(
    () => HttpPortalMonitorApi(client: http.Client()),
  );
  getIt.registerLazySingleton<DeviceBiometricAuthenticator>(
    () => LocalDeviceBiometricAuthenticator(),
  );
}

void registerRepositories() {
  getIt.registerLazySingleton<VehicleRepository>(
    () => VehicleRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<VehicleAttachmentRepository>(
    () => VehicleAttachmentRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<ServiceItemRepository>(
    () => ServiceItemRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<MpgEntryRepository>(
    () => MpgEntryRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<ReminderRepository>(
    () => ReminderRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<PortalConnectionRepository>(
    () => PortalConnectionRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<PortalUrlValidator>(
    () => const PortalUrlValidator(),
  );
}

void registerUseCases() {
  getIt.registerLazySingleton<GetGarageHomeStatsUseCase>(
    () => GetGarageHomeStatsUseCase(
      vehicleRepository: getIt(),
      serviceItemRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetLatestGarageUpdatedAtUseCase>(
    () => GetLatestGarageUpdatedAtUseCase(
      vehicleRepository: getIt(),
      serviceItemRepository: getIt(),
      attachmentRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<SyncVehicleToPortalUseCase>(
    () => SyncVehicleToPortalUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
      getDistanceUnitUseCase: getIt(),
      vehicleRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<SyncServiceItemToPortalUseCase>(
    () => SyncServiceItemToPortalUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
      getDistanceUnitUseCase: getIt(),
      serviceItemRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<SyncVehicleAttachmentToPortalUseCase>(
    () => SyncVehicleAttachmentToPortalUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
    ),
  );
  getIt.registerLazySingleton<SyncVehicleAttachmentIdsToPortalUseCase>(
    () => SyncVehicleAttachmentIdsToPortalUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
      attachmentRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<SyncAllGarageDataToPortalUseCase>(
    () => SyncAllGarageDataToPortalUseCase(
      vehicleRepository: getIt(),
      serviceItemRepository: getIt(),
      attachmentRepository: getIt(),
      syncVehicleToPortalUseCase: getIt(),
      syncServiceItemToPortalUseCase: getIt(),
      syncVehicleAttachmentToPortalUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<VerifyPortalSyncUseCase>(
    () => VerifyPortalSyncUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
      syncAllGarageDataToPortalUseCase: getIt(),
      getLatestGarageUpdatedAtUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<VerifyPortalSyncOnAppStartUseCase>(
    () => VerifyPortalSyncOnAppStartUseCase(
      verifyPortalSyncUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<SyncVehicleAttachmentIdsOnAppStartUseCase>(
    () => SyncVehicleAttachmentIdsOnAppStartUseCase(
      syncVehicleAttachmentIdsToPortalUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<CreateOrUpdateServiceItemUseCase>(
    () => CreateOrUpdateServiceItemUseCase(
      serviceItemRepository: getIt(),
      vehicleRepository: getIt(),
      syncVehicleToPortalUseCase: getIt(),
      syncServiceItemToPortalUseCase: getIt(),
      verifyPortalSyncUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<CreateMpgEntryUseCase>(
    () => CreateMpgEntryUseCase(
      mpgEntryRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<CreateOrUpdateVehicleUseCase>(
    () => CreateOrUpdateVehicleUseCase(
      vehicleRepository: getIt(),
      serviceItemRepository: getIt(),
      syncVehicleToPortalUseCase: getIt(),
      verifyPortalSyncUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthenticateWithBiometricsUseCase>(
    () => AuthenticateWithBiometricsUseCase(
      authenticator: getIt(),
    ),
  );
  getIt.registerLazySingleton<DeleteVehicleUseCase>(
    () => DeleteVehicleUseCase(
      vehicleRepository: getIt(),
      attachmentRepository: getIt(),
      deleteVehicleAttachmentUseCase: getIt(),
      syncVehicleAttachmentIdsToPortalUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<AttachVehicleFileUseCase>(
    () => AttachVehicleFileUseCase(
      attachmentRepository: getIt(),
      attachmentStorage: getIt(),
      syncVehicleAttachmentToPortalUseCase: getIt(),
      verifyPortalSyncUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<DeleteVehicleAttachmentUseCase>(
    () => DeleteVehicleAttachmentUseCase(
      attachmentRepository: getIt(),
      attachmentStorage: getIt(),
      syncVehicleAttachmentIdsToPortalUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<DeleteServiceItemUseCase>(
    () => DeleteServiceItemUseCase(
      serviceItemRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<CreateOrUpdateReminderUseCase>(
    () => CreateOrUpdateReminderUseCase(
      reminderRepository: getIt(),
      notificationScheduler: getIt(),
    ),
  );
  getIt.registerLazySingleton<DeleteReminderUseCase>(
    () => DeleteReminderUseCase(
      reminderRepository: getIt(),
      notificationScheduler: getIt(),
    ),
  );
  getIt.registerLazySingleton<SyncReminderNotificationsUseCase>(
    () => SyncReminderNotificationsUseCase(
      reminderRepository: getIt(),
      notificationScheduler: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetDistanceUnitUseCase>(
    () => GetDistanceUnitUseCase(settingsRepository: getIt()),
  );
  getIt.registerLazySingleton<SetDistanceUnitUseCase>(
    () => SetDistanceUnitUseCase(settingsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetColorThemePresetUseCase>(
    () => GetColorThemePresetUseCase(settingsRepository: getIt()),
  );
  getIt.registerLazySingleton<SetColorThemePresetUseCase>(
    () => SetColorThemePresetUseCase(settingsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetPortalBaseUrlUseCase>(
    () => GetPortalBaseUrlUseCase(portalConnectionRepository: getIt()),
  );
  getIt.registerLazySingleton<SetPortalBaseUrlUseCase>(
    () => SetPortalBaseUrlUseCase(portalConnectionRepository: getIt()),
  );
  getIt.registerLazySingleton<ConnectPortalUseCase>(
    () => ConnectPortalUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
      syncAllGarageDataToPortalUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<ReregisterPortalUseCase>(
    () => ReregisterPortalUseCase(
      portalConnectionRepository: getIt(),
      connectPortalUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetMobileIdUseCase>(
    () => GetMobileIdUseCase(portalConnectionRepository: getIt()),
  );
  getIt.registerLazySingleton<GetWebPortalUsersUseCase>(
    () => GetWebPortalUsersUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
      getLatestGarageUpdatedAtUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<SetWebPortalUserAccessUseCase>(
    () => SetWebPortalUserAccessUseCase(
      portalConnectionRepository: getIt(),
      portalMonitorApi: getIt(),
      portalUrlValidator: getIt(),
      getWebPortalUsersUseCase: getIt(),
    ),
  );
}

void registerAppTheme() {
  getIt.registerLazySingleton<AppThemeCubit>(
    () => AppThemeCubit(getColorThemePresetUseCase: getIt()),
  );
}

void registerScreens() {
  getIt.registerFactory<GarageHomeBloc>(
    () => GarageHomeBloc(
      getGarageHomeStatsUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<VehicleListBloc>(
    () => VehicleListBloc(
      vehicleRepository: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<AddVehicleBloc>(
    () => AddVehicleBloc(
      createOrUpdateVehicleUseCase: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<VehicleDetailBloc>(
    () => VehicleDetailBloc(
      vehicleRepository: getIt(),
      serviceItemRepository: getIt(),
      mpgEntryRepository: getIt(),
      createOrUpdateVehicleUseCase: getIt(),
      deleteVehicleUseCase: getIt(),
      getDistanceUnitUseCase: getIt(),
      authenticateWithBiometricsUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<VehicleAttachmentsBloc>(
    () => VehicleAttachmentsBloc(
      vehicleRepository: getIt(),
      attachmentRepository: getIt(),
      attachVehicleFileUseCase: getIt(),
      deleteVehicleAttachmentUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<ServiceLogBloc>(
    () => ServiceLogBloc(
      vehicleRepository: getIt(),
      serviceItemRepository: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<QuickEntrySelectBloc>(
    () => QuickEntrySelectBloc(
      vehicleRepository: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<QuickEntryFormBloc>(
    () => QuickEntryFormBloc(
      vehicleRepository: getIt(),
      createOrUpdateServiceItemUseCase: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<MpgSelectBloc>(
    () => MpgSelectBloc(
      vehicleRepository: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<MpgFormBloc>(
    () => MpgFormBloc(
      vehicleRepository: getIt(),
      createMpgEntryUseCase: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<MpgHistoryBloc>(
    () => MpgHistoryBloc(
      vehicleRepository: getIt(),
      mpgEntryRepository: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<ServiceItemEditBloc>(
    () => ServiceItemEditBloc(
      serviceItemRepository: getIt(),
      vehicleRepository: getIt(),
      createOrUpdateServiceItemUseCase: getIt(),
      deleteServiceItemUseCase: getIt(),
      getDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageRemindersBloc>(
    () => GarageRemindersBloc(
      reminderRepository: getIt(),
      deleteReminderUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageReminderFormBloc>(
    () => GarageReminderFormBloc(
      reminderRepository: getIt(),
      createOrUpdateReminderUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageSettingsBloc>(
    () => GarageSettingsBloc(
      getDistanceUnitUseCase: getIt(),
      getColorThemePresetUseCase: getIt(),
      getPortalBaseUrlUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageSettingsUnitsBloc>(
    () => GarageSettingsUnitsBloc(
      getDistanceUnitUseCase: getIt(),
      setDistanceUnitUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageSettingsAppearanceBloc>(
    () => GarageSettingsAppearanceBloc(
      getColorThemePresetUseCase: getIt(),
      setColorThemePresetUseCase: getIt(),
      appThemeCubit: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageSettingsPermissionsBloc>(
    () => GarageSettingsPermissionsBloc(
      notificationScheduler: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageSettingsConnectivityBloc>(
    () => GarageSettingsConnectivityBloc(
      getPortalBaseUrlUseCase: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageSettingsQrScannerBloc>(
    () => GarageSettingsQrScannerBloc(
      getPortalBaseUrlUseCase: getIt(),
      getMobileIdUseCase: getIt(),
      connectPortalUseCase: getIt(),
      reregisterPortalUseCase: getIt(),
      portalUrlValidator: getIt(),
      router: getIt(),
    ),
  );
  getIt.registerFactory<GarageSettingsWebAccessBloc>(
    () => GarageSettingsWebAccessBloc(
      getPortalBaseUrlUseCase: getIt(),
      getWebPortalUsersUseCase: getIt(),
      setWebPortalUserAccessUseCase: getIt(),
      router: getIt(),
    ),
  );
}

Future<void> _bootstrapNotifications() async {
  final scheduler = getIt<ReminderNotificationScheduler>();
  final router = getIt<AppRouter>();
  await scheduler.initialize(
    onReminderTapped: (reminderId) {
      router.push(AppRoutes.reminderEdit(reminderId));
    },
  );
  await getIt<SyncReminderNotificationsUseCase>()();
}

Future<void> _bootstrapPortalSync() async {
  await getIt<VerifyPortalSyncOnAppStartUseCase>()();
  await getIt<SyncVehicleAttachmentIdsOnAppStartUseCase>()();
}
