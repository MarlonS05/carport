# Settings — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: settings
  product_name: Carport / Garage Log
  source: https://www.figma.com/make/94nCBxYM2nJRYkTsclYfSC/carport
  target_platform: Flutter (carport repo)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for the Settings feature in Carport.
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
| BLoC + freezed | `GarageSettingsBloc`, `GarageSettingsUnitsBloc`, `GarageSettingsAppearanceBloc`, `GarageSettingsPermissionsBloc` |
| All screens registered in `AppRouter` | Add route when adding a screen; BLoCs navigate only via registered routes |
| All navigation in BLoCs | Views dispatch events only; BLoC calls `AppRouter` — never navigate from views |
| Widget classes | Screen-specific private widgets in `*_view.dart`; shared under `screens/components/garage/` |
| Infra I/O | Notification permission via `ReminderNotificationScheduler` port (`getPermissionStatus` / `requestPermissions`) |
| Persistence | `DistanceUnit` and `ColorThemePreset` via `SettingsRepository` + use cases |
| Writes | `SetDistanceUnitUseCase`, `SetColorThemePresetUseCase` — BLoCs do not write prefs directly |
| Errors | `BlocConsumer` + `showGarageErrorDialog` when `errorMessage` is set |
| Theme | `GarageTheme`, `GarageTextStyles`, `GarageSpacing`, `GarageRadius`, `GarageAlpha`, `GarageColors.success` |

**Replaces:** former `GaragePlaceholderScreen` at `/garage/settings`.

**Reference implementations:** `lib/screens/settings/`,
`lib/screens/garage/reminders/` (BLoC / `BlocConsumer` pattern).

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Settings hub | `/garage/settings` | Settings |
| Units | `/garage/settings/units` | Units |
| Appearance | `/garage/settings/appearance` | Appearance |
| Permissions | `/garage/settings/permissions` | Permissions |

Entry: Home **Settings** tile → `/garage/settings`. Connectivity is a separate
feature under the same hub — see `docs/connectivity-design-spec.md`.

### 1.2 Flows

- **Units:** Hub → Units → tap Miles/Kilometres → save → pop to hub (subtitle updates).
- **Appearance:** Hub → Appearance → tap a color theme → Save → pop to hub (subtitle shows current preset label).
- **Permissions:** Hub → Permissions → tap **Request Permission** → OS request → if still not granted, open system settings on same tap.
- **Back:** TopBar → BLoC `backTapped` → `router.pop()`.

---

## 2. Data model

### Distance unit

```dart
enum DistanceUnit { miles, kilometres }
```

| Value | Label | Subtitle (units screen) | Suffix |
|-------|-------|-------------------------|--------|
| `miles` | Miles | Imperial — used in the US, UK | `mi` |
| `kilometres` | Kilometres | Metric — used internationally | `km` |

**Default:** `miles`.

**Suffix-only:** Changing unit updates display suffix only. Stored mileage
values are **not converted**.

**Persistence:** `GetDistanceUnitUseCase` / `SetDistanceUnitUseCase` via
`SettingsRepository`.

### Notification permission

```dart
enum NotificationPermissionStatus {
  granted, denied, notDetermined, unsupported,
}
```

Read from OS via scheduler port.

### Color theme preset

```dart
enum ColorThemePreset { legacy, oceanDepth, swampFog, subZero, mountainSunrise }
```

| Storage ID | Label | Brightness |
|------------|-------|------------|
| `legacy` | Legacy | dark |
| `oceanDepth` | Ocean Depth | dark |
| `swampFog` | Swamp Fog | dark |
| `subZero` | Sub Zero | light |
| `mountainSunrise` | Mountain Sunrise | dark |

**Default:** `legacy`.

**Persistence:** `GetColorThemePresetUseCase` / `SetColorThemePresetUseCase`
via `SettingsRepository`. Runtime theme via `AppThemeCubit` +
`AppThemes.themeFor(preset)`.

**Palettes:** Full token tables in `docs/color-themes.md` and
`lib/theme/app_themes/app_themes.dart`.

### Hub rows

| Label | Subtitle | Icon | Route |
|-------|----------|------|-------|
| Units | Current unit label | `gauge` | `/garage/settings/units` |
| Appearance | Current theme label | `palette` | `/garage/settings/appearance` |
| Permissions | Notifications | `bell` | `/garage/settings/permissions` |
| Connectivity | See connectivity spec | `link` | `/garage/settings/connectivity` |

Mileage label call sites must stay unit-aware via
`GarageMileageFormatter` and related components (suffix `mi`/`km` only).

---

## 3. Component reuse

### 3.1 Reuse as-is

`GarageShell`, `GarageTopBar`, `GarageBackButton`, `GarageListCard` (hub rows),
`GarageSectionLabel`, `GaragePressable`, `GarageErrorDialog`,
`GarageRadioOptionCard`, `GarageSettingsStatusCard`, `GaragePermissionButton`.

### 3.2 Adapt

`GarageMileageFormatter`, `GarageMileageReadRow` — unit-aware suffix only.

### 3.3 Do not reuse

`GaragePlaceholderScreen`, `GarageReminderTypeToggle` (units use radio cards),
`GarageFab`, `GarageEmptyState` (on hub/units/appearance).

### 3.4 Build new

Already shipped under `lib/screens/components/garage/`:
`GarageRadioOptionCard`, `GarageSettingsStatusCard`, `GaragePermissionButton`.

---

## 4. Screens

### Settings hub

```yaml
route: /garage/settings
folder: lib/screens/settings/
bloc: GarageSettingsBloc
view: GarageSettingsView
```

```
GarageShell
└── BlocConsumer (errorMessage → showGarageErrorDialog)
    └── Column
        ├── GarageTopBar(title: Settings, onBack: backTapped)
        └── Expanded → scroll → Padding(screenH)
            ├── GarageListCard (Units)
            ├── Padding(top: GarageSpacing.list) → GarageListCard (Appearance)
            ├── Padding(top: GarageSpacing.list) → GarageListCard (Permissions)
            └── Padding(top: GarageSpacing.list) → GarageListCard (Connectivity)
```

### Units

```yaml
route: /garage/settings/units
folder: lib/screens/settings/units/
bloc: GarageSettingsUnitsBloc
view: GarageSettingsUnitsView
```

`GarageSectionLabel(text: Distance)` + `GarageRadioOptionCard` for Miles /
Kilometres. Tap → `SetDistanceUnitUseCase` → `router.pop()` on success.

**Selected styling:** `GarageAlpha.primaryTint` bg, `GarageAlpha.primaryBorder`
border, `primary` title, trailing radio.

### Appearance

```yaml
route: /garage/settings/appearance
folder: lib/screens/settings/appearance/
bloc: GarageSettingsAppearanceBloc
view: GarageSettingsAppearanceView
```

`GarageSectionLabel(text: Color theme)` + radio cards per preset +
`GaragePrimaryButton(label: Save)` enabled when selection changed. Save →
`SetColorThemePresetUseCase` + `AppThemeCubit.setPreset` → pop.

### Permissions

```yaml
route: /garage/settings/permissions
folder: lib/screens/settings/permissions/
bloc: GarageSettingsPermissionsBloc
view: GarageSettingsPermissionsView
```

Status card + `GaragePermissionButton`. Status colors: Allowed →
`GarageColors.success`; Blocked → `destructive`; else `mutedForeground`.

**CTA flow (single button):**
1. Tap when not granted → `requestPermissions()`
2. Refresh status
3. If still not granted → `openAppSettings()`

| State | Label | Enabled |
|-------|-------|---------|
| requesting | Requesting… | false |
| granted | Permission Granted | false |
| notDetermined/denied | Request Permission | true |
| unsupported | hidden or disabled | false |

---

## 5. Navigation & state

### Routes (`AppRoutes`)

```dart
static const settings = '$garage/settings';
static const settingsUnits = '$settings/units';
static const settingsAppearance = '$settings/appearance';
static const settingsPermissions = '$settings/permissions';
```

### BLoC events

**GarageSettingsBloc:** `started`, `unitsTapped`, `appearanceTapped`,
`permissionsTapped`, `connectivityTapped`, `backTapped`

**GarageSettingsUnitsBloc:** `started`, `unitSelected(DistanceUnit)`,
`backTapped`

**GarageSettingsAppearanceBloc:** `started`, `presetSelected(ColorThemePreset)`,
`saveTapped`, `backTapped`

**GarageSettingsPermissionsBloc:** `started`, `permissionTapped`, `backTapped`
- `permissionTapped`: request → refresh → open settings if still denied

---

## 6. Interaction & tokens

- Section labels: `GarageSectionLabel`
- Card gaps: `GarageSpacing.list` (12)
- Primary tints: `GarageAlpha` constants only
- All screens: `BlocConsumer` + `showGarageErrorDialog` on `errorMessage`
- Icons: hub `gauge`/`bell`/`palette`/`link` ~20px; status/CTA `bell` ~16px

---

## 7. Out of scope

Account/sync (beyond connectivity), data export, per-vehicle units, mileage
value conversion, exact-alarm settings row, about screen.

---

## Appendix A. Implementation checklist

```
[x] DistanceUnit + ColorThemePreset + SettingsRepository
[x] Get/Set distance unit + color theme use cases + AppThemeCubit
[x] AppThemes palettes (see docs/color-themes.md)
[x] GarageAlpha + GarageColors.success + GarageSectionLabel
[x] GarageMileageFormatter unit suffix
[x] ReminderNotificationScheduler permission status APIs
[x] Radio / status / permission shared widgets
[x] Four BLoCs + views + routes + DI
[ ] Verify: analyzer + architecture import test (on change)
```
