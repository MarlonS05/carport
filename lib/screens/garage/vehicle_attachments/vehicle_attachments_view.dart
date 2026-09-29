import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/formatters/garage_datetime_formatter.dart';
import 'package:carport/screens/components/garage/garage_attachment_card.dart';
import 'package:carport/screens/components/garage/garage_confirm_dialog.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_icon_action_button.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_bloc.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_event.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:open_filex/open_filex.dart';

class VehicleAttachmentsView extends StatefulWidget {
  const VehicleAttachmentsView({super.key});

  @override
  State<VehicleAttachmentsView> createState() => _VehicleAttachmentsViewState();
}

class _VehicleAttachmentsViewState extends State<VehicleAttachmentsView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleAttachmentsBloc, VehicleAttachmentsState>(
      listenWhen: (previous, current) =>
          current.errorMessage != null &&
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        showGarageErrorDialog(context, message: state.errorMessage!);
      },
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Attachments',
                backEnabled: !state.isLoading,
                onBack: () => context.read<VehicleAttachmentsBloc>().add(
                      const VehicleAttachmentsEvent.backTapped(),
                    ),
                action: GarageIconActionButton(
                  icon: LucideIcons.paperclip,
                  semanticsLabel: 'Attach file',
                  enabled: !state.isLoading && !state.isAttaching,
                  onPressed: () => _pickFile(context),
                ),
              ),
              Expanded(child: _Body(state: state)),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: false,
    );
    if (!context.mounted || result == null || result.files.isEmpty) return;

    final file = result.files.single;
    final sourcePath = file.path;
    if (sourcePath == null || sourcePath.isEmpty) {
      if (!context.mounted) return;
      showGarageErrorDialog(
        context,
        message: 'Could not read the selected file',
      );
      return;
    }

    context.read<VehicleAttachmentsBloc>().add(
          VehicleAttachmentsEvent.filePicked(
            sourcePath: sourcePath,
            displayName: file.name,
          ),
        );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final VehicleAttachmentsState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.vehicle == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.vehicle == null) {
      return _ErrorBody(message: state.errorMessage);
    }

    if (state.attachments.isEmpty) {
      return const Center(
        child: GarageEmptyState(
          icon: LucideIcons.paperclip,
          message: 'No files attached',
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        0,
        GarageSpacing.screenH,
        24,
      ),
      itemCount: state.attachments.length,
      separatorBuilder: (_, _) => const Padding(
        padding: EdgeInsets.only(top: GarageSpacing.list),
      ),
      itemBuilder: (context, index) {
        final attachment = state.attachments[index];
        return _AttachmentRow(attachment: attachment);
      },
    );
  }
}

class _AttachmentRow extends StatelessWidget {
  const _AttachmentRow({required this.attachment});

  final VehicleAttachment attachment;

  @override
  Widget build(BuildContext context) {
    return GarageAttachmentCard(
      displayName: attachment.displayName,
      createdLabel: GarageDateTimeFormatter.format(attachment.createdAt),
      onTap: () => _openFile(context, attachment.filePath),
      onDelete: () => _confirmDelete(context, attachment),
    );
  }

  Future<void> _openFile(BuildContext context, String filePath) async {
    final result = await OpenFilex.open(filePath);
    if (!context.mounted) return;
    if (result.type != ResultType.done) {
      showGarageErrorDialog(
        context,
        message: 'Could not open file: ${result.message}',
      );
    }
  }

  Future<void> _confirmDelete(
    BuildContext context,
    VehicleAttachment attachment,
  ) async {
    final confirmed = await showGarageConfirmDialog(
      context,
      title: 'Delete file?',
      message:
          '“${attachment.displayName}” will be removed from this vehicle.',
    );
    if (!context.mounted || !confirmed) return;

    context.read<VehicleAttachmentsBloc>().add(
          VehicleAttachmentsEvent.deleteTapped(attachmentId: attachment.id),
        );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GarageSpacing.screenH),
        child: Text(
          message ?? 'Something went wrong',
          style: GarageTextStyles.body(theme, color: theme.destructive),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
