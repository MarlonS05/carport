# MPG Tracker — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: mpg
  product_name: Carport / Garage Log
  source: N/A
  target_platform: Flutter (carport repo)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for the MPG Tracker fill-up entry
> and per-vehicle history visualization in Carport.
> **Audience:** Coding agents and contributors. Follow `AGENTS.md` and
> `docs/architecture.md` before writing code.

---

## Document map

| § | Section |
|---|---------|
| 0 | [Repo conventions](#0-repo-conventions) |
| 1 | [Feature overview](#1-feature-overview) |
| 2 | [Data model](#2-data-model) |
| 3 | [Component reuse](#3-component-reuse) |
| 4 | [Screens](#4-screens) |
| 5 | [Navigation & state](#5-navigation--state) |
| 6 | [Interaction & tokens](#6-interaction--tokens) |
| 7 | [Out of scope](#7-out-of-scope) |
| A | [Implementation checklist](#appendix-a-implementation-checklist) |

---

## 0. Repo conventions

| Rule | This feature |
|------|--------------|
| BLoC + freezed | `MpgSelectBloc`, `MpgFormBloc`, `MpgHistoryBloc` |
| All screens registered in `AppRouter` | `/garage/mpg`, `/garage/mpg/:vehicleId/form`, `/garage/vehicles/:vehicleId/mpg` |
| All navigation in BLoCs | Views dispatch events only; BLoC calls `AppRouter` — never navigate from views |
| Widget classes | Screen-specific private widgets in `*_view.dart`; shared under `screens/components/garage/` |
| Persistence | `MpgEntryRepository` + `CreateMpgEntryUseCase`; SQLite table `mpg_entries` (migration v8) |
| Writes | Use case only — BLoCs do not write DB directly |
| Reads (history) | `MpgEntryRepository.getByVehicleId`; aggregates via `FuelEconomyCalculator` |
| Distance unit | Label suffix from `GetDistanceUnitUseCase`; snapshot stored on each entry |
| Errors | `BlocConsumer` + `showGarageErrorDialog` when `errorMessage` is set |
| Theme | `GarageTheme` / `GarageTextStyles` / `GarageSpacing` / `GarageRadius` |

**Reference implementations:** `lib/screens/garage/quick_entry_select/`,
`lib/screens/garage/quick_entry_form/`, `lib/screens/garage/service_log/`.

---

## 1. Feature overview

Users log full-tank fill-ups (liters + distance since last fill) and review
efficiency over time on a per-vehicle history screen.

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Select vehicle | `/garage/mpg` | Select Vehicle |
| Log fill-up | `/garage/mpg/:vehicleId/form` | Log Fill-Up |
| History | `/garage/vehicles/:vehicleId/mpg` | MPG History |

Entry points:

- Home **MPG** tile (first row, next to Quick Entry; success-colored accent) →
  select → form (logging only).
- Vehicle detail **MPG HISTORY** row (below Service Log) → history.

### 1.2 Flows

- **Log fill-up:** Form save → `CreateMpgEntryUseCase` → `AppRouter.goHome()`.
- **History:** Vehicle detail → history; unit switch is session-only on that
  screen.
- **Back:** TopBar → BLoC `backTapped` → `AppRouter.pop()`.
- **Accuracy note:** Form shows a static note that the tracker only works if
  the tank is always filled to the top.

---

## 2. Data model

### `MpgEntry`

| Field | Type | Notes |
|-------|------|--------|
| `id` | `String` | UUID on create |
| `vehicleId` | `String` | FK to `vehicles` |
| `liters` | `double` | Fill amount (always liters) |
| `distance` | `double` | Distance since last fill-up |
| `distanceUnit` | `DistanceUnit` | Snapshot at save time |
| `recordedAt` | `DateTime` | Fill date (day precision) |

SQLite: `mpg_entries` (`liters`, `distance`, `distance_unit`, `recorded_at`).
Cascade delete with vehicle.

Validation: `liters > 0`, `distance > 0`, non-empty `vehicleId`.

### Fuel economy display

| Unit | Formula (period totals) |
|------|-------------------------|
| MPG (US) | `miles / (liters / 3.785411784)` |
| L/100KM | `liters / km * 100` |
| KM/L | `km / liters` |

Period efficiency uses **total distance / total fuel** (not the mean of
per-fill values). Each entry’s distance is normalized via its stored
`distanceUnit` before summing. Display values are rounded to **1** decimal
digit.

---

## 3. Component reuse

| Component | Use |
|-----------|-----|
| `GarageShell` | Screen chrome |
| `GarageTopBar` | Back + title |
| `GarageListCard` | Vehicle picker rows |
| `GarageEmptyState` | No vehicles / no fill-ups |
| `GarageVehicleChip` | Selected vehicle on form / history |
| `GarageInputField` | Liters + distance |
| `GaragePrimaryButton` | Save |
| `showGarageErrorDialog` | Load/save failures |
| `GarageDashboardTile` | Home MPG tile |
| `GarageMpgHistorySection` | Vehicle detail → history |

---

## 4. Screens

### 4.1 Select vehicle (`mpg_select`)

Mirrors Quick Entry select: list vehicles; empty state directs user to Garage.

### 4.2 Log fill-up (`mpg_form`)

- Full-tank accuracy note (muted body text)
- **FILL AMOUNT (L)** — numeric
- **DISTANCE SINCE LAST FILL (MI|KM)** — unit from settings
- **Save Fill-Up** — no MPG result UI

### 4.3 History (`mpg_history`)

- Unit switch: **MPG | L/100KM | KM/L** (session-only)
- **By month:** horizontal bar chart, newest first; ~6 months visible;
  scroll for older months; value inside each bar (1 decimal)
- **By year:** 2-column grid; thick accent (`GarageTheme.success`) circle with
  value inside; year label below
- Empty state when the vehicle has no fill-ups

---

## 5. Navigation & state

```
Home --mpgTapped--> /garage/mpg --vehicleTapped--> /garage/mpg/:id/form
                                                      |
                                                   submitted
                                                      |
                                                   goHome()

Vehicle Detail --mpgHistoryTapped--> /garage/vehicles/:id/mpg
```

Home grid order: Quick Entry | MPG · Garage | Reminders · Settings.

---

## 6. Interaction & tokens

- Use `GarageSpacing.screenH` / `section` / `labelGap` / `list` / `grid`.
- Primary actions via `GaragePrimaryButton`; disable while `isSubmitting`.
- Field errors inline under inputs; fatal errors via dialog.
- History chart accent: `GarageTheme.success` (matches home MPG tile).

---

## 7. Out of scope

- Editing or deleting individual fill-up entries from history
- Persisting fuel-economy unit preference in settings
- Volume unit preference (gallons)
- Portal sync for MPG entries
- Updating vehicle odometer from fill distance (trip distance, not odometer)
- Individual fill-up list on the history screen (month + year summaries only)

---

## Appendix A — Implementation checklist

- [x] Entity / model / repo / `CreateMpgEntryUseCase`
- [x] Schema + migration v8 + `DatabaseHelper` CRUD
- [x] `mpg_select` + `mpg_form` screens
- [x] Home tile, routes, DI
- [x] `FuelEconomyCalculator` + month/year aggregates
- [x] `mpg_history` screen (unit switch, monthly bars, year grid)
- [x] Vehicle detail entry + `/garage/vehicles/:id/mpg` route
- [x] Design spec
