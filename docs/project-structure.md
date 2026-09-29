# Project structure

Carport folder layout: **one directory per layer**, **one directory per screen**
in presentation (BLoC + Freezed event/state + UI together), a separate
**`carport_lint_rules`** package, and an **architecture test** that guards
import boundaries.

## Actual tree

```
carport/
├── AGENTS.md
├── docs/
│   ├── architecture.md
│   ├── project-structure.md          # this file
│   ├── enforcement.md
│   ├── agent-guidelines/             # Dart/Flutter practices
│   ├── *-design-spec.md              # feature specs
│   ├── design-language.md
│   ├── color-themes.md
│   └── api/
├── carport_lint_rules/               # deny-list rules class
│   └── lib/
│       └── layer_import_rules.dart
├── lib/
│   ├── domain/                       # PURE
│   │   ├── entities/
│   │   ├── models/                   # SQL/row models (not Flutter)
│   │   ├── repositories/             # interfaces only
│   │   ├── services/                 # ports (interfaces) to infra
│   │   ├── use_cases/                # currently flat (see note below)
│   │   ├── formatters/
│   │   ├── validators/
│   │   └── mappers/                  # e.g. portal sync payload maps
│   ├── repo/                         # repository implementations
│   ├── db/                           # DatabaseHelper + schema + migrations
│   │   ├── database_helper.dart
│   │   ├── database_schema.dart
│   │   └── database_migrations.dart
│   ├── platform/                     # OS/plugin adapters
│   ├── screens/
│   │   ├── components/
│   │   │   └── garage/               # shared Garage* widgets
│   │   ├── garage/                   # canonical live garage screens
│   │   │   └── <screen>/             # view + BLoC + event/state
│   │   └── settings/                 # settings + connectivity screens
│   ├── router/                       # AppRouter / AppRoutes
│   ├── di/                           # GetIt wiring (di.dart)
│   ├── theme/                        # GarageTheme + app_themes/
│   ├── logger/                       # shared Logger helpers
│   └── main.dart
└── test/
    └── architecture/
        └── layer_import_test.dart
```

## Deviations from the blueprint (documented on purpose)

| Blueprint expectation | Carport today |
|-----------------------|---------------|
| `db/daos/` + `AppDatabase` | Single `DatabaseHelper` owns connection **and** SQL CRUD |
| Use cases under `use_cases/<entity>/` | Existing use cases are **flat** in `use_cases/`; prefer grouping for **new** ones |
| Shared HTTP client completion logging | Portal HTTP in `HttpPortalMonitorApi`; outcome logs in sync/register **use cases** |
| `json_serializable` DTOs | Manual `Map` payloads via `PortalSyncMapper`; SQLite via `domain/models` |
| Only `screens/<feature>/<screen>/` | Live routes use `garage/` + `settings/`. Orphan/duplicate trees also exist under `screens/service/`, `screens/reminders/`, and `screens/home/` — **do not wire new work there**; extend `garage/` / `settings/` |
| Components under `screens/components/` | Shared widgets live in `screens/components/garage/`; lint rules key off that path |
| DI helpers named `_registerSingletons` | Public helpers: `registerDatabase`, `registerRepositories`, `registerUseCases`, `registerScreens`, … via `setupDependencies()` |

## Folder purposes

| Folder | Contains | Never contains |
|--------|----------|----------------|
| `domain/` | Pure business types, interfaces, use cases, models, mappers | Framework, UI, DB, platform imports |
| `repo/` | Repository implementations | UI, routing, DI, state-mgmt |
| `db/` | `DatabaseHelper`, schema, migrations | UI, repo, routing, DI |
| `platform/` | Adapters for OS/plugins (implement domain ports) | UI, repo, db, routing, DI |
| `screens/<feature>/<screen>/` | One screen’s view + BLoC + Freezed event/state (+ generated); private Widget classes may live in `*_view.*` | Separate widget *files*; other screens; data-access / navigation packages |
| `screens/components/garage/` | Shared / reusable UI widgets | Data-access, routing, DI, state-mgmt; screen BLoC/view files |
| `router/` | Route table — every screen registered here | Business logic; ad-hoc unregistered routes |
| `di/`, `theme/`, `logger/` | Cross-cutting wiring, tokens, logging | Business logic |

## Naming conventions

- **One directory per screen.** Every screen gets its own folder under
  `screens/<feature>/`. That folder holds only the screen’s view, BLoC,
  Freezed event/state, and generated parts — no separate widget *files*.
  Example:

  ```
  screens/garage/vehicle_list/
  ├── vehicle_list_view.dart
  ├── vehicle_list_bloc.dart
  ├── vehicle_list_event.dart
  ├── vehicle_list_state.dart
  └── … generated freezed parts
  ```

- **Widget classes:** Prefer small `Widget` subclasses over methods returning
  `Widget`. Screen-only pieces: private classes in `*_view.*`. Shared:
  `screens/components/garage/` only — do not add separate widget files inside a
  screen directory.

- **Presentation files** use consistent suffixes so the enforcement test can key
  rules off them:
  - `*_view.dart` — UI (render + dispatch only; **no navigation**)
  - `*_bloc.dart` — logic + **all navigation** (calls `AppRouter`)
  - `*_event.dart` / `*_state.dart` — Freezed inputs/outputs
  - `*.freezed.dart` — generated (never hand-edit)

- **Navigation & routes:** register every screen in `AppRoutes` /
  `AppRouter` when adding a screen. Only BLoCs navigate — a view that needs to
  leave dispatches an event; the BLoC calls `AppRouter`. Never navigate from
  `*_view.dart` or `screens/components/`, and never use paths that are not
  registered.

- **Use cases**: one class per write/delete (and many reads that need
  orchestration), named `<Verb><Noun>UseCase`. Prefer subdirectories by entity
  or function for **new** work:

  ```
  domain/use_cases/
  ├── vehicle/          # preferred for new code
  │   └── create_or_update_vehicle_use_case.dart
  └── … existing flat files remain until intentionally moved
  ```

- **Repository interfaces** live in `domain/repositories/`; their `...Impl`
  live in `repo/`.
- **Service ports** live in `domain/services/`; adapters live in `platform/`.

## Wiring (DI)

`di/di.dart` constructs concrete implementations and provides them to the
presentation layer. BLoCs receive use cases and repositories via GetIt — they
never construct DB or platform objects directly.

```dart
Future<void> setupDependencies() async {
  await registerDatabase();
  await registerPreferences();
  registerRouter();
  registerPlatformServices();
  registerRepositories();
  registerUseCases();
  registerAppTheme();
  registerScreens();
}
```

Inside each helper, group registrations with comment-marked sections when there
is more than one feature area. Order for singletons: database → repos /
platform adapters → use cases → screen factories.

## Logger setup

Centralize the `logger` package in `lib/logger/logger.dart`. Import it
everywhere — do not create ad-hoc `Logger` instances. See
[architecture.md — Logger setup](architecture.md#logger-setup) for
`PrettyPrinter` configuration. Prefer `logSuccess` / `logFailure` /
`logSkipped` (or `logger.i` / `logger.e` / `logger.w` / `logger.d` per
`AGENTS.md`).
