import 'dart:io';

import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/platform/http_portal_monitor_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  const apiBaseUrl = 'https://monitor.example.com/api';
  const mobileId = '550e8400-e29b-41d4-a716-446655440000';
  const vehicleId = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';

  group('register', () {
    test('parses 200 register response', () async {
      final client = MockClient((request) async {
        expect(request.url.toString(), '$apiBaseUrl/register');
        expect(request.headers['accept'], 'application/json');
        return http.Response('{"id": "$mobileId"}', 200);
      });
      final api = HttpPortalMonitorApi(client: client);

      final result = await api.register(apiBaseUrl: apiBaseUrl);

      expect(result, mobileId);
    });

    test('throws on non-200 status with fallback message', () async {
      final client = MockClient((request) async {
        return http.Response('Not Found', 404);
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.register(apiBaseUrl: apiBaseUrl),
        throwsA(
          isA<PortalMonitorApiException>()
              .having((e) => e.statusCode, 'statusCode', 404)
              .having(
                (e) => e.message,
                'message',
                'Monitor returned status 404',
              )
              .having((e) => e.errors, 'errors', isNull),
        ),
      );
    });

    test('throws on invalid JSON', () async {
      final client = MockClient((request) async {
        return http.Response('not json', 200);
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.register(apiBaseUrl: apiBaseUrl),
        throwsA(
          isA<PortalMonitorApiException>().having(
            (e) => e.message,
            'message',
            'Invalid response from monitor',
          ),
        ),
      );
    });

    test('throws on missing id field', () async {
      final client = MockClient((request) async {
        return http.Response('{"uuid": "$mobileId"}', 200);
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.register(apiBaseUrl: apiBaseUrl),
        throwsA(isA<PortalMonitorApiException>()),
      );
    });

    test('throws on empty id', () async {
      final client = MockClient((request) async {
        return http.Response('{"id": ""}', 200);
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.register(apiBaseUrl: apiBaseUrl),
        throwsA(isA<PortalMonitorApiException>()),
      );
    });
  });

  group('syncVehicles', () {
    test('posts vehicles with X-Mobile-Id and parses bulk sync response', () async {
      final client = MockClient((request) async {
        expect(request.url.toString(), '$apiBaseUrl/vehicles/sync');
        expect(request.method, 'POST');
        expect(request.headers['x-mobile-id'], mobileId);
        expect(request.headers['content-type'], 'application/json');
        expect(
          request.body,
          '{"vehicles":[{"id":"$vehicleId","name":"Mazda"}]}',
        );
        return http.Response(
          '{"created":1,"updated":0,"ignored":0,"items":[{"id":"$vehicleId","status":"created"}]}',
          200,
        );
      });
      final api = HttpPortalMonitorApi(client: client);

      final result = await api.syncVehicles(
        apiBaseUrl: apiBaseUrl,
        mobileId: mobileId,
        vehicles: [
          {'id': vehicleId, 'name': 'Mazda'},
        ],
      );

      expect(result.created, 1);
      expect(result.updated, 0);
      expect(result.ignored, 0);
      expect(result.items, hasLength(1));
      expect(result.items.first.id, vehicleId);
      expect(result.items.first.status, 'created');
    });

    test('throws on 422 validation error with API message only', () async {
      final client = MockClient((request) async {
        return http.Response('{"message":"validation failed"}', 422);
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.syncVehicles(
          apiBaseUrl: apiBaseUrl,
          mobileId: mobileId,
          vehicles: const [],
        ),
        throwsA(
          isA<PortalMonitorApiException>()
              .having((e) => e.statusCode, 'statusCode', 422)
              .having((e) => e.message, 'message', 'validation failed')
              .having((e) => e.errors, 'errors', isNull),
        ),
      );
    });

    test('throws on 422 validation error with Laravel error shape', () async {
      final client = MockClient((request) async {
        return http.Response(
          '{"message":"The mobile id field is required.","errors":{"mobile_id":["The mobile id field is required."]}}',
          422,
        );
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.syncVehicles(
          apiBaseUrl: apiBaseUrl,
          mobileId: mobileId,
          vehicles: const [],
        ),
        throwsA(
          isA<PortalMonitorApiException>()
              .having((e) => e.statusCode, 'statusCode', 422)
              .having(
                (e) => e.message,
                'message',
                'The mobile id field is required.',
              )
              .having(
                (e) => e.errors,
                'errors',
                {
                  'mobile_id': ['The mobile id field is required.'],
                },
              )
              .having(
                (e) => e.toString(),
                'toString',
                'The mobile id field is required. (HTTP 422) — errors: {mobile_id: [The mobile id field is required.]}',
              ),
        ),
      );
    });
  });

  group('syncServiceItems', () {
    test('posts service items with X-Mobile-Id', () async {
      final client = MockClient((request) async {
        expect(request.url.toString(), '$apiBaseUrl/service-items/sync');
        expect(request.headers['x-mobile-id'], mobileId);
        return http.Response(
          '{"created":1,"updated":0,"ignored":0,"items":[]}',
          200,
        );
      });
      final api = HttpPortalMonitorApi(client: client);

      final result = await api.syncServiceItems(
        apiBaseUrl: apiBaseUrl,
        mobileId: mobileId,
        serviceItems: [
          {
            'id': 's1',
            'vehicle_id': vehicleId,
            'title': 'OIL',
            'mileage': 1000,
            'mileage_unit': 'km',
            'occurred_at': '2026-03-04',
          },
        ],
      );

      expect(result.created, 1);
    });
  });

  group('checkin', () {
    test('parses checkin response with URL-encoded updated_at', () async {
      final updatedAt = DateTime.utc(2026, 7, 8, 10, 15, 30);
      final client = MockClient((request) async {
        expect(
          request.url.toString(),
          '$apiBaseUrl/checkin/2026-07-08T10%3A15%3A30Z',
        );
        return http.Response(
          '{"users":{"1":"Alex Morgan","2":"Jordan Lee"},"isDatabaseSync":true}',
          200,
        );
      });
      final api = HttpPortalMonitorApi(client: client);

      final result = await api.checkin(
        apiBaseUrl: apiBaseUrl,
        updatedAt: updatedAt,
      );

      expect(result.isDatabaseSync, isTrue);
      expect(result.users, {1: 'Alex Morgan', 2: 'Jordan Lee'});
    });

    test('throws on malformed checkin response', () async {
      final client = MockClient((request) async {
        return http.Response('{"isDatabaseSync":"yes"}', 200);
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.checkin(
          apiBaseUrl: apiBaseUrl,
          updatedAt: DateTime.utc(2026, 1, 1),
        ),
        throwsA(isA<PortalMonitorApiException>()),
      );
    });
  });

  group('syncPermissions', () {
    test('posts user_ids with X-Mobile-Id and parses response', () async {
      final client = MockClient((request) async {
        expect(request.url.toString(), '$apiBaseUrl/permissions/sync');
        expect(request.method, 'POST');
        expect(request.headers['x-mobile-id'], mobileId);
        expect(request.body, '{"user_ids":[1,2]}');
        return http.Response('{"synced":2,"user_ids":[1,2]}', 200);
      });
      final api = HttpPortalMonitorApi(client: client);

      final result = await api.syncPermissions(
        apiBaseUrl: apiBaseUrl,
        mobileId: mobileId,
        userIds: const [1, 2],
      );

      expect(result.synced, 2);
      expect(result.userIds, [1, 2]);
    });
  });

  group('syncAttachmentIds', () {
    test('posts attachment_ids with X-Mobile-Id and parses response', () async {
      final client = MockClient((request) async {
        expect(request.url.toString(), '$apiBaseUrl/attachments/sync');
        expect(request.method, 'POST');
        expect(request.headers['x-mobile-id'], mobileId);
        expect(request.body, '{"attachment_ids":["a1","a2"]}');
        return http.Response(
          '{"deleted":1,"attachment_ids":["d4e5f6a7-b8c9-0123-def0-234567890123"]}',
          200,
        );
      });
      final api = HttpPortalMonitorApi(client: client);

      final result = await api.syncAttachmentIds(
        apiBaseUrl: apiBaseUrl,
        mobileId: mobileId,
        attachmentIds: const ['a1', 'a2'],
      );

      expect(result.deleted, 1);
      expect(
        result.attachmentIds,
        ['d4e5f6a7-b8c9-0123-def0-234567890123'],
      );
    });

    test('accepts empty attachment_ids list', () async {
      final client = MockClient((request) async {
        expect(request.body, '{"attachment_ids":[]}');
        return http.Response('{"deleted":2,"attachment_ids":["a1","a2"]}', 200);
      });
      final api = HttpPortalMonitorApi(client: client);

      final result = await api.syncAttachmentIds(
        apiBaseUrl: apiBaseUrl,
        mobileId: mobileId,
        attachmentIds: const [],
      );

      expect(result.deleted, 2);
      expect(result.attachmentIds, ['a1', 'a2']);
    });
  });

  group('uploadAttachment', () {
    const attachmentId = 'b2c3d4e5-f6a7-8901-bcde-f12345678901';

    test('posts multipart attachment with X-Mobile-Id and accepts 201', () async {
      final tempFile = File('${Directory.systemTemp.path}/carport-upload-test.pdf');
      await tempFile.writeAsBytes(const [1, 2, 3]);

      addTearDown(() async {
        if (await tempFile.exists()) {
          await tempFile.delete();
        }
      });

      final client = MockClient((request) async {
        expect(
          request.url.toString(),
          '$apiBaseUrl/vehicles/$vehicleId/attachments',
        );
        expect(request.method, 'POST');
        expect(request.headers['x-mobile-id'], mobileId);
        expect(request.headers['accept'], 'application/json');
        return http.Response(
          '{"id":"$attachmentId","vehicle_id":"$vehicleId","original_filename":"receipt.pdf","mime_type":"application/pdf","size":3,"created_at":"2026-07-09T08:30:00Z"}',
          201,
        );
      });
      final api = HttpPortalMonitorApi(client: client);

      await api.uploadAttachment(
        apiBaseUrl: apiBaseUrl,
        mobileId: mobileId,
        vehicleId: vehicleId,
        attachmentId: attachmentId,
        filePath: tempFile.path,
        filename: 'receipt.pdf',
      );
    });

    test('throws on 422 validation error with API message', () async {
      final tempFile = File('${Directory.systemTemp.path}/carport-upload-invalid.pdf');
      await tempFile.writeAsBytes(const [1]);

      addTearDown(() async {
        if (await tempFile.exists()) {
          await tempFile.delete();
        }
      });

      final client = MockClient((request) async {
        return http.Response(
          '{"message":"The attachment file must be a JPEG, PNG, GIF, WebP image, or PDF."}',
          422,
        );
      });
      final api = HttpPortalMonitorApi(client: client);

      expect(
        () => api.uploadAttachment(
          apiBaseUrl: apiBaseUrl,
          mobileId: mobileId,
          vehicleId: vehicleId,
          attachmentId: attachmentId,
          filePath: tempFile.path,
          filename: 'receipt.pdf',
        ),
        throwsA(
          isA<PortalMonitorApiException>()
              .having((e) => e.statusCode, 'statusCode', 422)
              .having(
                (e) => e.message,
                'message',
                'The attachment file must be a JPEG, PNG, GIF, WebP image, or PDF.',
              ),
        ),
      );
    });
  });
}
