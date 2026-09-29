# Connectivity — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: connectivity
  product_name: Carport / Garage Log
  source: N/A
  target_platform: Flutter (carport repo)
  status: shipped (register + local access prefs; checkin/sync UX may still evolve)
-->

> **Purpose:** Machine-readable design spec for the Settings Connectivity
> feature.
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
| BLoC + freezed | `GarageSettingsConnectivityBloc`, `GarageSettingsQrScannerBloc`, `GarageSettingsWebAccessBloc` (+ hub events on `GarageSettingsBloc`) |
| All screens registered in `AppRouter` | Connectivity hub, QR scanner, web access under `/garage/settings/connectivity…` |
| All navigation in BLoCs | Views dispatch events only; BLoC calls `AppRouter` |
| Widget classes | Private widgets in `*_view.dart`; shared under `screens/components/garage/` |
| Infra I/O | `PortalMonitorApi` → `HttpPortalMonitorApi`; QR via `GarageQrScannerPreview` in `platform/` |
| Persistence | `PortalConnectionRepository` (+ SharedPreferences-backed fields) |
| Writes | `ConnectPortalUseCase`, `SetPortalBaseUrlUseCase`, `SetWebPortalUserAccessUseCase`, etc. |
| Errors | `BlocConsumer` + `showGarageErrorDialog` |
| Theme | Garage tokens + `GarageColors.success` / `destructive` / `mutedForeground` |

**Replaces:** N/A (extends Settings hub).

**Reference implementations:** `lib/screens/settings/connectivity/`.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Settings hub (row) | `/garage/settings` | Settings |
| Connectivity hub | `/garage/settings/connectivity` | Connectivity |
| QR Scanner | `/garage/settings/connectivity/qr-scanner` | QR Scanner |
| Web Access | `/garage/settings/connectivity/web-access` | Web Access |

Entry: Settings hub → **Connectivity** row.

### 1.2 Flows

- **QR Scanner:** Connectivity hub → QR Scanner → scan URL → persist locally /
  register → status card shows Connected.
- **Web Access:** Connectivity hub → Web Access → toggle users (may use stub
  list when checkin is deferred).
- **Back:** TopBar → BLoC `backTapped` → `router.pop()`.

---

## 2. Data model

### Portal base URL

Stored locally via `PortalConnectionRepository`. Scanned QR must be
`http`/`https` with a host. Trailing `/api` and `/` are stripped. API base
becomes `{url}/api`.

### Mobile device ID

After a successful QR scan, `ConnectPortalUseCase` calls
`GET {baseUrl}/api/register` and persists the returned UUID as
`portal_mobile_id` (`SharedPreferences`). This value is sent as `X-Mobile-Id`
on future sync calls. Register runs once per install per portal host; rescans
of the same host skip register when an ID already exists. Changing the portal
URL clears the stored mobile ID.

### Web portal user

```dart
class WebPortalUser {
  final int id;
  final String name;
  final bool hasAccess;
}
```

UI may show stub users when checkin is not yet live; `hasAccess` derives from
persisted `portal_allowed_user_ids`.

### Hub rows

**Settings hub:**

| Label | Subtitle | Icon |
|-------|----------|------|
| Connectivity | `Not connected` or hostname | `link` |

**Connectivity hub:**

| Label | Subtitle | Icon |
|-------|----------|------|
| QR Scanner | `Scan portal URL` or `Connected to {host}` | `scanLine` |
| Web Access | `Manage viewer access` | `users` |

### API mapping

| UI action | Endpoint | Status |
|-----------|----------|--------|
| First register after scan | `GET {baseUrl}/api/register` | Implemented — `ConnectPortalUseCase` + `HttpPortalMonitorApi`; stores `portal_mobile_id` |
| Load web users | `GET {baseUrl}/api/checkin/{uuid}` | May still stub / defer in UI |
| Toggle user access | `POST {baseUrl}/api/permissions/sync` | Local and/or sync depending on current code path |

See `docs/api/mobile-app-communication.md`. Portal vehicle/service sync use
cases exist separately from this settings UI (including optional base64
`maintenance_schedule_image` on vehicles). Vehicle documents images stay
device-local only (biometric-gated in the app UI; not synced to the portal).

---

## 3. Component reuse

### 3.1 Reuse as-is

`GarageShell`, `GarageTopBar`, `GarageListCard`, `GarageSectionLabel`,
`GarageSettingsStatusCard`, `GarageEmptyState`, `GaragePermissionButton`,
`GarageErrorDialog`, `GarageToggleListCard`.

### 3.2 Adapt

N/A.

### 3.3 Do not reuse

Unrelated garage list cards without connectivity semantics.

### 3.4 Build new

Shipped: `GarageToggleListCard`; platform `GarageQrScannerPreview`
(`mobile_scanner` wrapper in `lib/platform/`).

---

## 4. Screens

### Connectivity hub

```yaml
route: /garage/settings/connectivity
folder: lib/screens/settings/connectivity/
bloc: GarageSettingsConnectivityBloc
view: GarageSettingsConnectivityView
```

Two `GarageListCard` rows: QR Scanner, Web Access.

### QR Scanner

```yaml
route: /garage/settings/connectivity/qr-scanner
folder: lib/screens/settings/connectivity/qr_scanner/
bloc: GarageSettingsQrScannerBloc
view: GarageSettingsQrScannerView
```

Expanded camera preview with viewfinder overlay + bottom panel
(`GarageSectionLabel`, `GarageSettingsStatusCard`, helper text).

| Phase | Status label | Color |
|-------|--------------|-------|
| scanning | Scanning… | `mutedForeground` |
| validating | Validating… | `mutedForeground` |
| connected | Connected ({hostname}) | `success` |
| cameraDenied | Camera blocked | `destructive` |

Invalid QR → `showGarageErrorDialog`: "QR code must contain a valid portal URL."
Camera denied → `GaragePermissionButton` CTA (opens app settings).

### Web Access

```yaml
route: /garage/settings/connectivity/web-access
folder: lib/screens/settings/connectivity/web_access/
bloc: GarageSettingsWebAccessBloc
view: GarageSettingsWebAccessView
```

- Not connected → `GarageEmptyState`: "Connect to your monitor first"
- Connected → `GarageToggleListCard` per user
- Helper: "Choose which monitor users can view your garage data."

---

## 5. Navigation & state

### Routes

```dart
static const settingsConnectivity = '$settings/connectivity';
static const settingsConnectivityQrScanner = '$settingsConnectivity/qr-scanner';
static const settingsConnectivityWebAccess = '$settingsConnectivity/web-access';
```

### BLoC events

**GarageSettingsBloc:** `connectivityTapped`; state includes portal connection
summary as implemented.

**GarageSettingsConnectivityBloc:** `started`, `qrScannerTapped`,
`webAccessTapped`, `backTapped`

**GarageSettingsQrScannerBloc:** `started`, `codeDetected(String)`,
`cameraDenied`, `openSettingsTapped`, `backTapped`

**GarageSettingsWebAccessBloc:** `started`, `userAccessToggled(int, bool)`,
`backTapped`

---

## 6. Interaction & tokens

- Card gaps: `GarageSpacing.list`
- Status colors: `GarageColors.success` / `destructive` / `mutedForeground`
- Errors: `BlocConsumer` + `showGarageErrorDialog`

---

## 7. Out of scope

Certificate pinning, background retry queue UI, inventing endpoints not in
`docs/api/mobile-app-communication.md`. Do not treat orphan
`lib/screens/service/` trees as the connectivity surface.

---

## Appendix A. Implementation checklist

```
[x] PortalConnectionRepository + ConnectPortalUseCase / register
[x] Connectivity / QR / Web Access screens + routes + DI
[x] GarageToggleListCard + GarageQrScannerPreview
[ ] Align checkin / permissions sync UI with live API as needed
[ ] Verify: analyzer + architecture import test (on change)
```
