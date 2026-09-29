import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:carport/domain/entities/portal_attachment_ids_sync_result.dart';
import 'package:carport/domain/entities/portal_bulk_sync_result.dart';
import 'package:carport/domain/entities/portal_checkin_result.dart';
import 'package:carport/domain/entities/portal_permissions_sync_result.dart';
import 'package:carport/domain/formatters/portal_api_datetime_formatter.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:http/http.dart' as http;

class HttpPortalMonitorApi implements PortalMonitorApi {
  HttpPortalMonitorApi({
    required http.Client client,
    this.requestTimeout = const Duration(seconds: 15),
  }) : _client = client;

  final http.Client _client;
  final Duration requestTimeout;

  @override
  Future<String> register({required String apiBaseUrl}) async {
    final response = await _get(Uri.parse('$apiBaseUrl/register'));
    return _parseResponse(_parseRegisterId, response.body);
  }

  @override
  Future<PortalBulkSyncResult> syncVehicles({
    required String apiBaseUrl,
    required String mobileId,
    required List<Map<String, dynamic>> vehicles,
  }) async {
    final uri = Uri.parse('$apiBaseUrl/vehicles/sync');
    final response = await _post(
      uri: uri,
      mobileId: mobileId,
      body: {'vehicles': vehicles},
    );
    return _parseResponse(_parseBulkSyncResult, response.body);
  }

  @override
  Future<PortalBulkSyncResult> syncServiceItems({
    required String apiBaseUrl,
    required String mobileId,
    required List<Map<String, dynamic>> serviceItems,
  }) async {
    final uri = Uri.parse('$apiBaseUrl/service-items/sync');
    final response = await _post(
      uri: uri,
      mobileId: mobileId,
      body: {'service_items': serviceItems},
    );
    return _parseResponse(_parseBulkSyncResult, response.body);
  }

  @override
  Future<PortalPermissionsSyncResult> syncPermissions({
    required String apiBaseUrl,
    required String mobileId,
    required List<int> userIds,
  }) async {
    final uri = Uri.parse('$apiBaseUrl/permissions/sync');
    final response = await _post(
      uri: uri,
      mobileId: mobileId,
      body: {'user_ids': userIds},
    );
    return _parseResponse(_parsePermissionsSyncResult, response.body);
  }

  @override
  Future<PortalAttachmentIdsSyncResult> syncAttachmentIds({
    required String apiBaseUrl,
    required String mobileId,
    required List<String> attachmentIds,
  }) async {
    final uri = Uri.parse('$apiBaseUrl/attachments/sync');
    final response = await _post(
      uri: uri,
      mobileId: mobileId,
      body: {'attachment_ids': attachmentIds},
    );
    return _parseResponse(_parseAttachmentIdsSyncResult, response.body);
  }

  @override
  Future<PortalCheckinResult> checkin({
    required String apiBaseUrl,
    required DateTime updatedAt,
  }) async {
    final formatted = PortalApiDateTimeFormatter.formatUpdatedAt(updatedAt);
    final encoded = Uri.encodeComponent(formatted);
    final uri = Uri.parse('$apiBaseUrl/checkin/$encoded');
    final response = await _get(uri);
    return _parseResponse(_parseCheckinResult, response.body);
  }

  @override
  Future<void> uploadAttachment({
    required String apiBaseUrl,
    required String mobileId,
    required String vehicleId,
    required String attachmentId,
    required String filePath,
    required String filename,
  }) async {
    final uri = Uri.parse('$apiBaseUrl/vehicles/$vehicleId/attachments');
    await _postMultipart(
      uri: uri,
      mobileId: mobileId,
      fields: {'id': attachmentId},
      fileField: 'file',
      filePath: filePath,
      filename: filename,
    );
  }

  T _parseResponse<T>(T Function(String body) parser, String body) {
    try {
      return parser(body);
    } on PortalMonitorApiException {
      rethrow;
    } on FormatException {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }
  }

  Future<http.Response> _get(Uri uri) async {
    try {
      final response = await _client
          .get(
            uri,
            headers: const {'Accept': 'application/json'},
          )
          .timeout(requestTimeout);

      if (response.statusCode != 200) {
        throw _apiErrorFromResponse(
          method: 'GET',
          uri: uri,
          statusCode: response.statusCode,
          body: response.body,
        );
      }

      return response;
    } on PortalMonitorApiException {
      rethrow;
    } on TimeoutException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on SocketException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on HttpException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on FormatException {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }
  }

  Future<http.Response> _post({
    required Uri uri,
    required String mobileId,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _client
          .post(
            uri,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'X-Mobile-Id': mobileId,
            },
            body: jsonEncode(body),
          )
          .timeout(requestTimeout);

      if (response.statusCode != 200) {
        throw _apiErrorFromResponse(
          method: 'POST',
          uri: uri,
          statusCode: response.statusCode,
          body: response.body,
        );
      }

      return response;
    } on PortalMonitorApiException {
      rethrow;
    } on TimeoutException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on SocketException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on HttpException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on FormatException {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }
  }

  Future<http.Response> _postMultipart({
    required Uri uri,
    required String mobileId,
    required Map<String, String> fields,
    required String fileField,
    required String filePath,
    required String filename,
  }) async {
    try {
      final request = http.MultipartRequest('POST', uri)
        ..headers['Accept'] = 'application/json'
        ..headers['X-Mobile-Id'] = mobileId
        ..fields.addAll(fields)
        ..files.add(
          await http.MultipartFile.fromPath(
            fileField,
            filePath,
            filename: filename,
          ),
        );

      final streamed = await _client.send(request).timeout(requestTimeout);
      final response = await http.Response.fromStream(streamed);

      if (response.statusCode != 201) {
        throw _apiErrorFromResponse(
          method: 'POST',
          uri: uri,
          statusCode: response.statusCode,
          body: response.body,
        );
      }

      return response;
    } on PortalMonitorApiException {
      rethrow;
    } on TimeoutException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on SocketException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on HttpException {
      throw const PortalMonitorApiException('Monitor unreachable');
    } on FormatException {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }
  }

  Never _apiErrorFromResponse({
    required String method,
    required Uri uri,
    required int statusCode,
    required String body,
  }) {
    var message = 'Monitor returned status $statusCode';
    Map<String, List<String>>? errors;

    try {
      final decoded = jsonDecode(body);
      if (decoded is Map<String, dynamic>) {
        final apiMessage = decoded['message'];
        if (apiMessage is String && apiMessage.isNotEmpty) {
          message = apiMessage;
        }

        final rawErrors = decoded['errors'];
        if (rawErrors is Map) {
          final parsedErrors = <String, List<String>>{};
          for (final entry in rawErrors.entries) {
            final value = entry.value;
            if (value is List) {
              parsedErrors[entry.key.toString()] =
                  value.map((item) => item.toString()).toList();
            }
          }
          if (parsedErrors.isNotEmpty) {
            errors = parsedErrors;
          }
        }
      }
    } on FormatException {
      // Keep fallback message when the error body is not JSON.
    }

    throw PortalMonitorApiException(
      message,
      statusCode: statusCode,
      errors: errors,
    );
  }

  String _parseRegisterId(String body) {
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }
    final id = decoded['id'];
    if (id is! String || id.isEmpty) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }
    return id;
  }

  PortalBulkSyncResult _parseBulkSyncResult(String body) {
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final created = decoded['created'];
    final updated = decoded['updated'];
    final ignored = decoded['ignored'];
    final rawItems = decoded['items'];

    if (created is! num || updated is! num || ignored is! num) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }
    if (rawItems is! List) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final items = <PortalBulkSyncItemResult>[];
    for (final rawItem in rawItems) {
      if (rawItem is! Map<String, dynamic>) {
        throw const PortalMonitorApiException('Invalid response from monitor');
      }
      final id = rawItem['id'];
      final status = rawItem['status'];
      if (id is! String || status is! String) {
        throw const PortalMonitorApiException('Invalid response from monitor');
      }
      items.add(PortalBulkSyncItemResult(id: id, status: status));
    }

    return PortalBulkSyncResult(
      created: created.toInt(),
      updated: updated.toInt(),
      ignored: ignored.toInt(),
      items: items,
    );
  }

  PortalPermissionsSyncResult _parsePermissionsSyncResult(String body) {
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final synced = decoded['synced'];
    final rawUserIds = decoded['user_ids'];
    if (synced is! num || rawUserIds is! List) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final userIds = <int>[];
    for (final rawId in rawUserIds) {
      if (rawId is! num) {
        throw const PortalMonitorApiException('Invalid response from monitor');
      }
      userIds.add(rawId.toInt());
    }

    return PortalPermissionsSyncResult(
      synced: synced.toInt(),
      userIds: userIds,
    );
  }

  PortalAttachmentIdsSyncResult _parseAttachmentIdsSyncResult(String body) {
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final deleted = decoded['deleted'];
    final rawAttachmentIds = decoded['attachment_ids'];
    if (deleted is! num || rawAttachmentIds is! List) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final attachmentIds = <String>[];
    for (final rawId in rawAttachmentIds) {
      if (rawId is! String) {
        throw const PortalMonitorApiException('Invalid response from monitor');
      }
      attachmentIds.add(rawId);
    }

    return PortalAttachmentIdsSyncResult(
      deleted: deleted.toInt(),
      attachmentIds: attachmentIds,
    );
  }

  PortalCheckinResult _parseCheckinResult(String body) {
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final isDatabaseSync = decoded['isDatabaseSync'];
    final rawUsers = decoded['users'];
    if (isDatabaseSync is! bool || rawUsers is! Map) {
      throw const PortalMonitorApiException('Invalid response from monitor');
    }

    final users = <int, String>{};
    for (final entry in rawUsers.entries) {
      final id = int.tryParse(entry.key.toString());
      final name = entry.value;
      if (id == null || name is! String) {
        throw const PortalMonitorApiException('Invalid response from monitor');
      }
      users[id] = name;
    }

    return PortalCheckinResult(
      isDatabaseSync: isDatabaseSync,
      users: users,
    );
  }
}
