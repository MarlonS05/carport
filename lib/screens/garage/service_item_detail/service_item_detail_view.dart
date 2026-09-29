import 'package:carport/screens/components/garage/garage_edit_toggle.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_input_field.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_textarea_field.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/components/garage/garage_vehicle_chip.dart';
import 'package:carport/screens/garage/service_item_detail/service_item_detail_bloc.dart';
import 'package:carport/screens/garage/service_item_detail/service_item_detail_event.dart';
import 'package:carport/screens/garage/service_item_detail/service_item_detail_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ServiceItemDetailView extends StatefulWidget {
  const ServiceItemDetailView({super.key});

  @override
  State<ServiceItemDetailView> createState() => _ServiceItemDetailViewState();
}

class _ServiceItemDetailViewState extends State<ServiceItemDetailView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _mileageController = TextEditingController();

  static final _dateFormat = DateFormat('MMM d, y');
  static final _mileageFormat = NumberFormat('#,###');

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _mileageController.dispose();
    super.dispose();
  }

  void _syncControllersFromState(ServiceItemDetailState state) {
    if (!state.isEditing) return;
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
    context.read<ServiceItemDetailBloc>().add(
          ServiceItemDetailEvent.dateChanged(picked),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ServiceItemDetailBloc, ServiceItemDetailState>(
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
        BlocListener<ServiceItemDetailBloc, ServiceItemDetailState>(
          listenWhen: (previous, current) =>
              previous.isEditing != current.isEditing ||
              (current.isEditing &&
                  (previous.draftTitle != current.draftTitle ||
                      previous.draftDescription != current.draftDescription ||
                      previous.draftDate != current.draftDate ||
                      previous.draftMileage != current.draftMileage)),
          listener: (context, state) => _syncControllersFromState(state),
        ),
      ],
      child: BlocBuilder<ServiceItemDetailBloc, ServiceItemDetailState>(
        builder: (context, state) {
          return GarageShell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GarageTopBar(
                  title: state.serviceItem?.title ?? 'Entry',
                  backEnabled: !state.isSaving,
                  onBack: () => context.read<ServiceItemDetailBloc>().add(
                        const ServiceItemDetailEvent.backTapped(),
                      ),
                  action: state.serviceItem != null && !state.isLoading
                      ? GarageEditToggle(
                          isEditing: state.isEditing,
                          onEdit: () => context.read<ServiceItemDetailBloc>().add(
                                const ServiceItemDetailEvent.editToggled(),
                              ),
                          onSave: state.isSaving
                              ? () {}
                              : () => context.read<ServiceItemDetailBloc>().add(
                                    const ServiceItemDetailEvent.saved(),
                                  ),
                        )
                      : null,
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

  final ServiceItemDetailState state;
  final _ServiceItemDetailViewState parent;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.serviceItem == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.serviceItem == null) {
      return GarageEmptyState(
        icon: LucideIcons.fileText,
        message: state.errorMessage!,
      );
    }

    final serviceItem = state.serviceItem;
    final vehicle = state.vehicle;
    if (serviceItem == null || vehicle == null) {
      return const GarageEmptyState(
        icon: LucideIcons.fileText,
        message: 'Service entry not found',
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        0,
        GarageSpacing.screenH,
        32,
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
          if (state.isEditing) ...[
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: GarageInputField(
                label: 'TITLE',
                controller: parent._titleController,
                icon: LucideIcons.fileText,
                placeholder: 'Oil change, Tire rotation…',
                onChanged: (value) => context.read<ServiceItemDetailBloc>().add(
                      ServiceItemDetailEvent.titleChanged(value),
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
                onChanged: (value) =>
                    context.read<ServiceItemDetailBloc>().add(
                          ServiceItemDetailEvent.descriptionChanged(value),
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
                        label: 'MILEAGE',
                        controller: parent._mileageController,
                        icon: LucideIcons.gauge,
                        placeholder: '61,000',
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            context.read<ServiceItemDetailBloc>().add(
                                  ServiceItemDetailEvent.mileageChanged(value),
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            if (serviceItem.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: GarageSpacing.section),
                child: Text(
                  serviceItem.description,
                  style: GarageTextStyles.body(
                    GarageTheme.of(context),
                    color: GarageTheme.of(context).foreground,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: Row(
                children: [
                  Expanded(
                    child: _ReadField(
                      label: 'DATE',
                      icon: LucideIcons.calendar,
                      value: _formatDate(serviceItem.date),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: _ReadField(
                        label: 'MILEAGE',
                        icon: LucideIcons.gauge,
                        value: _formatMileage(serviceItem.mileage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    if (date.millisecondsSinceEpoch == 0) return '—';
    return _ServiceItemDetailViewState._dateFormat.format(date);
  }

  String _formatMileage(double mileage) {
    if (mileage <= 0) return '—';
    return '${_ServiceItemDetailViewState._mileageFormat.format(mileage.round())} mi';
  }
}

class _ReadField extends StatelessWidget {
  const _ReadField({
    required this.label,
    required this.icon,
    required this.value,
  });

  final String label;
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: GarageTextStyles.fieldLabel(theme)),
        Padding(
          padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: theme.secondary,
              borderRadius: BorderRadius.circular(GarageRadius.input),
              border: Border.all(color: theme.border),
            ),
            child: Row(
              children: [
                Icon(icon, size: 14, color: theme.mutedForeground),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      value,
                      style: GarageTextStyles.body(
                        theme,
                        color: theme.foreground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
