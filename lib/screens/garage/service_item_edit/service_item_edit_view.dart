import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/screens/components/garage/garage_confirm_dialog.dart';
import 'package:carport/screens/components/garage/garage_destructive_button.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_input_field.dart';
import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_textarea_field.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/components/garage/garage_vehicle_chip.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_bloc.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_event.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ServiceItemEditView extends StatefulWidget {
  const ServiceItemEditView({super.key});

  @override
  State<ServiceItemEditView> createState() => _ServiceItemEditViewState();
}

class _ServiceItemEditViewState extends State<ServiceItemEditView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _mileageController = TextEditingController();

  static final _dateFormat = DateFormat('MMM d, y');

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _mileageController.dispose();
    super.dispose();
  }

  void _syncControllersFromState(ServiceItemEditState state) {
    if (_titleController.text != state.draftTitle) {
      _titleController.text = state.draftTitle;
    }
    if (_descriptionController.text != state.draftDescription) {
      _descriptionController.text = state.draftDescription;
    }
    if (state.draftDate != null) {
      final formatted = _dateFormat.format(state.draftDate!);
      if (_dateController.text != formatted) {
        _dateController.text = formatted;
      }
    }
    if (_mileageController.text != state.draftMileage) {
      _mileageController.text = state.draftMileage;
    }
  }

  Future<void> _pickDate(BuildContext context, DateTime currentDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        final theme = GarageTheme.of(context);
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: theme.primary,
              onPrimary: theme.primaryForeground,
              surface: theme.card,
              onSurface: theme.foreground,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked == null || !context.mounted) return;
    context.read<ServiceItemEditBloc>().add(
          ServiceItemEditEvent.dateChanged(picked),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ServiceItemEditBloc, ServiceItemEditState>(
          listenWhen: (previous, current) =>
              current.errorMessage != null &&
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            showGarageErrorDialog(
              context,
              message: state.errorMessage!,
            );
          },
        ),
        BlocListener<ServiceItemEditBloc, ServiceItemEditState>(
          listenWhen: (previous, current) =>
              previous.draftTitle != current.draftTitle ||
              previous.draftDescription != current.draftDescription ||
              previous.draftDate != current.draftDate ||
              previous.draftMileage != current.draftMileage,
          listener: (context, state) => _syncControllersFromState(state),
        ),
      ],
      child: BlocBuilder<ServiceItemEditBloc, ServiceItemEditState>(
        builder: (context, state) {
          return GarageShell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GarageTopBar(
                  title: 'Edit Entry',
                  backEnabled: !state.isSaving,
                  onBack: () => context.read<ServiceItemEditBloc>().add(
                        const ServiceItemEditEvent.backTapped(),
                      ),
                ),
                Expanded(child: _Body(state: state, parent: this)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state, required this.parent});

  final ServiceItemEditState state;
  final _ServiceItemEditViewState parent;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.serviceItem == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final serviceItem = state.serviceItem;
    final vehicle = state.vehicle;
    if (serviceItem == null || vehicle == null) {
      return _ErrorBody(
        message: state.errorMessage ?? 'Service entry not found',
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        0,
        GarageSpacing.screenH,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GarageVehicleChip(vehicleName: vehicle.name),
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: Text(
                state.errorMessage!,
                style: GarageTextStyles.body(
                  GarageTheme.of(context),
                  color: GarageTheme.of(context).destructive,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GarageInputField(
              label: 'TITLE',
              controller: parent._titleController,
              icon: LucideIcons.fileText,
              placeholder: 'Oil change, Tire rotation…',
              onChanged: (value) => context.read<ServiceItemEditBloc>().add(
                    ServiceItemEditEvent.titleChanged(value),
                  ),
            ),
          ),
          if (state.titleError != null)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
              child: Text(
                state.titleError!,
                style: GarageTextStyles.body(
                  GarageTheme.of(context),
                  color: GarageTheme.of(context).destructive,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GarageTextareaField(
              label: 'DESCRIPTION',
              controller: parent._descriptionController,
              placeholder: 'Parts used, shop name, notes…',
              onChanged: (value) => context.read<ServiceItemEditBloc>().add(
                    ServiceItemEditEvent.descriptionChanged(value),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GarageInputField(
                    label: 'DATE',
                    controller: parent._dateController,
                    icon: LucideIcons.calendar,
                    readOnly: true,
                    onTap: () => parent._pickDate(
                      context,
                      state.draftDate ?? serviceItem.date,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: GarageInputField(
                      label: GarageMileageFormatter.mileageFieldLabel(
                        'MILEAGE',
                        unit: state.distanceUnit,
                      ),
                      controller: parent._mileageController,
                      icon: LucideIcons.gauge,
                      placeholder: '61,000',
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          context.read<ServiceItemEditBloc>().add(
                                ServiceItemEditEvent.mileageChanged(value),
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GaragePrimaryButton(
              label: 'Save Entry',
              isLoading: state.isSaving,
              onPressed: state.isSaving || state.isDeleting
                  ? null
                  : () => context.read<ServiceItemEditBloc>().add(
                        const ServiceItemEditEvent.saved(),
                      ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.list),
            child: GarageDestructiveButton(
              label: 'Delete Entry',
              isLoading: state.isDeleting,
              onPressed: state.isSaving || state.isDeleting
                  ? null
                  : () => _confirmDelete(context, serviceItem),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    ServiceItem serviceItem,
  ) async {
    final bloc = context.read<ServiceItemEditBloc>();
    final confirmed = await showGarageConfirmDialog(
      context,
      title: 'Delete Entry',
      message:
          'Delete "${serviceItem.title}"? This service entry cannot be recovered.',
    );
    if (!confirmed) return;
    bloc.add(const ServiceItemEditEvent.deleteConfirmed());
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GarageSpacing.screenH),
        child: Text(
          message,
          style: GarageTextStyles.body(
            GarageTheme.of(context),
            color: GarageTheme.of(context).destructive,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
