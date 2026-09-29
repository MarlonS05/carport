import 'package:carport/di/di.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_bloc.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_event.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_view.dart';
import 'package:carport/screens/garage/home/garage_home_bloc.dart';
import 'package:carport/screens/garage/home/garage_home_event.dart';
import 'package:carport/screens/garage/home/garage_home_view.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_bloc.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_event.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_view.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_bloc.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_event.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_view.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_bloc.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_event.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_view.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_bloc.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_event.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_view.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_bloc.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_event.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_view.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_bloc.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_event.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_view.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_bloc.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_event.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_view.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_bloc.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_event.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_view.dart';
import 'package:carport/screens/garage/service_log/service_log_bloc.dart';
import 'package:carport/screens/garage/service_log/service_log_event.dart';
import 'package:carport/screens/garage/service_log/service_log_view.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_bloc.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_event.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_view.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_bloc.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_event.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_view.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_bloc.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_event.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_view.dart';
import 'package:carport/screens/settings/garage_settings_bloc.dart';
import 'package:carport/screens/settings/garage_settings_event.dart';
import 'package:carport/screens/settings/garage_settings_view.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_bloc.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_event.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_view.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_bloc.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_event.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_view.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_bloc.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_event.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_view.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_bloc.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_event.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_view.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_bloc.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_event.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_view.dart';
import 'package:carport/screens/settings/units/garage_settings_units_bloc.dart';
import 'package:carport/screens/settings/units/garage_settings_units_event.dart';
import 'package:carport/screens/settings/units/garage_settings_units_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Path constants for navigation from BLoCs. Single source of truth for routes.
abstract final class AppRoutes {
  AppRoutes._();

  static const root = '/';
  static const garage = '/garage';
  static const quickEntry = '$garage/quick-entry';
  static const segmentVehicleForm = ':vehicleId/form';
  static const vehicleIdParam = 'vehicleId';
  static String quickEntryForm(String vehicleId) =>
      '$quickEntry/$vehicleId/form';

  static const mpg = '$garage/mpg';
  static String mpgForm(String vehicleId) => '$mpg/$vehicleId/form';

  static const vehicles = '$garage/vehicles';
  static const segmentAdd = 'add';
  static const addVehicle = '$vehicles/$segmentAdd';
  static const segmentVehicleId = ':vehicleId';
  static String vehicleDetail(String vehicleId) => '$vehicles/$vehicleId';
  static const segmentLog = 'log';
  static String serviceLog(String vehicleId) => '$vehicles/$vehicleId/$segmentLog';
  static const segmentMpg = 'mpg';
  static String mpgHistory(String vehicleId) =>
      '$vehicles/$vehicleId/$segmentMpg';
  static const segmentAttachments = 'attachments';
  static String vehicleAttachments(String vehicleId) =>
      '$vehicles/$vehicleId/$segmentAttachments';
  static const segmentServiceItemEdit = ':serviceItemId/edit';
  static const serviceItemIdParam = 'serviceItemId';
  static String serviceItemEdit(String vehicleId, String serviceItemId) =>
      '$vehicles/$vehicleId/$segmentLog/$serviceItemId/edit';

  static const reminders = '$garage/reminders';
  static const addReminder = '$reminders/$segmentAdd';
  static const segmentReminderEdit = ':reminderId/edit';
  static const reminderIdParam = 'reminderId';
  static String reminderEdit(String reminderId) =>
      '$reminders/$reminderId/edit';

  static const settings = '$garage/settings';
  static const settingsUnits = '$settings/units';
  static const settingsPermissions = '$settings/permissions';
  static const settingsConnectivity = '$settings/connectivity';
  static const settingsConnectivityQrScanner =
      '$settingsConnectivity/qr-scanner';
  static const settingsConnectivityWebAccess =
      '$settingsConnectivity/web-access';
  static const settingsAppearance = '$settings/appearance';
}

class AppRouter {
  final GoRouter instance = GoRouter(
    initialLocation: AppRoutes.garage,
    routes: [
      GoRoute(
        path: AppRoutes.root,
        redirect: (_, _) => AppRoutes.garage,
      ),
      GoRoute(
        path: AppRoutes.garage,
        builder: (context, state) => BlocProvider(
          create: (_) =>
              getIt<GarageHomeBloc>()..add(const GarageHomeEvent.started()),
          child: const GarageHomeView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.quickEntry,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<QuickEntrySelectBloc>()
            ..add(const QuickEntrySelectEvent.started()),
          child: const QuickEntrySelectView(),
        ),
        routes: [
          GoRoute(
            path: AppRoutes.segmentVehicleForm,
            builder: (context, state) {
              final vehicleId =
                  state.pathParameters[AppRoutes.vehicleIdParam] ?? '';
              return BlocProvider(
                create: (_) => getIt<QuickEntryFormBloc>()
                  ..add(QuickEntryFormEvent.started(vehicleId: vehicleId)),
                child: const QuickEntryFormView(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.mpg,
        builder: (context, state) => BlocProvider(
          create: (_) =>
              getIt<MpgSelectBloc>()..add(const MpgSelectEvent.started()),
          child: const MpgSelectView(),
        ),
        routes: [
          GoRoute(
            path: AppRoutes.segmentVehicleForm,
            builder: (context, state) {
              final vehicleId =
                  state.pathParameters[AppRoutes.vehicleIdParam] ?? '';
              return BlocProvider(
                create: (_) => getIt<MpgFormBloc>()
                  ..add(MpgFormEvent.started(vehicleId: vehicleId)),
                child: const MpgFormView(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.vehicles,
        builder: (context, state) => BlocProvider(
          create: (_) =>
              getIt<VehicleListBloc>()..add(const VehicleListEvent.started()),
          child: const VehicleListView(),
        ),
        routes: [
          GoRoute(
            path: AppRoutes.segmentAdd,
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<AddVehicleBloc>()
                ..add(const AddVehicleEvent.started()),
              child: const AddVehicleView(),
            ),
          ),
          GoRoute(
            path: AppRoutes.segmentVehicleId,
            builder: (context, state) {
              final vehicleId =
                  state.pathParameters[AppRoutes.vehicleIdParam] ?? '';
              return BlocProvider(
                create: (_) => getIt<VehicleDetailBloc>()
                  ..add(VehicleDetailEvent.started(vehicleId: vehicleId)),
                child: const VehicleDetailView(),
              );
            },
            routes: [
              GoRoute(
                path: AppRoutes.segmentAttachments,
                builder: (context, state) {
                  final vehicleId =
                      state.pathParameters[AppRoutes.vehicleIdParam] ?? '';
                  return BlocProvider(
                    create: (_) => getIt<VehicleAttachmentsBloc>()
                      ..add(
                        VehicleAttachmentsEvent.started(vehicleId: vehicleId),
                      ),
                    child: const VehicleAttachmentsView(),
                  );
                },
              ),
              GoRoute(
                path: AppRoutes.segmentLog,
                builder: (context, state) {
                  final vehicleId =
                      state.pathParameters[AppRoutes.vehicleIdParam] ?? '';
                  return BlocProvider(
                    create: (_) => getIt<ServiceLogBloc>()
                      ..add(ServiceLogEvent.started(vehicleId: vehicleId)),
                    child: const ServiceLogView(),
                  );
                },
                routes: [
                  GoRoute(
                    path: AppRoutes.segmentServiceItemEdit,
                    builder: (context, state) {
                      final vehicleId =
                          state.pathParameters[AppRoutes.vehicleIdParam] ?? '';
                      final serviceItemId = state
                              .pathParameters[AppRoutes.serviceItemIdParam] ??
                          '';
                      return BlocProvider(
                        create: (_) => getIt<ServiceItemEditBloc>()
                          ..add(
                            ServiceItemEditEvent.started(
                              vehicleId: vehicleId,
                              serviceItemId: serviceItemId,
                            ),
                          ),
                        child: const ServiceItemEditView(),
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: AppRoutes.segmentMpg,
                builder: (context, state) {
                  final vehicleId =
                      state.pathParameters[AppRoutes.vehicleIdParam] ?? '';
                  return BlocProvider(
                    create: (_) => getIt<MpgHistoryBloc>()
                      ..add(MpgHistoryEvent.started(vehicleId: vehicleId)),
                    child: const MpgHistoryView(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.reminders,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<GarageRemindersBloc>()
            ..add(const GarageRemindersEvent.started()),
          child: const GarageRemindersView(),
        ),
        routes: [
          GoRoute(
            path: AppRoutes.segmentAdd,
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<GarageReminderFormBloc>()
                ..add(const GarageReminderFormEvent.started()),
              child: const GarageReminderFormView(),
            ),
          ),
          GoRoute(
            path: AppRoutes.segmentReminderEdit,
            builder: (context, state) {
              final reminderId =
                  state.pathParameters[AppRoutes.reminderIdParam] ?? '';
              return BlocProvider(
                create: (_) => getIt<GarageReminderFormBloc>()
                  ..add(GarageReminderFormEvent.started(reminderId: reminderId)),
                child: const GarageReminderFormView(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<GarageSettingsBloc>()
            ..add(const GarageSettingsEvent.started()),
          child: const GarageSettingsView(),
        ),
        routes: [
          GoRoute(
            path: 'units',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<GarageSettingsUnitsBloc>()
                ..add(const GarageSettingsUnitsEvent.started()),
              child: const GarageSettingsUnitsView(),
            ),
          ),
          GoRoute(
            path: 'permissions',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<GarageSettingsPermissionsBloc>()
                ..add(const GarageSettingsPermissionsEvent.started()),
              child: const GarageSettingsPermissionsView(),
            ),
          ),
          GoRoute(
            path: 'appearance',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<GarageSettingsAppearanceBloc>()
                ..add(const GarageSettingsAppearanceEvent.started()),
              child: const GarageSettingsAppearanceView(),
            ),
          ),
          GoRoute(
            path: 'connectivity',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<GarageSettingsConnectivityBloc>()
                ..add(const GarageSettingsConnectivityEvent.started()),
              child: const GarageSettingsConnectivityView(),
            ),
            routes: [
              GoRoute(
                path: 'qr-scanner',
                builder: (context, state) => BlocProvider(
                  create: (_) => getIt<GarageSettingsQrScannerBloc>()
                    ..add(const GarageSettingsQrScannerEvent.started()),
                  child: const GarageSettingsQrScannerView(),
                ),
              ),
              GoRoute(
                path: 'web-access',
                builder: (context, state) => BlocProvider(
                  create: (_) => getIt<GarageSettingsWebAccessBloc>()
                    ..add(const GarageSettingsWebAccessEvent.started()),
                  child: const GarageSettingsWebAccessView(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  void go(String path, {Object? extra}) {
    instance.go(path, extra: extra);
  }

  Future<T?> push<T extends Object?>(String path, {Object? extra}) {
    return instance.push<T>(path, extra: extra);
  }

  void pop() {
    instance.pop();
  }

  void goHome({Object? extra}) {
    instance.go(AppRoutes.garage, extra: extra);
  }
}
