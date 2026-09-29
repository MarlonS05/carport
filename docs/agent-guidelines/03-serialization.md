# JSON / row serialization

Carport does **not** use `json_annotation` / `json_serializable` today.
Prefer the patterns already in the repo:

| Concern | Where | Pattern |
|---------|-------|---------|
| SQLite rows | `domain/models/*_model.dart` | `fromMap` / `toMap` (and entity mappers) |
| Portal HTTP bodies | `domain/mappers/portal_sync_mapper.dart` | Manual `Map<String, dynamic>` with snake_case keys |
| HTTP transport | `platform/http_portal_monitor_api.dart` | `dart:convert` `jsonEncode` / decode |

If you introduce `json_serializable` later, keep DTOs on the **repo / platform**
path (or a dedicated DTO folder), map to domain entities before crossing into
BLoCs, and do not put generated JSON types inside `db/` as a substitute for
SQL helpers.

```dart
// Current style — portal payload (snake_case keys, manual map)
static Map<String, dynamic> vehicleToJson(
  Vehicle vehicle,
  DistanceUnit distanceUnit,
  DateTime updatedAt,
) {
  return {
    'id': vehicle.id,
    'name': vehicle.name,
    'mileage': vehicle.mileage.round(),
    'mileage_unit': /* … */,
    'updated_at': PortalApiDateTimeFormatter.formatUpdatedAt(updatedAt),
  };
}
```

- After changing Freezed event/state (or any future codegen annotations), run
  `dart run build_runner build --delete-conflicting-outputs`.
- Persistence stays on `DatabaseHelper` today (no separate DAO layer yet).
  Helpers return **models**; repository impls map model ↔ domain entity.
- Do not put serialization or SQL mapping in BLoCs or views.

**Exception vs blueprint:** the blueprint assumes `json_serializable` DTOs and
per-table DAOs. Carport wins with the table above until those are adopted
deliberately (update `docs/architecture.md` + enforcement if/when they are).
