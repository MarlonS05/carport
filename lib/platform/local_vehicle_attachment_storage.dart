import 'dart:io';

import 'package:carport/domain/services/vehicle_attachment_storage.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class LocalVehicleAttachmentStorage implements VehicleAttachmentStorage {
  @override
  Future<String> copyIntoStore({
    required String vehicleId,
    required String attachmentId,
    required String sourcePath,
    required String displayName,
  }) async {
    // #endregion
    final sourceFile = File(sourcePath);
    if (!await sourceFile.exists()) {
      throw StateError('Source file does not exist: $sourcePath');
    }

    final extension = p.extension(displayName);
    final supportDir = await getApplicationSupportDirectory();
    final targetDir = Directory(
      p.join(supportDir.path, 'vehicle_attachments', vehicleId),
    );
    await targetDir.create(recursive: true);

    final targetPath = p.join(targetDir.path, '$attachmentId$extension');
    await sourceFile.copy(targetPath);

    return targetPath;
  }

  @override
  Future<void> deleteFile(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  @override
  Future<void> deleteAllForVehicle(String vehicleId) async {
    final dir = await _vehicleDirectory(vehicleId);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }

  Future<Directory> _vehicleDirectory(String vehicleId) async {
    final supportDir = await getApplicationSupportDirectory();
    return Directory(
      p.join(supportDir.path, 'vehicle_attachments', vehicleId),
    );
  }
}
