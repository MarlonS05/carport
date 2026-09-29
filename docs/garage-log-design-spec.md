# Garage Log — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: garage-log
  product_name: Carport / Garage Log
  source: N/A
  target_platform: Flutter (carport repo)
  status: not yet specified
-->

> **Purpose:** Placeholder for a consolidated Garage Log feature design spec.
> **Audience:** Coding agents and contributors. Follow `AGENTS.md` and
> `docs/architecture.md` before writing code.

---

## Document map

| § | Section |
|---|---------|
| 0 | [Repo conventions](#0-repo-conventions) |
| 1 | [Feature overview](#1-feature-overview) |
| 7 | [Out of scope](#7-out-of-scope) |
| A | [Implementation checklist](#appendix-a-implementation-checklist) |

---

## 0. Repo conventions

| Rule | This feature |
|------|--------------|
| BLoC + freezed | Not yet specified as a single feature doc — see live screens under `lib/screens/garage/` |
| All screens registered in `AppRouter` | Existing garage routes in `lib/router/app_router.dart` |
| All navigation in BLoCs | Views dispatch events only; BLoC calls `AppRouter` |
| Widget classes | Shared widgets under `screens/components/garage/` |
| Infra I/O | Repositories + platform ports as used by existing garage screens |
| Persistence | SQLite via `DatabaseHelper` / repository impls |
| Writes | Existing `CreateOrUpdate*` / `Delete*` use cases |
| Errors | `BlocConsumer` + `showGarageErrorDialog` |
| Theme | `GarageTheme` tokens |

**Replaces:** N/A.

**Reference implementations:** `lib/screens/garage/home/`,
`lib/screens/garage/vehicle_list/`, `lib/screens/garage/service_log/`.

---

## 1. Feature overview

**Not yet specified** in this document.

Shipped garage behavior (vehicles, service log, quick entry, attachments,
home dashboard) lives under `lib/screens/garage/` and related domain/repo
types. Do **not** invent a new Garage Log product surface from this stub —
extend code and write this spec when consolidating or redesigning those
screens. Prefer code + `docs/design-language.md` / `docs/color-themes.md` over
guessing.

---

## 7. Out of scope

Anything not already implemented under `lib/screens/garage/` or covered by
`docs/reminders-design-spec.md`, `docs/settings-design-spec.md`, or
`docs/connectivity-design-spec.md`.

---

## Appendix A. Implementation checklist

```
[ ] Author full Garage Log design spec from live screens (when requested)
[ ] Keep AGENT METADATA + routes/BLoCs in sync with AppRouter / DI
[ ] Verify: analyzer + architecture import test (on change)
```
