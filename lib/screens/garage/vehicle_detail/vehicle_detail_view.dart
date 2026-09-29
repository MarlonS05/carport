import 'dart:convert';

import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_confirm_dialog.dart';
import 'package:carport/screens/components/garage/garage_destructive_button.dart';
import 'package:carport/screens/components/garage/garage_edit_toggle.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_input_field.dart';
import 'package:carport/screens/components/garage/garage_link_row.dart';
import 'package:carport/screens/components/garage/garage_maintenance_schedule_section.dart';
import 'package:carport/screens/components/garage/garage_mileage_read_row.dart';
import 'package:carport/screens/components/garage/garage_mpg_history_section.dart';
import 'package:carport/screens/components/garage/garage_secondary_icon_button.dart';
import 'package:carport/screens/components/garage/garage_service_log_section.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_textarea_field.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_bloc.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_event.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class VehicleDetailView extends StatefulWidget {
  const VehicleDetailView({super.key});

  @override
  State<VehicleDetailView> createState() => _VehicleDetailViewState();
}

class _VehicleDetailViewState extends State<VehicleDetailView> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _mileageController = TextEditingController();
  final _userManualController = TextEditingController();
  final _maintenanceManualController = TextEditingController();
  final _imagePicker = ImagePicker();
  String? _maintenancePlanImage;
  String? _documentsImage;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _mileageController.dispose();
    _userManualController.dispose();
    _maintenanceManualController.dispose();
    super.dispose();
  }

  void _seedControllersFromVehicle(Vehicle vehicle) {
    _nameController.text = vehicle.name;
    _descriptionController.text = vehicle.description;
    _mileageController.text = GarageMileageFormatter.formatForField(vehicle.mileage);
    _userManualController.text = vehicle.userManualLink ?? '';
    _maintenanceManualController.text = vehicle.maintenanceManualLink ?? '';
    _maintenancePlanImage = vehicle.maintenancePlanImage;
    _documentsImage = vehicle.documentsImage;
  }

  Future<void> _pickImage() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1280,
      maxHeight: 1280,
      imageQuality: 85,
    );
    if (file == null || !mounted) return;

    final bytes = await file.readAsBytes();
    if (!mounted) return;

    setState(() {
      _maintenancePlanImage = base64Encode(bytes);
    });
  }

  void _removeImage() {
    setState(() {
      _maintenancePlanImage = null;
    });
  }

  Future<String?> _pickDocumentsImageBytes() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1280,
      maxHeight: 1280,
      imageQuality: 85,
    );
    if (file == null) return null;

    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }

  void _save(BuildContext context) {
    context.read<VehicleDetailBloc>().add(
          VehicleDetailEvent.saved(
            name: _nameController.text,
            description: _descriptionController.text,
            mileage: _mileageController.text,
            userManualLink: _userManualController.text,
            maintenanceManualLink: _maintenanceManualController.text,
            maintenancePlanImage: _maintenancePlanImage,
            documentsImage: _documentsImage,
          ),
        );
  }

  Future<void> _openDocumentsSheet({
    required bool isEditing,
  }) async {
    final result = await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: GarageTheme.of(context).card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(GarageRadius.card),
        ),
      ),
      builder: (sheetContext) {
        return SizedBox(
          height: MediaQuery.sizeOf(sheetContext).height * 0.92,
          child: _DocumentsSheet(
            initialImage: _documentsImage ??
                context.read<VehicleDetailBloc>().state.vehicle?.documentsImage,
            isEditing: isEditing,
            onPickImage: _pickDocumentsImageBytes,
          ),
        );
      },
    );

    if (!mounted || !isEditing || result == null) return;

    setState(() {
      _documentsImage = result.isEmpty ? null : result;
    });
  }

  Widget _documentsButton(BuildContext context, VehicleDetailState state) {
    return GarageSecondaryIconButton(
      icon: LucideIcons.fileLock2,
      semanticsLabel: 'Vehicle documents',
      enabled: !state.isAuthenticatingDocuments,
      onPressed: () => context.read<VehicleDetailBloc>().add(
            const VehicleDetailEvent.documentsButtonTapped(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<VehicleDetailBloc, VehicleDetailState>(
          listenWhen: (previous, current) =>
              !previous.isEditing && current.isEditing && current.vehicle != null,
          listener: (context, state) {
            _seedControllersFromVehicle(state.vehicle!);
          },
        ),
        BlocListener<VehicleDetailBloc, VehicleDetailState>(
          listenWhen: (previous, current) =>
              previous.documentsAccessNonce != current.documentsAccessNonce &&
              current.documentsAccessNonce > 0,
          listener: (context, state) {
            _openDocumentsSheet(isEditing: state.isEditing);
          },
        ),
        BlocListener<VehicleDetailBloc, VehicleDetailState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage != null &&
              current.vehicle != null,
          listener: (context, state) {
            showGarageErrorDialog(context, message: state.errorMessage!);
          },
        ),
      ],
      child: BlocBuilder<VehicleDetailBloc, VehicleDetailState>(
        builder: (context, state) {
          return GarageShell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GarageTopBar(
                  title: state.vehicle?.name ?? 'Vehicle',
                  onBack: () => context.read<VehicleDetailBloc>().add(
                        const VehicleDetailEvent.backTapped(),
                      ),
                  action: state.vehicle != null && !state.isLoading
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _documentsButton(context, state),
                            const SizedBox(width: 8),
                            if (!state.isEditing) ...[
                              GarageSecondaryIconButton(
                                icon: LucideIcons.paperclip,
                                semanticsLabel: 'Attachments',
                                onPressed: () => context
                                    .read<VehicleDetailBloc>()
                                    .add(
                                      const VehicleDetailEvent
                                          .attachmentsTapped(),
                                    ),
                              ),
                              const SizedBox(width: 8),
                            ],
                            GarageEditToggle(
                              isEditing: state.isEditing,
                              onEdit: () => context
                                  .read<VehicleDetailBloc>()
                                  .add(
                                    const VehicleDetailEvent.editToggled(),
                                  ),
                              onSave: state.isSaving
                                  ? () {}
                                  : () => _save(context),
                            ),
                          ],
                        )
                      : null,
                ),
                Expanded(
                  child: _Body(
                    state: state,
                    nameController: _nameController,
                    descriptionController: _descriptionController,
                    mileageController: _mileageController,
                    userManualController: _userManualController,
                    maintenanceManualController: _maintenanceManualController,
                    maintenancePlanImage: _maintenancePlanImage,
                    onPickImage: _pickImage,
                    onRemoveImage: _removeImage,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DocumentsSheet extends StatefulWidget {
  const _DocumentsSheet({
    required this.initialImage,
    required this.isEditing,
    required this.onPickImage,
  });

  final String? initialImage;
  final bool isEditing;
  final Future<String?> Function() onPickImage;

  @override
  State<_DocumentsSheet> createState() => _DocumentsSheetState();
}

class _DocumentsSheetState extends State<_DocumentsSheet> {
  late String? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.initialImage;
  }

  Future<void> _pick() async {
    final picked = await widget.onPickImage();
    if (picked == null || !mounted) return;
    setState(() => _image = picked);
  }

  void _clear() {
    setState(() => _image = null);
  }

  void _done() {
    // Empty string means cleared so the parent can distinguish dismiss.
    Navigator.of(context).pop(_image ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        GarageSpacing.section,
        GarageSpacing.screenH,
        GarageSpacing.section,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'VEHICLE DOCUMENTS',
            style: GarageTextStyles.fieldLabel(theme),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
            child: Text(
              widget.isEditing
                  ? 'Upload a photo of your vehicle documents.'
                  : 'Protected by device biometrics.',
              style: GarageTextStyles.body(theme),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: _DocumentsPreview(
                imageBase64: _image,
                isEditing: widget.isEditing,
                onPickImage: _pick,
                onRemoveImage: _clear,
              ),
            ),
          ),
          if (widget.isEditing)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: GarageSpacing.list),
                  Expanded(
                    child: FilledButton(
                      onPressed: _done,
                      child: const Text('Done'),
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ),
        ],
      ),
    );
  }
}

class _DocumentsPreview extends StatelessWidget {
  const _DocumentsPreview({
    required this.imageBase64,
    required this.isEditing,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  final String? imageBase64;
  final bool isEditing;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final hasImage = imageBase64 != null && imageBase64!.isNotEmpty;

    if (!hasImage) {
      if (isEditing) {
        return _DocumentsUploadZone(onTap: onPickImage);
      }

      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GarageRadius.input),
          border: Border.all(color: theme.border),
        ),
        child: Center(
          child: Text(
            'No documents uploaded',
            style: GarageTextStyles.body(theme),
          ),
        ),
      );
    }

    final imageBytes = decodeGarageBase64Image(imageBase64!);

    return ClipRRect(
      borderRadius: BorderRadius.circular(GarageRadius.input),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: theme.secondary,
            child: imageBytes == null
                ? Center(
                    child: Text(
                      'Could not load image',
                      style: GarageTextStyles.body(theme),
                    ),
                  )
                : InteractiveViewer(
                    child: Image.memory(
                      imageBytes,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (_, _, _) => Center(
                        child: Text(
                          'Could not load image',
                          style: GarageTextStyles.body(theme),
                        ),
                      ),
                    ),
                  ),
          ),
          if (isEditing)
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  _DocumentsOverlayButton(
                    icon: LucideIcons.refreshCw,
                    label: 'Replace',
                    onTap: onPickImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: _DocumentsOverlayButton(
                      icon: LucideIcons.trash2,
                      label: 'Remove',
                      onTap: onRemoveImage,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _DocumentsUploadZone extends StatelessWidget {
  const _DocumentsUploadZone({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      button: true,
      label: 'Tap to upload documents',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GarageRadius.input),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(GarageRadius.input),
              border: Border.all(color: theme.border),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LucideIcons.imagePlus,
                    size: 32,
                    color: theme.mutedForeground,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Tap to upload documents',
                      style: GarageTextStyles.body(theme),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DocumentsOverlayButton extends StatelessWidget {
  const _DocumentsOverlayButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: theme.card.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(GarageRadius.iconBox),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GarageRadius.iconBox),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, size: 16, color: theme.foreground),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.state,
    required this.nameController,
    required this.descriptionController,
    required this.mileageController,
    required this.userManualController,
    required this.maintenanceManualController,
    required this.maintenancePlanImage,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  final VehicleDetailState state;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController mileageController;
  final TextEditingController userManualController;
  final TextEditingController maintenanceManualController;
  final String? maintenancePlanImage;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.vehicle == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.vehicle == null) {
      return GarageEmptyState(
        icon: LucideIcons.car,
        message: state.errorMessage!,
      );
    }

    final vehicle = state.vehicle;
    if (vehicle == null) {
      return const GarageEmptyState(
        icon: LucideIcons.car,
        message: 'Vehicle not found',
      );
    }

    final displayImage = state.isEditing
        ? maintenancePlanImage
        : vehicle.maintenancePlanImage;

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
          if (state.isEditing) ...[
            GarageInputField(
              label: 'NAME',
              controller: nameController,
              placeholder: 'Vehicle name',
            ),
            if (state.fieldErrors['name'] != null)
              Padding(
                padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
                child: Text(
                  state.fieldErrors['name']!,
                  style: GarageTextStyles.body(
                    GarageTheme.of(context),
                    color: GarageTheme.of(context).destructive,
                  ),
                ),
              ),
          ],
          if (state.isEditing)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: GarageTextareaField(
                label: 'DESCRIPTION',
                controller: descriptionController,
                placeholder: 'Optional notes',
              ),
            )
          else if (vehicle.description.isNotEmpty)
            Text(
              vehicle.description,
              style: GarageTextStyles.body(
                GarageTheme.of(context),
                color: GarageTheme.of(context).foreground,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: state.isEditing
                ? GarageInputField(
                    label: GarageMileageFormatter.mileageFieldLabel(
                      'MILEAGE',
                      unit: state.distanceUnit,
                    ),
                    controller: mileageController,
                    icon: LucideIcons.gauge,
                    placeholder: '0',
                    keyboardType: TextInputType.number,
                  )
                : GarageMileageReadRow(
                    mileage: vehicle.mileage,
                    unit: state.distanceUnit,
                  ),
          ),
          if (state.isEditing && state.fieldErrors['mileage'] != null)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
              child: Text(
                state.fieldErrors['mileage']!,
                style: GarageTextStyles.body(
                  GarageTheme.of(context),
                  color: GarageTheme.of(context).destructive,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: Text(
              'MAINTENANCE SCHEDULE',
              style: GarageTextStyles.fieldLabel(GarageTheme.of(context)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
            child: GarageMaintenanceScheduleSection(
              imageBase64: displayImage,
              isEditing: state.isEditing,
              onPickImage: onPickImage,
              onRemoveImage: onRemoveImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: Text(
              'LINKS',
              style: GarageTextStyles.fieldLabel(GarageTheme.of(context)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
            child: _LinksSection(
              state: state,
              vehicle: vehicle,
              userManualController: userManualController,
              maintenanceManualController: maintenanceManualController,
            ),
          ),
          if (!state.isEditing) ...[
            GarageServiceLogSection(
              entryCount: state.entryCount,
              onTap: () => context.read<VehicleDetailBloc>().add(
                    const VehicleDetailEvent.serviceLogTapped(),
                  ),
            ),
            GarageMpgHistorySection(
              entryCount: state.mpgEntryCount,
              onTap: () => context.read<VehicleDetailBloc>().add(
                    const VehicleDetailEvent.mpgHistoryTapped(),
                  ),
            ),
          ],
          if (state.isEditing)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: GarageDestructiveButton(
                label: 'Delete Vehicle',
                isLoading: state.isDeleting,
                onPressed: state.isDeleting || state.isSaving
                    ? null
                    : () => _confirmDelete(context, vehicle),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, Vehicle vehicle) async {
    final bloc = context.read<VehicleDetailBloc>();
    final confirmed = await showGarageConfirmDialog(
      context,
      title: 'Delete Vehicle',
      message:
          'Delete "${vehicle.name}"? This also removes its service history and cannot be undone.',
    );
    if (!confirmed) return;
    bloc.add(const VehicleDetailEvent.deleteConfirmed());
  }
}

class _LinksSection extends StatelessWidget {
  const _LinksSection({
    required this.state,
    required this.vehicle,
    required this.userManualController,
    required this.maintenanceManualController,
  });

  final VehicleDetailState state;
  final Vehicle vehicle;
  final TextEditingController userManualController;
  final TextEditingController maintenanceManualController;

  @override
  Widget build(BuildContext context) {
    if (state.isEditing) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GarageInputField(
            label: 'USER MANUAL',
            controller: userManualController,
            icon: LucideIcons.link2,
            placeholder: 'https://',
            keyboardType: TextInputType.url,
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GarageInputField(
              label: 'MAINTENANCE MANUAL',
              controller: maintenanceManualController,
              icon: LucideIcons.link2,
              placeholder: 'https://',
              keyboardType: TextInputType.url,
            ),
          ),
        ],
      );
    }

    final links = <({String label, String url})>[];
    if (vehicle.userManualLink != null && vehicle.userManualLink!.isNotEmpty) {
      links.add((label: 'User Manual', url: vehicle.userManualLink!));
    }
    if (vehicle.maintenanceManualLink != null &&
        vehicle.maintenanceManualLink!.isNotEmpty) {
      links.add((
        label: 'Maintenance Manual',
        url: vehicle.maintenanceManualLink!,
      ));
    }

    if (links.isEmpty) {
      return Text(
        'No links added',
        style: GarageTextStyles.body(GarageTheme.of(context)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < links.length; i++)
          Padding(
            padding: EdgeInsets.only(top: i == 0 ? 0 : GarageSpacing.list),
            child: GarageLinkRow(
              label: links[i].label,
              url: links[i].url,
            ),
          ),
      ],
    );
  }
}
