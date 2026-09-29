# Reminders — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: reminders
  product_name: Carport
  source: N/A
  target_platform: Flutter (carport repo)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for Carport reminders (local
> notifications + list/form UI).
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
| BLoC + freezed | `GarageRemindersBloc`, `GarageReminderFormBloc` |
| All screens registered in `AppRouter` | `/garage/reminders`, add, `:reminderId/edit` |
| All navigation in BLoCs | Views dispatch events only; BLoC calls `AppRouter` — never navigate from views |
| Widget classes | Screen-specific private widgets in `*_view.dart`; shared under `screens/components/garage/` |
| Infra I/O | `ReminderNotificationScheduler` port → `LocalReminderNotificationScheduler` |
| Persistence | `ReminderRepository` + `CreateOrUpdateReminderUseCase` / `DeleteReminderUseCase`; app launch via `SyncReminderNotificationsUseCase` |
| Writes | Use cases only — BLoCs do not write DB or schedule notifications directly |
| Errors | `BlocConsumer` + `showGarageErrorDialog` when `errorMessage` is set |
| Theme | `GarageTheme` / `GarageTextStyles` / `GarageSpacing` / `GarageRadius` |

**Replaces:** N/A (shipped).

**Reference implementations:** `lib/screens/garage/reminders/`,
`lib/screens/garage/reminder_form/`.

---

## 1. Feature overview

Carport reminders fire OS local notifications via
[`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications).
A reminder is either **one-time** or **repeating** on a fixed cadence derived
from its `dueAt` anchor.

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Reminders list | `/garage/reminders` | Reminders |
| Add reminder | `/garage/reminders/add` | (form) |
| Edit reminder | `/garage/reminders/:reminderId/edit` | (form) |

Entry: Home / garage tiles → reminders list.

### 1.2 Flows

- **Create/update:** Form save → `CreateOrUpdateReminderUseCase` persists then
  reschedules → pop.
- **Delete:** `DeleteReminderUseCase` cancels notification then deletes.
- **App relaunch:** `SyncReminderNotificationsUseCase` cancels all and
  reschedules — repeating always; one-time only if still in the future.
- **Back:** TopBar → BLoC `backTapped` → `AppRouter.pop()`.

---

## 2. Data model

`Reminder` (`lib/domain/entities/reminder.dart`):

| Field | Type | Notes |
|-------|------|-------|
| `id` | `String` | UUID; empty on create |
| `name` | `String` | Required |
| `body` | `String` | Notification body (falls back to "Maintenance reminder") |
| `dueAt` | `DateTime` | Wall-clock anchor for the schedule |
| `repeatFrequency` | `ReminderRepeatFrequency?` | `null` = one-time |

`ReminderRepeatFrequency` = `daily | weekly | monthly | yearly`
(`lib/domain/entities/reminder_repeat_frequency.dart`).

One-time vs repeating is derived from `repeatFrequency == null`
(`Reminder.isRepeating`). There is no separate `repeating` boolean or free-text
`interval` — mileage-based and free-text intervals are **out of scope**.

### Recurrence → notification mapping

Repeating reminders use the plugin's native recurrence (no manual reschedule
after each fire). `toDateTimeComponents`
(`lib/platform/reminder_repeat_frequency_components.dart`) maps to
`matchDateTimeComponents` on `zonedSchedule`:

| Frequency | `DateTimeComponents` | Fires |
|-----------|----------------------|-------|
| `daily` | `time` | Every day at the due time of day |
| `weekly` | `dayOfWeekAndTime` | Every week on the due weekday + time |
| `monthly` | `dayOfMonthAndTime` | Every month on the due day of month + time |
| `yearly` | `dateAndTime` | Every year on the due month + day + time |
| one-time (`null`) | `null` | Single notification at `dueAt` |

Scheduling and cancellation live in use cases via the
`ReminderNotificationScheduler` port; the platform implementation is
`LocalReminderNotificationScheduler`. One notification ID per reminder
(hash of the UUID). Wall-clock scheduling is preserved via
`WallClockNotificationTime`.

The plugin's `matchDateTimeComponents` only advances to the next occurrence
*after* a notification fires, and on Android a `scheduledDate` in the past fires
immediately. Because the repeating anchor (`dueAt`) is normally in the past,
`LocalReminderNotificationScheduler` anchors the first notification on
`WallClockNotificationTime.nextOccurrence(...)` — the next occurrence strictly
after "now" that matches the cadence (preserving time-of-day / weekday /
day-of-month / month+day, skipping invalid dates like the 31st or Feb 29). This
avoids a spurious immediate fire on every `SyncReminderNotificationsUseCase`
run at app launch.

### Persistence

SQLite `reminders` table (`lib/db/database_schema.dart`):

```
id TEXT PRIMARY KEY
name TEXT NOT NULL
body TEXT NOT NULL DEFAULT ''
due_at TEXT NOT NULL              -- wall-clock datetime (see WallClockDateTime)
repeat_frequency TEXT            -- daily|weekly|monthly|yearly, nullable
```

Migration **v2** (`lib/db/database_migrations.dart`) rebuilt the table: dropped
legacy `repeating` / `interval` columns, added `repeat_frequency`, and migrated
existing rows to one-time (`repeat_frequency = NULL`). Current
`databaseVersion` may be higher for later unrelated migrations — do not invent
new reminder columns without a migration + schema mirror.

### Edge cases

| Case | Behavior |
|------|----------|
| Monthly on the 31st | Months without day 31 are skipped (OS/plugin behavior) |
| Yearly on Feb 29 | Fires in leap years only unless the due date changes |
| Past `dueAt` + recurrence | Scheduler rolls the anchor forward to the next matching occurrence before scheduling (no immediate fire); one-time past reminders are skipped |
| Permission denied | Reminder is still saved; the form shows the notifications-disabled warning |

**Default:** one-time (`repeatFrequency == null`).

**Persistence:** `CreateOrUpdateReminderUseCase`, `DeleteReminderUseCase`,
`SyncReminderNotificationsUseCase` via `ReminderRepository` + scheduler port.

---

## 3. Component reuse

### 3.1 Reuse as-is

`GarageShell`, `GarageTopBar`, `GarageFab`, `GarageEmptyState`,
`GarageReminderCard`, `GarageErrorDialog`, form inputs as used elsewhere.

### 3.2 Adapt

N/A for core behavior.

### 3.3 Do not reuse

Mileage / free-text interval UI (removed by design).

### 3.4 Build new

Already shipped: `GarageReminderTypeToggle`, `GarageReminderRepeatDropdown`,
`GarageReminderCard` under `screens/components/garage/`.

---

## 4. Screens

### Reminders list

```yaml
route: /garage/reminders
folder: lib/screens/garage/reminders/
bloc: GarageRemindersBloc
view: GarageRemindersView
```

List of `GarageReminderCard`. Repeating cards show a formatted recurrence label
(`GarageRepeatFrequencyFormatter.format`) instead of the raw due date, e.g.
`Daily · 9:00 AM`, `Weekly · Mon · 9:00 AM`, `Monthly · day 15 · 9:00 AM`,
`Yearly · Oct 14 · 9:00 AM`. One-time reminders show the due date/time.

### Reminder form

```yaml
route: /garage/reminders/add | /garage/reminders/:reminderId/edit
folder: lib/screens/garage/reminder_form/
bloc: GarageReminderFormBloc
view: GarageReminderFormView
```

One-time / Repeating toggle (`GarageReminderTypeToggle`). When repeating, a
**dropdown** (`GarageReminderRepeatDropdown`) selects Daily / Weekly / Monthly /
Yearly, with a short hint covering the monthly-31 / Feb-29 edge cases. The due
date+time picker is the recurrence **anchor**. No interval text field, no
mileage placeholders.

---

## 5. Navigation & state

### Routes (`AppRoutes`)

```dart
static const reminders = '$garage/reminders';
static const addReminder = '$reminders/$segmentAdd';
static const segmentReminderEdit = ':reminderId/edit';
```

### BLoC events

**GarageRemindersBloc:** load/list interactions, navigate to add/edit, delete,
`backTapped`.

**GarageReminderFormBloc:** `started`, field updates, save, `backTapped` —
save runs `CreateOrUpdateReminderUseCase`.

---

## 6. Interaction & tokens

- Use `GarageSpacing` / theme tokens — no hardcoded gaps for new UI.
- All screens: `BlocConsumer` + `showGarageErrorDialog` on error state.

---

## 7. Out of scope

Mileage-based intervals, free-text interval strings, manual reschedule-after-fire
loops, cloud-synced reminder schedules.

---

## Appendix A. Implementation checklist

```
[x] Reminder entity + repeat_frequency persistence (v2+)
[x] ReminderNotificationScheduler + LocalReminderNotificationScheduler
[x] CreateOrUpdate / Delete / SyncReminderNotifications use cases
[x] List + form BLoCs/views + shared toggle/dropdown/card
[x] Routes + DI wiring
[ ] Verify: analyzer + architecture import test (on change)
```
