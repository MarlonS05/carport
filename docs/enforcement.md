# Enforcement — making import boundaries real

Prose in `docs/architecture.md` rots unless something fails the build when it's
violated. Carport enforces the **strict import table** with two artifacts:

1. A **rules class** —
   [`carport_lint_rules/lib/layer_import_rules.dart`](../carport_lint_rules/lib/layer_import_rules.dart)
   — that, given a file path, returns the list of import prefixes that file may
   not contain.
2. A **test** —
   [`test/architecture/layer_import_test.dart`](../test/architecture/layer_import_test.dart)
   — that walks every source file under `lib/`, extracts its imports, and
   asserts none match a denied prefix.

Together with the table in `docs/architecture.md`, these are the **three
sources that must stay in sync**. Change a boundary → change all three in the
same commit.

## 1. The rules class (path-keyed deny-lists)

`LayerImportRules.denialsForFile(path)` returns one of:

| Predicate | Deny list constant |
|-----------|--------------------|
| `/lib/domain/` | `domainDeny` |
| `/lib/repo/` | `repoDeny` |
| `/lib/db/` | `dbDeny` |
| `/lib/platform/` | `platformDeny` |
| `/lib/screens/components/garage/` | `componentDeny` |
| screen `*_view.dart` | `viewDeny` |
| screen `*_bloc.dart` / `*_event.dart` / `*_state.dart` | `blocDeny` |
| otherwise | empty (no restrictions) |

Shape (matches the package):

```
denyListForDomain      = [ flutter, screens, repo, db, platform, router, di, theme, flutter_bloc, go_router ]
denyListForDataAccess  = [ flutter, screens, router, di, flutter_bloc, go_router ]
denyListForPersistence = [ flutter, screens, repo, router, di, flutter_bloc, go_router ]
denyListForInfra       = [ screens, repo, db, router, di, flutter_bloc, go_router ]
denyListForView        = [ repo, db, router, di, go_router ]
denyListForController  = [ repo, db, go_router, sqflite, image_picker, file_picker, open_filex, mobile_scanner, url_launcher, http, local_auth ]
denyListForComponent   = [ repo, db, router, di, flutter_bloc, go_router ]

function denialsForFile(path):
    if path under domainDir:            return denyListForDomain
    if path under dataAccessDir:        return denyListForDataAccess
    if path under persistenceDir:       return denyListForPersistence
    if path under infraDir:             return denyListForInfra
    if path under sharedComponentsDir:  return denyListForComponent
    if path is a presentation file:
        if path ends with _view.dart:        return denyListForView
        if path ends with _bloc/_event/_state: return denyListForController
    return []   # no restrictions

function importMatchesDenial(importUri, denialPrefix):
    return importUri startsWith denialPrefix   # plus intra-package suffix handling
```

Keep the deny-lists as plain constants keyed by `denialsForFile(path)` so the
mapping between file location and its rules is obvious and greppable.

## 2. The test (walk sources, assert no denied imports)

`test/architecture/layer_import_test.dart` walks `lib/**/*.dart`, skips files
with an empty denial list, and fails with every violating import line listed.

```bash
flutter test test/architecture/layer_import_test.dart
```

Run it in CI and locally (also listed under Verify in `AGENTS.md`). Because the
rules class is shared between the test and any future editor-integrated linter,
there is exactly one definition of the boundaries.

## 3. The sync rule

The `docs/architecture.md` strict import table, the rules-class deny-lists, and
the test must agree. If they disagree, **the table is the spec** and the other
two are bugs. Make boundary changes as one commit touching all three.

## Adapting to other ecosystems

The pattern (path predicate → deny-list → build-failing check) ports directly:

| Ecosystem | Mechanism |
|-----------|-----------|
| Dart / Flutter | Custom rules class + a `flutter test` that walks `lib/` (this project). |
| TypeScript / JS | `eslint-plugin-boundaries` or `eslint-plugin-import` `no-restricted-paths`; zones map to layers. |
| Python | `import-linter` contracts (`forbidden` / `layers` contract types). |
| Java / Kotlin | ArchUnit `layeredArchitecture()` / `noClasses().should().dependOnClassesThat()`. |
| Go | `depguard` / `go-arch-lint`. |

Whatever the tool, keep the source of truth human-readable in
`docs/architecture.md` and mechanically checked in CI.
