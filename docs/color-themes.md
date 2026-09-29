# Color Themes — Portal Reference

> Machine-readable palette spec for mirroring Carport app themes in the web portal
> (or any other client). Values match `lib/theme/app_themes/app_themes.dart`.
>
> **Default app preset:** `legacy`  
> **Design language:** see `docs/design-language.md` for typography, spacing, and component rules.

---

## 1. Semantic tokens

Use these names in CSS, Tailwind, or a theme object — not raw hex in components.

| Token | Role |
|-------|------|
| `background` | App canvas / page background |
| `foreground` | Primary text on background and cards |
| `card` | Card and elevated surface fill |
| `cardForeground` | Text on cards (usually same as `foreground`) |
| `primary` | Accent: CTAs, selection, active icons, eyebrows |
| `primaryForeground` | Text/icons on top of `primary` |
| `primaryHover` | Pressed/hover state of primary surfaces |
| `secondary` | Pressed row background, icon chips, back button |
| `secondaryForeground` | Text on `secondary` surfaces |
| `muted` | Muted surface (same hex as `secondary` in all presets) |
| `mutedForeground` | Secondary text, metadata, inactive icons |
| `border` | Hairline borders (8% opacity white or black) |
| `inputBackground` | Text-field fill |
| `destructive` | Delete/error text, borders, dialogs |
| `success` | Positive status (granted, healthy) |
| `ring` | Focus ring on inputs (same as `primary` in all presets) |

### Accent alpha tokens (interaction states)

Apply to `primary` — do not introduce new hues.

| Token | Value | Use |
|-------|-------|-----|
| `primaryTint` | `0.12` | Fill behind a **selected** card/option |
| `primaryBorder` | `0.5` | Border of a **selected** card/option |
| `primaryHoverBorder` | `0.4` | Border of an **unselected but pressed** card |

Example (CSS):

```css
.selected-card {
  background: color-mix(in srgb, var(--primary) 12%, transparent);
  border-color: color-mix(in srgb, var(--primary) 50%, transparent);
}
```

### Status color mapping

| State | Token |
|-------|-------|
| Positive / allowed / healthy | `success` |
| Negative / blocked / error | `destructive` |
| Neutral / unknown / pending | `mutedForeground` |

---

## 2. Presets

Storage key (app `SharedPreferences`): enum name, e.g. `legacy`.

| Storage ID | Display name | Brightness | Accent |
|------------|--------------|------------|--------|
| `legacy` | Legacy | dark | `#E87C2A` amber |
| `oceanDepth` | Ocean Depth | dark | `#4A9FD4` blue |
| `swampFog` | Swamp Fog | dark | `#6A9F7E` sage |
| `subZero` | Sub Zero | light | `#4A9EC8` ice blue |
| `mountainSunrise` | Mountain Sunrise | dark | `#F0C078` sunrise gold |

**Default:** `legacy`.

**Migration** (removed storage keys → new preset):

| Old storage key | New preset |
|-----------------|------------|
| `darkColorful` | `legacy` |
| `darkLightBlue` | `oceanDepth` |
| `darkPlain` | `mountainSunrise` |
| `lightPlain` | `subZero` |
| `lightColorful` | `mountainSunrise` |

Handled in `ColorThemePreset.fromStorage` (`lib/domain/entities/color_theme_preset.dart`).

### 2.1 `legacy` — Legacy *(default)*

| Token | Hex |
|-------|-----|
| `background` | `#111111` |
| `foreground` | `#F0EDE8` |
| `card` | `#1C1C1E` |
| `cardForeground` | `#F0EDE8` |
| `primary` | `#E87C2A` |
| `primaryForeground` | `#111111` |
| `primaryHover` | `#F59E0B` |
| `secondary` | `#2A2A2C` |
| `secondaryForeground` | `#F0EDE8` |
| `muted` | `#2A2A2C` |
| `mutedForeground` | `#888884` |
| `border` | `rgba(255, 255, 255, 0.08)` |
| `inputBackground` | `#242426` |
| `destructive` | `#D4183D` |
| `success` | `#34D399` |
| `ring` | `#E87C2A` |

### 2.2 `oceanDepth` — Ocean Depth

| Token | Hex |
|-------|-----|
| `background` | `#0B1520` |
| `foreground` | `#E6EEF5` |
| `card` | `#132030` |
| `cardForeground` | `#E6EEF5` |
| `primary` | `#4A9FD4` |
| `primaryForeground` | `#0B1520` |
| `primaryHover` | `#6BB5E0` |
| `secondary` | `#1A2D42` |
| `secondaryForeground` | `#E6EEF5` |
| `muted` | `#1A2D42` |
| `mutedForeground` | `#7A92A8` |
| `border` | `rgba(255, 255, 255, 0.08)` |
| `inputBackground` | `#172535` |
| `destructive` | `#D4183D` |
| `success` | `#34D399` |
| `ring` | `#4A9FD4` |

### 2.3 `swampFog` — Swamp Fog

| Token | Hex |
|-------|-----|
| `background` | `#0E1612` |
| `foreground` | `#E6EDE8` |
| `card` | `#172220` |
| `cardForeground` | `#E6EDE8` |
| `primary` | `#6A9F7E` |
| `primaryForeground` | `#0E1612` |
| `primaryHover` | `#84B896` |
| `secondary` | `#223028` |
| `secondaryForeground` | `#E6EDE8` |
| `muted` | `#223028` |
| `mutedForeground` | `#7A8E82` |
| `border` | `rgba(255, 255, 255, 0.08)` |
| `inputBackground` | `#1A2822` |
| `destructive` | `#D4183D` |
| `success` | `#34D399` |
| `ring` | `#6A9F7E` |

### 2.4 `subZero` — Sub Zero

| Token | Hex |
|-------|-----|
| `background` | `#F2F7FB` |
| `foreground` | `#1A2530` |
| `card` | `#FFFFFF` |
| `cardForeground` | `#1A2530` |
| `primary` | `#4A9EC8` |
| `primaryForeground` | `#FFFFFF` |
| `primaryHover` | `#3A8BB5` |
| `secondary` | `#E4EEF5` |
| `secondaryForeground` | `#1A2530` |
| `muted` | `#E4EEF5` |
| `mutedForeground` | `#5A6D7E` |
| `border` | `rgba(0, 0, 0, 0.08)` |
| `inputBackground` | `#E8F0F6` |
| `destructive` | `#D4183D` |
| `success` | `#059669` |
| `ring` | `#4A9EC8` |

### 2.5 `mountainSunrise` — Mountain Sunrise

| Token | Hex |
|-------|-----|
| `background` | `#28282C` |
| `foreground` | `#EDEBE6` |
| `card` | `#343438` |
| `cardForeground` | `#EDEBE6` |
| `primary` | `#F0C078` |
| `primaryForeground` | `#28282C` |
| `primaryHover` | `#F5D090` |
| `secondary` | `#3A3A3E` |
| `secondaryForeground` | `#EDEBE6` |
| `muted` | `#3A3A3E` |
| `mutedForeground` | `#9A9892` |
| `border` | `rgba(255, 255, 255, 0.08)` |
| `inputBackground` | `#38383C` |
| `destructive` | `#D4183D` |
| `success` | `#34D399` |
| `ring` | `#F0C078` |

---

## 3. What varies per preset

| Layer | Dark presets | Light presets |
|-------|--------------|---------------|
| Neutrals (`background` … `inputBackground`, `border`) | **Differs** per preset (tinted canvases) | Sub Zero only |
| Accent (`primary`, `primaryForeground`, `primaryHover`, `ring`) | **Differs** per preset | **Differs** per preset |
| `success` | `#34D399` (all dark) | `#059669` (Sub Zero) |
| `destructive` | `#D4183D` (all presets) | `#D4183D` (all presets) |

---

## 4. Portal CSS example

Map one preset to custom properties on `:root` or a `data-theme` attribute:

```css
/* Default — matches app default (legacy) */
:root,
[data-theme="legacy"] {
  --background: #111111;
  --foreground: #f0ede8;
  --card: #1c1c1e;
  --card-foreground: #f0ede8;
  --primary: #e87c2a;
  --primary-foreground: #111111;
  --primary-hover: #f59e0b;
  --secondary: #2a2a2c;
  --secondary-foreground: #f0ede8;
  --muted: #2a2a2c;
  --muted-foreground: #888884;
  --border: rgba(255, 255, 255, 0.08);
  --input-background: #242426;
  --destructive: #d4183d;
  --success: #34d399;
  --ring: #e87c2a;
}

[data-theme="oceanDepth"] {
  --background: #0b1520;
  --foreground: #e6eef5;
  --card: #132030;
  --card-foreground: #e6eef5;
  --primary: #4a9fd4;
  --primary-foreground: #0b1520;
  --primary-hover: #6bb5e0;
  --secondary: #1a2d42;
  --secondary-foreground: #e6eef5;
  --muted: #1a2d42;
  --muted-foreground: #7a92a8;
  --border: rgba(255, 255, 255, 0.08);
  --input-background: #172535;
  --destructive: #d4183d;
  --success: #34d399;
  --ring: #4a9fd4;
}

[data-theme="swampFog"] {
  --background: #0e1612;
  --foreground: #e6ede8;
  --card: #172220;
  --card-foreground: #e6ede8;
  --primary: #6a9f7e;
  --primary-foreground: #0e1612;
  --primary-hover: #84b896;
  --secondary: #223028;
  --secondary-foreground: #e6ede8;
  --muted: #223028;
  --muted-foreground: #7a8e82;
  --border: rgba(255, 255, 255, 0.08);
  --input-background: #1a2822;
  --destructive: #d4183d;
  --success: #34d399;
  --ring: #6a9f7e;
}

[data-theme="subZero"] {
  --background: #f2f7fb;
  --foreground: #1a2530;
  --card: #ffffff;
  --card-foreground: #1a2530;
  --primary: #4a9ec8;
  --primary-foreground: #ffffff;
  --primary-hover: #3a8bb5;
  --secondary: #e4eef5;
  --secondary-foreground: #1a2530;
  --muted: #e4eef5;
  --muted-foreground: #5a6d7e;
  --border: rgba(0, 0, 0, 0.08);
  --input-background: #e8f0f6;
  --destructive: #d4183d;
  --success: #059669;
  --ring: #4a9ec8;
}

[data-theme="mountainSunrise"] {
  --background: #28282c;
  --foreground: #edebe6;
  --card: #343438;
  --card-foreground: #edebe6;
  --primary: #f0c078;
  --primary-foreground: #28282c;
  --primary-hover: #f5d090;
  --secondary: #3a3a3e;
  --secondary-foreground: #edebe6;
  --muted: #3a3a3e;
  --muted-foreground: #9a9892;
  --border: rgba(255, 255, 255, 0.08);
  --input-background: #38383c;
  --destructive: #d4183d;
  --success: #34d399;
  --ring: #f0c078;
}
```

---

## 5. JSON export (all presets)

```json
{
  "defaultPreset": "legacy",
  "accentAlphas": {
    "primaryTint": 0.12,
    "primaryBorder": 0.5,
    "primaryHoverBorder": 0.4
  },
  "presets": {
    "legacy": {
      "background": "#111111",
      "foreground": "#F0EDE8",
      "card": "#1C1C1E",
      "cardForeground": "#F0EDE8",
      "primary": "#E87C2A",
      "primaryForeground": "#111111",
      "primaryHover": "#F59E0B",
      "secondary": "#2A2A2C",
      "secondaryForeground": "#F0EDE8",
      "muted": "#2A2A2C",
      "mutedForeground": "#888884",
      "border": "rgba(255, 255, 255, 0.08)",
      "inputBackground": "#242426",
      "destructive": "#D4183D",
      "success": "#34D399",
      "ring": "#E87C2A"
    },
    "oceanDepth": {
      "background": "#0B1520",
      "foreground": "#E6EEF5",
      "card": "#132030",
      "cardForeground": "#E6EEF5",
      "primary": "#4A9FD4",
      "primaryForeground": "#0B1520",
      "primaryHover": "#6BB5E0",
      "secondary": "#1A2D42",
      "secondaryForeground": "#E6EEF5",
      "muted": "#1A2D42",
      "mutedForeground": "#7A92A8",
      "border": "rgba(255, 255, 255, 0.08)",
      "inputBackground": "#172535",
      "destructive": "#D4183D",
      "success": "#34D399",
      "ring": "#4A9FD4"
    },
    "swampFog": {
      "background": "#0E1612",
      "foreground": "#E6EDE8",
      "card": "#172220",
      "cardForeground": "#E6EDE8",
      "primary": "#6A9F7E",
      "primaryForeground": "#0E1612",
      "primaryHover": "#84B896",
      "secondary": "#223028",
      "secondaryForeground": "#E6EDE8",
      "muted": "#223028",
      "mutedForeground": "#7A8E82",
      "border": "rgba(255, 255, 255, 0.08)",
      "inputBackground": "#1A2822",
      "destructive": "#D4183D",
      "success": "#34D399",
      "ring": "#6A9F7E"
    },
    "subZero": {
      "background": "#F2F7FB",
      "foreground": "#1A2530",
      "card": "#FFFFFF",
      "cardForeground": "#1A2530",
      "primary": "#4A9EC8",
      "primaryForeground": "#FFFFFF",
      "primaryHover": "#3A8BB5",
      "secondary": "#E4EEF5",
      "secondaryForeground": "#1A2530",
      "muted": "#E4EEF5",
      "mutedForeground": "#5A6D7E",
      "border": "rgba(0, 0, 0, 0.08)",
      "inputBackground": "#E8F0F6",
      "destructive": "#D4183D",
      "success": "#059669",
      "ring": "#4A9EC8"
    },
    "mountainSunrise": {
      "background": "#28282C",
      "foreground": "#EDEBE6",
      "card": "#343438",
      "cardForeground": "#EDEBE6",
      "primary": "#F0C078",
      "primaryForeground": "#28282C",
      "primaryHover": "#F5D090",
      "secondary": "#3A3A3E",
      "secondaryForeground": "#EDEBE6",
      "muted": "#3A3A3E",
      "mutedForeground": "#9A9892",
      "border": "rgba(255, 255, 255, 0.08)",
      "inputBackground": "#38383C",
      "destructive": "#D4183D",
      "success": "#34D399",
      "ring": "#F0C078"
    }
  }
}
```

---

## 6. Source of truth

| Artifact | Path |
|----------|------|
| Flutter palettes | `lib/theme/app_themes/app_themes.dart` |
| Preset IDs & labels | `lib/domain/entities/color_theme_preset.dart` |
| Runtime token type | `lib/theme/garage_theme.dart` (`GarageTheme`) |
| Accent alphas | `GarageAlpha` in `lib/theme/garage_theme.dart` |

When adding or changing a preset, update **both** `app_themes.dart` and this document.
