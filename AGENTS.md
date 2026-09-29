# AGENTS.md — Carport

Flutter car-maintenance tracker. Read `docs/architecture.md` and the relevant
`docs/*-design-spec.md` before making changes. For Dart/Flutter practices, see
`docs/agent-guidelines/`.

## Architecture & layers

- **Layers:** `domain/` (entities, models, repositories, services/ports, use
  cases, formatters, validators, mappers) · `repo/` (repository impls) · `db/`
  (SQLite via `DatabaseHelper`) · `platform/` (OS/plugin adapters) · `screens/`
  (views + BLoCs) · `router/`, `di/`, `theme/`, `logger/`.
- **BLoC** talks to a **use case** for writes/deletes and to a **repository**
  for simple reads.
- **All navigation happens in BLoCs** — views only dispatch events; never call
  the router or navigator from a view/widget. BLoCs navigate via `AppRouter` —
  never `context.push` / `context.go` from a view.
- **Register every screen in `router/`** — each screen has a route entry in
  `AppRoutes` / `AppRouter`; BLoCs navigate only via those registered routes
  (never ad-hoc paths or view-level navigation).
- **No plugins in BLoCs** (no `sqflite`, `image_picker`, `file_picker`,
  `open_filex`, `mobile_scanner`, `url_launcher`, `http`, `local_auth`, etc.).
- **`lib/domain/` must not import** `package:flutter/`, `screens/`, `repo/`,
  `db/`, `platform/`, `router/`, `di/`, `theme/`, `flutter_bloc/`, or
  `go_router/`.
- Import boundaries are enforced by `carport_lint_rules` and
  `test/architecture/layer_import_test.dart`. Update both (and
  `docs/architecture.md`) if boundaries change. See `docs/enforcement.md`.

## Conventions

- **One directory per screen** under `screens/<feature>/<screen>/` — BLoC,
  Freezed event/state, and UI (`*_view`) live together; never share a folder
  across screens (see `docs/project-structure.md`). Canonical live screens are
  under `screens/garage/` and `screens/settings/`.
- **Widget classes.** Prefer `Widget` classes over helper methods that return
  a `Widget`. Screen-specific private widgets live in the same `*_view.*`
  file; shared widgets live under `screens/components/garage/` (see
  `docs/project-structure.md`). Prefer `StatelessWidget` before
  `StatefulWidget`.
- **Dart/Flutter practices.** Interaction, tooling, style, serialization,
  testing, layout/assets, and dartdoc — see `docs/agent-guidelines/`.
- **Use cases** under `domain/use_cases/` — prefer grouping by entity/function
  when adding new ones (see `docs/project-structure.md`). Existing use cases
  are still flat; do not invent a reshuffle unless asked.
- **DI registration split by kind** in `di/di.dart` —
  `registerDatabase` / `registerPreferences` / `registerPlatformServices` /
  `registerRepositories` / `registerUseCases` / `registerScreens` (etc.),
  with comment-marked sections inside; call them from `setupDependencies()`
  in `main` before `runApp` (see `docs/project-structure.md`).
- **Routes + navigation.** Register every new screen and its route in
  `router/`. Views dispatch navigation-intent events; the BLoC calls
  `AppRouter` for that registered route. No `context.go` / `Navigator` /
  router imports in `*_view.*` or shared components.
- **Keep docs in sync.** When you add or change functionality, structure, or
  layer boundaries, update the relevant docs in the same change — especially
  `docs/architecture.md`, affected `docs/*-design-spec.md`, and enforcement
  artifacts (lint rules, architecture tests) when boundaries change.
- State classes use **freezed**; run
  `dart run build_runner build --delete-conflicting-outputs` after editing
  `*_event.dart` / `*_state.dart`.
- UI uses `GarageTheme` / `GarageTextStyles` / `GarageSpacing` / `GarageRadius`
  tokens (`lib/theme/garage_theme.dart`). Errors via `BlocConsumer` +
  `showGarageErrorDialog`.
- SQLite migrations: add an entry to `migrations` in
  `lib/db/database_migrations.dart`, bump `databaseVersion`, and mirror
  additive changes in `createSchemaV1` (`database_schema.dart`) for fresh
  installs.
- Shared logger in `lib/logger/` — prefer `logSuccess` / `logFailure` /
  `logSkipped` (or `logger.i` / `logger.e` / `logger.w`). Temporary diagnostic
  logs while investigating: `logger.d` only — remove before considering work
  done. Portal/HTTP outcome logs today live in use cases (not a shared HTTP
  client interceptor); see `docs/architecture.md`.

## Reminders

Reminders fire OS local notifications. A reminder is one-time
(`repeatFrequency == null`) or repeating (`daily`/`weekly`/`monthly`/`yearly`).
Recurrence maps to the plugin's native `DateTimeComponents` via
`matchDateTimeComponents` on `zonedSchedule` — the app does **not** manually
reschedule after each fire. There is no mileage/free-text interval. See
`docs/reminders-design-spec.md`.

## Commits

Use this format for commit messages (English):

```
[type] Complete sentence. Resolves: #123
```

`Resolves: #123` is optional when a commit closes an issue.

| Type | Use for |
|------|---------|
| `feat` | Feature |
| `fix` | Bug fix |
| `style` | Styling |
| `refrac` | Code improvement / refactor |
| `test` | Automated tests |
| `docs` | Documentation |
| `project` | Project configuration |
| `perf` | Performance |
| `wip` | Work in progress |

Example: `[feat] Add reminder recurrence dropdown. Resolves: #42`

## Verify

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test test/architecture/layer_import_test.dart
```
