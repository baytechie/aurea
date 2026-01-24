# Aurea UI/UX Design Specification

**Version:** 1.0.0
**Last Updated:** January 20, 2026
**Platform:** Web (React) - Mobile-First Responsive

---

## Table of Contents

1. [Design System Foundation](#1-design-system-foundation)
2. [Component Specifications](#2-component-specifications)
3. [Page Layouts](#3-page-layouts)
4. [Interaction Patterns](#4-interaction-patterns)
5. [Animation Guidelines](#5-animation-guidelines)
6. [Accessibility Requirements](#6-accessibility-requirements)
7. [Mobile Considerations](#7-mobile-considerations)
8. [Implementation Notes](#8-implementation-notes)

---

## 1. Design System Foundation

### 1.1 Color Palette

#### Primary Colors

| Token | Hex | RGB | Usage | Contrast (White) |
|-------|-----|-----|-------|------------------|
| `primary-500` | `#06B6D4` | 6, 182, 212 | Primary actions, links, focus states | 3.0:1 (Large text only) |
| `primary-600` | `#0891B2` | 8, 145, 178 | Primary hover states | 4.5:1 (AA) |
| `primary-700` | `#0E7490` | 14, 116, 144 | Primary active/pressed | 5.9:1 (AA) |
| `primary-50` | `#ECFEFF` | 236, 254, 255 | Primary backgrounds, tints | N/A |
| `primary-100` | `#CFFAFE` | 207, 250, 254 | Selected states, highlights | N/A |

#### Secondary Colors (Accent)

| Token | Hex | RGB | Usage | Contrast (White) |
|-------|-----|-----|-------|------------------|
| `secondary-500` | `#8B5CF6` | 139, 92, 246 | Secondary actions, accents | 3.4:1 (Large text) |
| `secondary-600` | `#7C3AED` | 124, 58, 237 | Secondary hover | 4.9:1 (AA) |
| `secondary-700` | `#6D28D9` | 109, 40, 217 | Secondary active | 6.4:1 (AAA) |
| `secondary-50` | `#F5F3FF` | 245, 243, 255 | Secondary backgrounds | N/A |

#### Semantic Colors

| Token | Hex | Usage | Contrast (White) |
|-------|-----|-------|------------------|
| `success-500` | `#10B981` | Success states, positive indicators | 3.0:1 |
| `success-600` | `#059669` | Success hover/active | 4.5:1 (AA) |
| `success-50` | `#ECFDF5` | Success backgrounds | N/A |
| `warning-500` | `#F59E0B` | Warning states, caution | 2.1:1 (use with dark text) |
| `warning-600` | `#D97706` | Warning hover | 3.0:1 |
| `warning-50` | `#FFFBEB` | Warning backgrounds | N/A |
| `danger-500` | `#EF4444` | Error states, destructive actions | 3.9:1 |
| `danger-600` | `#DC2626` | Error hover | 4.6:1 (AA) |
| `danger-50` | `#FEF2F2` | Error backgrounds | N/A |

#### Neutral Colors

| Token | Hex | Usage |
|-------|-----|-------|
| `gray-50` | `#F9FAFB` | Page backgrounds |
| `gray-100` | `#F3F4F6` | Card backgrounds, dividers |
| `gray-200` | `#E5E7EB` | Borders, disabled backgrounds |
| `gray-300` | `#D1D5DB` | Input borders |
| `gray-400` | `#9CA3AF` | Placeholder text, icons |
| `gray-500` | `#6B7280` | Secondary text |
| `gray-600` | `#4B5563` | Body text |
| `gray-700` | `#374151` | Labels, strong text |
| `gray-800` | `#1F2937` | Headings |
| `gray-900` | `#111827` | Primary text |
| `white` | `#FFFFFF` | Cards, inputs |

### 1.2 Typography

#### Font Family

```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

#### Type Scale

| Name | Size | Line Height | Weight | Usage |
|------|------|-------------|--------|-------|
| `text-xs` | 12px (0.75rem) | 16px (1.33) | 400 | Captions, labels |
| `text-sm` | 14px (0.875rem) | 20px (1.43) | 400 | Secondary text, descriptions |
| `text-base` | 16px (1rem) | 24px (1.5) | 400 | Body text |
| `text-lg` | 18px (1.125rem) | 28px (1.56) | 400 | Large body, card titles |
| `text-xl` | 20px (1.25rem) | 28px (1.4) | 600 | Section headers |
| `text-2xl` | 24px (1.5rem) | 32px (1.33) | 700 | Page titles |
| `text-3xl` | 30px (1.875rem) | 36px (1.2) | 700 | Hero subheadings |
| `text-4xl` | 36px (2.25rem) | 40px (1.11) | 700 | Hero headings (mobile) |
| `text-5xl` | 48px (3rem) | 48px (1.0) | 700 | Hero headings (desktop) |

#### Font Weights

| Weight | Value | Usage |
|--------|-------|-------|
| Regular | 400 | Body text, descriptions |
| Medium | 500 | Labels, emphasized text |
| Semibold | 600 | Buttons, subheadings |
| Bold | 700 | Headings, important values |

### 1.3 Spacing System

Base unit: **4px**

| Token | Value | Usage |
|-------|-------|-------|
| `space-0` | 0px | Reset |
| `space-1` | 4px | Tight spacing (icon gaps) |
| `space-2` | 8px | Component internal spacing |
| `space-3` | 12px | Small gaps |
| `space-4` | 16px | Default padding |
| `space-5` | 20px | Medium gaps |
| `space-6` | 24px | Card padding |
| `space-8` | 32px | Section gaps |
| `space-10` | 40px | Large section spacing |
| `space-12` | 48px | Page section margins |
| `space-16` | 64px | Major section breaks |
| `space-20` | 80px | Hero sections |

### 1.4 Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| `rounded-none` | 0px | Sharp corners |
| `rounded-sm` | 2px | Subtle rounding |
| `rounded` | 4px | Default small elements |
| `rounded-md` | 6px | Buttons, inputs |
| `rounded-lg` | 8px | Cards, modals |
| `rounded-xl` | 12px | Large cards |
| `rounded-2xl` | 16px | Feature cards |
| `rounded-full` | 9999px | Pills, avatars |

### 1.5 Shadows

| Token | Value | Usage |
|-------|-------|-------|
| `shadow-sm` | `0 1px 2px rgba(0,0,0,0.05)` | Subtle elevation |
| `shadow` | `0 1px 3px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.06)` | Cards |
| `shadow-md` | `0 4px 6px rgba(0,0,0,0.1), 0 2px 4px rgba(0,0,0,0.06)` | Dropdowns |
| `shadow-lg` | `0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05)` | Modals |
| `shadow-xl` | `0 20px 25px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.04)` | Elevated modals |

### 1.6 Z-Index Scale

| Token | Value | Usage |
|-------|-------|-------|
| `z-0` | 0 | Base layer |
| `z-10` | 10 | Raised elements |
| `z-20` | 20 | Sidebar backdrop |
| `z-30` | 30 | Sidebar, fixed headers |
| `z-40` | 40 | Dropdowns |
| `z-50` | 50 | Modals |
| `z-60` | 60 | Toast notifications |

---

## 2. Component Specifications

### 2.1 SymptomSlider

A visual 0-5 slider with emoji indicators for intuitive symptom tracking.

#### Props Interface

```typescript
interface SymptomSliderProps {
  /** Unique identifier for the slider */
  id: string;
  /** Display label for the symptom */
  label: string;
  /** Current value (0-5) */
  value: number;
  /** Callback when value changes */
  onChange: (value: number) => void;
  /** Whether higher values are negative (e.g., bloating) */
  inverted?: boolean;
  /** Disable interaction */
  disabled?: boolean;
  /** Show loading state */
  loading?: boolean;
  /** Error message to display */
  error?: string;
  /** Help text displayed below slider */
  helpText?: string;
}
```

#### Visual States

```
DEFAULT STATE:
+----------------------------------------------------------+
| Energy                                        Good (3)   |
+----------------------------------------------------------+
|                                                          |
|   [  ] - - - - - [  ] - - - - - [XX] - - - - - [  ]     |
|                                                          |
|   Very Low        Moderate               Excellent       |
+----------------------------------------------------------+

HOVER STATE (on track):
+----------------------------------------------------------+
| Energy                                        Good (3)   |
+----------------------------------------------------------+
|                                                          |
|   [  ] - - - - - [  ] - - - [==HOVER==] - - - [  ]      |
|                                  ^                       |
|   Very Low        Moderate      4           Excellent    |
+----------------------------------------------------------+
  * Track shows highlight at hover position
  * Tooltip shows value preview

ACTIVE/DRAGGING STATE:
+----------------------------------------------------------+
| Energy                                       Great (4)   |
+----------------------------------------------------------+
|                                                          |
|   [  ] - - - - - [  ] - - - - - [  ] - [XX] - [  ]      |
|                                         ^                |
|   Very Low        Moderate    |dragging|    Excellent   |
+----------------------------------------------------------+
  * Thumb scales up 1.2x
  * Label updates in real-time
  * Visual feedback on track fill

DISABLED STATE:
+----------------------------------------------------------+
| Energy                                        Good (3)   |
+----------------------------------------------------------+
|                                                          |
|   [ ] - - - - - [ ] - - - - - [//] - - - - - [ ]        |
|         (grayed out, reduced opacity 0.5)                |
|   Very Low        Moderate               Excellent       |
+----------------------------------------------------------+

ERROR STATE:
+----------------------------------------------------------+
| Energy                                        Good (3)   |
+----------------------------------------------------------+
|                                                          |
|   [  ] ~~~~~~~~~ [  ] ~~~~~~~~~ [XX] ~~~~~~~~~ [  ]     |
|               (red track highlight)                      |
|   Very Low        Moderate               Excellent       |
+----------------------------------------------------------+
| ! Unable to save symptom value                           |
+----------------------------------------------------------+

WITH EMOJI INDICATORS (Enhanced Version):
+----------------------------------------------------------+
| Energy                                        Good (3)   |
+----------------------------------------------------------+
|                                                          |
|   [Emoji Scale: energy level visualization]              |
|                                                          |
|                  Current: [energy emoji]                 |
|                                                          |
|   [range input slider]                                   |
|                                                          |
|   Very Low        Moderate               Excellent       |
+----------------------------------------------------------+
```

#### Emoji Mapping

| Symptom | 0 | 1 | 2 | 3 | 4 | 5 |
|---------|---|---|---|---|---|---|
| Energy | (exhausted face) | (tired face) | (neutral face) | (slightly smiling face) | (smiling face) | (star-struck face) |
| Bloating (inverted) | (happy face) | (slightly concerned) | (uncomfortable) | (bloated) | (very bloated) | (extremely bloated) |
| Focus | (confused face) | (slightly confused) | (thinking face) | (focused face) | (very focused) | (laser focused) |
| Mood | (sad face) | (slightly sad) | (neutral face) | (slightly smiling) | (happy face) | (very happy) |
| Sleep | (sleepy face) | (tired face) | (neutral) | (well-rested) | (energized) | (fully refreshed) |

#### Responsive Behavior

- **Mobile (< 640px):** Full width, thumb size 24px, touch target 44px
- **Tablet (640px - 1024px):** Max-width 400px, thumb size 20px
- **Desktop (> 1024px):** Max-width 480px, thumb size 18px

#### Accessibility

- Use `<input type="range">` for native semantics
- `aria-label`: "[Label] slider, value [X] out of 5, [descriptive label]"
- `aria-valuemin="0"`, `aria-valuemax="5"`, `aria-valuenow="[value]"`
- `aria-valuetext`: Descriptive text (e.g., "Good" instead of "3")
- Keyboard: Arrow keys change value by 1, Page Up/Down by 2
- Focus ring: 2px solid primary-500 with 2px offset

---

### 2.2 IngredientCard

Displays ingredient health scores with visual progress bars.

#### Props Interface

```typescript
interface IngredientCardProps {
  /** Ingredient name */
  name: string;
  /** Overall health score (0-100) */
  overallScore: number;
  /** Individual category scores */
  scores: {
    bloodSugarImpact: number;      // 0-100
    inflammationPotential: number; // 0-100 (inverted display)
    gutImpact: number;             // 0-100
    hormonalRelevance: number;     // 0-100
  };
  /** Evidence quality level */
  evidenceConfidence: 'high' | 'medium' | 'low' | 'unknown';
  /** Source references */
  sources?: string[];
  /** Card click handler */
  onClick?: () => void;
  /** Compact mode for lists */
  compact?: boolean;
  /** Loading state */
  loading?: boolean;
  /** Error state */
  error?: string;
}
```

#### Visual States

```
DEFAULT STATE (Full Card):
+------------------------------------------------------------------+
|                                                                  |
|   TURMERIC                                              [85]     |
|   ~~~~~~~~~~                                          /100       |
|                                                    [GREEN BG]    |
|                                                                  |
|   [i] Higher scores indicate better health impact               |
|                                                                  |
+------------------------------------------------------------------+
|   Health Impact Breakdown                                        |
|                                                                  |
|   Blood Sugar Impact                                        72   |
|   [==========================================        ]  GOOD     |
|   How this ingredient affects blood glucose levels              |
|                                                                  |
|   Inflammation Potential                                    25   |
|   [============                                      ]  LOW      |
|   Likelihood of causing inflammatory response                   |
|                                                                  |
|   Gut Health Impact                                         88   |
|   [==============================================    ] EXCELLENT |
|   Effect on gut microbiome and digestion                        |
|                                                                  |
|   Hormonal Relevance                                        65   |
|   [====================================              ]  MODERATE |
|   Potential effect on hormonal balance                          |
|                                                                  |
+------------------------------------------------------------------+
|   Evidence Quality                                               |
|                                                                  |
|   [HIGH CONFIDENCE]  (green badge)                              |
|                                                                  |
|   Sources:                                                       |
|   - PubMed: Curcumin anti-inflammatory properties               |
|   - USDA FoodData Central                                       |
+------------------------------------------------------------------+

COMPACT STATE (List Item):
+------------------------------------------------------------------+
|  [icon] Turmeric           [====85====]              [>]         |
|         Overall: Excellent  Blood Sugar: 72 | Gut: 88           |
+------------------------------------------------------------------+

LOADING STATE:
+------------------------------------------------------------------+
|                                                                  |
|   [skeleton pulse ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]      |
|                                                                  |
|   [skeleton bar ==========================================]      |
|   [skeleton bar ==========================================]      |
|   [skeleton bar ==========================================]      |
|                                                                  |
+------------------------------------------------------------------+

ERROR STATE:
+------------------------------------------------------------------+
|                                                                  |
|   [!] Unable to load ingredient data                            |
|                                                                  |
|   We couldn't find data for this ingredient. Try another one!   |
|                                                                  |
|   [Try Again]                                                   |
|                                                                  |
+------------------------------------------------------------------+
```

#### Score Color Mapping

| Score Range | Color Token | Visual Indicator |
|-------------|-------------|------------------|
| 80-100 | `success-500` | Excellent - Dark green |
| 60-79 | `success-400` | Good - Light green |
| 40-59 | `warning-500` | Moderate - Yellow/amber |
| 20-39 | `warning-600` | Poor - Orange |
| 0-19 | `danger-500` | Bad - Red |

#### Progress Bar Implementation

```
Score Bar Anatomy:
+----------------------------------------------------------------+
|  Label Text                                        Score Value  |
|  [===================fill==================       ]             |
|  Helper text describing the metric                              |
+----------------------------------------------------------------+

Fill calculation: width = (score / 100) * 100%
Color: Based on score range (see mapping above)
Animation: 300ms ease-out on mount/change
```

---

### 2.3 InsightsPanel

Displays user's personal insights including triggers, correlations, and patterns.

#### Props Interface

```typescript
interface InsightsPanelProps {
  /** Top trigger ingredients */
  triggers: TriggerInfo[];
  /** Correlation data for charts */
  correlations: CorrelationData[];
  /** Cycle phase patterns (optional) */
  cyclePatterns?: CyclePattern[];
  /** Weekly trend data */
  weeklyTrends: WeeklyTrend[];
  /** Minimum data threshold met */
  hasEnoughData: boolean;
  /** Days of data available */
  dataPoints: number;
  /** Loading state */
  loading?: boolean;
  /** Error state */
  error?: string;
}

interface TriggerInfo {
  ingredient: string;
  correlation: number;    // -1 to 1
  symptom: string;
  confidence: 'high' | 'medium' | 'low';
  lagDays?: number;       // 0 = same day, 1 = next day
}

interface CorrelationData {
  ingredient: string;
  symptom: string;
  value: number;          // -1 to 1
}

interface CyclePattern {
  phase: string;
  avgSymptoms: Record<string, number>;
  triggersActive: string[];
}

interface WeeklyTrend {
  date: string;
  symptoms: Record<string, number>;
  ingredients: string[];
}
```

#### Visual States

```
DEFAULT STATE (Has Data):
+------------------------------------------------------------------+
|                                                                  |
|  YOUR INSIGHTS                                     [See Details] |
|  ==============                                                  |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  [!] TOP TRIGGERS                                                |
|                                                                  |
|  Based on your logs, these ingredients may affect you:          |
|                                                                  |
|  +------------------------+  +------------------------+          |
|  | [warning icon] Sugar   |  | [warning icon] Dairy   |          |
|  | Bloating +0.72        |  | Bloating +0.58        |          |
|  | High confidence       |  | Medium confidence     |          |
|  | Same day effect       |  | Next day effect       |          |
|  +------------------------+  +------------------------+          |
|                                                                  |
|  +------------------------+  +------------------------+          |
|  | [info icon] Wheat     |  | [info icon] Caffeine  |          |
|  | Energy -0.45          |  | Focus +0.63           |          |
|  | Medium confidence     |  | High confidence       |          |
|  | Same day effect       |  | Same day effect       |          |
|  +------------------------+  +------------------------+          |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  [chart icon] WEEKLY TRENDS                                      |
|                                                                  |
|  Energy Level (Last 7 Days)                                     |
|                                                                  |
|  5 |                     *                                       |
|  4 |          *    *          *                                  |
|  3 |     *                         *                             |
|  2 |                                    *                        |
|  1 |                                                             |
|    +----+----+----+----+----+----+----+                         |
|      M    T    W    T    F    S    S                            |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  [cycle icon] CYCLE PATTERNS (if enabled)                        |
|                                                                  |
|  Current Phase: Follicular                                       |
|                                                                  |
|  +----------+  +----------+  +----------+  +----------+          |
|  |Menstrual |  |Follicular|  |Ovulation |  | Luteal   |          |
|  | Avg: 2.8 |  | Avg: 3.5 |  | Avg: 4.1 |  | Avg: 2.9 |          |
|  | Energy   |  | Energy   |  | Energy   |  | Energy   |          |
|  +----------+  +----------+  +----------+  +----------+          |
|                                                                  |
+------------------------------------------------------------------+

NOT ENOUGH DATA STATE:
+------------------------------------------------------------------+
|                                                                  |
|  YOUR INSIGHTS                                                   |
|  ==============                                                  |
|                                                                  |
|            [graph icon - large, muted]                          |
|                                                                  |
|         Log more meals to unlock insights                        |
|                                                                  |
|         We need at least 7 days of data                          |
|         You have logged: 3 days                                  |
|                                                                  |
|         +----------------------------------------+               |
|         |  [==========                    ] 3/7  |               |
|         +----------------------------------------+               |
|                                                                  |
|         [Log Today's Meals]                                      |
|                                                                  |
+------------------------------------------------------------------+

LOADING STATE:
+------------------------------------------------------------------+
|                                                                  |
|  YOUR INSIGHTS                                                   |
|                                                                  |
|  [skeleton card ~~~~~~~~~~~~~~~~~~~~~~~~~~]                      |
|  [skeleton card ~~~~~~~~~~~~~~~~~~~~~~~~~~]                      |
|                                                                  |
|  [skeleton chart ~~~~~~~~~~~~~~~~~~~~~~~~~]                      |
|                                                                  |
+------------------------------------------------------------------+

ERROR STATE:
+------------------------------------------------------------------+
|                                                                  |
|  [!] Unable to load insights                                     |
|                                                                  |
|  Something went wrong while analyzing your data.                |
|                                                                  |
|  [Try Again]                                                    |
|                                                                  |
+------------------------------------------------------------------+
```

#### Trigger Card Color Coding

| Correlation | Type | Color | Icon |
|-------------|------|-------|------|
| > 0.5 | Strong positive | `warning-500` | AlertTriangle |
| 0.3 - 0.5 | Moderate positive | `warning-400` | AlertCircle |
| -0.3 - 0.3 | Weak/No correlation | `gray-400` | Info |
| -0.5 - -0.3 | Moderate negative | `success-400` | TrendingDown |
| < -0.5 | Strong negative | `success-500` | CheckCircle |

---

### 2.4 PredictionResult

Displays ML prediction results with probability and confidence indicators.

#### Props Interface

```typescript
interface PredictionResultProps {
  /** Date being predicted */
  predictedDate: string;
  /** Ingredients used for prediction */
  ingredients: string[];
  /** Current cycle phase (optional) */
  cyclePhase?: string;
  /** Main probability prediction */
  bloatingProbability: number;  // 0-100
  /** Individual symptom predictions */
  predictedSymptoms: {
    energy: number;    // 0-5
    bloating: number;  // 0-5
    focus: number;     // 0-5
    mood: number;      // 0-5
    sleep: number;     // 0-5
  };
  /** Model confidence in prediction */
  confidence: number;  // 0-100
  /** Human-readable interpretation */
  interpretation: string;
  /** When prediction was generated */
  createdAt: string;
  /** Loading state */
  loading?: boolean;
  /** Error state */
  error?: string;
}
```

#### Visual States

```
DEFAULT STATE:
+------------------------------------------------------------------+
|                                                                  |
|  PREDICTION FOR TOMORROW                                         |
|  January 21, 2026                                                |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  BLOATING RISK                                                   |
|                                                                  |
|        +------------------------------------------+              |
|        |                                          |              |
|        |              [GAUGE CHART]               |              |
|        |                   72%                    |              |
|        |                MODERATE                  |              |
|        |                                          |              |
|        +------------------------------------------+              |
|                                                                  |
|  Based on: sugar, dairy, wheat                                   |
|  Cycle phase: Luteal                                             |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  PREDICTED SYMPTOMS                                              |
|                                                                  |
|  Energy      [===|============      ] 3.2  Moderate              |
|  Bloating    [====================|=] 4.1  High                  |
|  Focus       [=====|=============== ] 3.5  Good                  |
|  Mood        [====|================] 3.8  Good                   |
|  Sleep       [======|==============] 3.6  Good                   |
|                                                                  |
|  | = predicted value position on 0-5 scale                       |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  MODEL CONFIDENCE                                                |
|                                                                  |
|  [================================          ] 78%                |
|  HIGH - Based on 45 similar log entries                          |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  INTERPRETATION                                                  |
|                                                                  |
|  "Based on your history, consuming sugar and dairy during        |
|   the luteal phase has previously resulted in moderate           |
|   bloating the following day. Consider reducing these            |
|   ingredients if you want to minimize symptoms."                 |
|                                                                  |
+------------------------------------------------------------------+

LOW CONFIDENCE STATE:
+------------------------------------------------------------------+
|                                                                  |
|  [info icon] Limited Data                                        |
|                                                                  |
|  Confidence: 35%                                                 |
|  We need more log entries to improve predictions.                |
|  Current predictions are based on general patterns.              |
|                                                                  |
+------------------------------------------------------------------+

LOADING STATE:
+------------------------------------------------------------------+
|                                                                  |
|  [brain icon spinning]                                           |
|                                                                  |
|  Analyzing your data...                                          |
|                                                                  |
|  [skeleton gauge ~~~~~~~~~~]                                     |
|  [skeleton bars ~~~~~~~~~~~]                                     |
|                                                                  |
+------------------------------------------------------------------+

ERROR STATE:
+------------------------------------------------------------------+
|                                                                  |
|  [!] Prediction Failed                                           |
|                                                                  |
|  Unable to generate prediction. Please try again.                |
|                                                                  |
|  [Generate New Prediction]                                       |
|                                                                  |
+------------------------------------------------------------------+

EMPTY STATE (No Ingredients Selected):
+------------------------------------------------------------------+
|                                                                  |
|  [clipboard icon]                                                |
|                                                                  |
|  Select ingredients to see prediction                            |
|                                                                  |
|  Add the foods you plan to eat tomorrow to see                   |
|  how they might affect your symptoms.                            |
|                                                                  |
+------------------------------------------------------------------+
```

#### Risk Level Color Mapping

| Probability | Level | Color | Background |
|-------------|-------|-------|------------|
| 0-25% | Very Low | `success-600` | `success-50` |
| 26-45% | Low | `success-500` | `success-50` |
| 46-65% | Moderate | `warning-500` | `warning-50` |
| 66-80% | High | `warning-600` | `warning-50` |
| 81-100% | Very High | `danger-500` | `danger-50` |

#### Confidence Level Indicators

| Confidence | Label | Color | Description |
|------------|-------|-------|-------------|
| 80-100% | Very High | `success-500` | Based on extensive matching data |
| 60-79% | High | `success-400` | Good amount of similar patterns |
| 40-59% | Moderate | `warning-500` | Some relevant data available |
| 20-39% | Low | `warning-600` | Limited matching patterns |
| 0-19% | Very Low | `danger-500` | Mostly general estimates |

---

### 2.5 Chart Components

#### 2.5.1 WeeklyTrendChart

```typescript
interface WeeklyTrendChartProps {
  /** Data points for the week */
  data: {
    date: string;
    value: number;
    label?: string;
  }[];
  /** Symptom being tracked */
  symptom: string;
  /** Y-axis range */
  range: [number, number];  // e.g., [0, 5]
  /** Show data point labels */
  showLabels?: boolean;
  /** Chart height */
  height?: number;
  /** Loading state */
  loading?: boolean;
}
```

```
WEEKLY TREND CHART:
+------------------------------------------------------------------+
|                                                                  |
|  Energy Level - Last 7 Days                                      |
|                                                                  |
|  5 |                                                             |
|    |                          o                                  |
|  4 |              o     o           o                            |
|    |                                                             |
|  3 |        o                             o                      |
|    |                                                             |
|  2 |                                            o                |
|    |                                                             |
|  1 |                                                             |
|    |                                                             |
|  0 +-----+-----+-----+-----+-----+-----+-----+                   |
|        Mon   Tue   Wed   Thu   Fri   Sat   Sun                   |
|                                                                  |
|  Legend: o = logged value, -- = trend line                       |
|                                                                  |
+------------------------------------------------------------------+
```

#### 2.5.2 IngredientFrequencyChart

```typescript
interface IngredientFrequencyChartProps {
  /** Top ingredients with their counts */
  data: {
    ingredient: string;
    count: number;
    avgSymptomImpact?: number;
  }[];
  /** Number of items to show */
  limit?: number;
  /** Time period label */
  period: string;
  /** Loading state */
  loading?: boolean;
}
```

```
INGREDIENT FREQUENCY CHART (Horizontal Bar):
+------------------------------------------------------------------+
|                                                                  |
|  Most Logged Ingredients (This Week)                             |
|                                                                  |
|  Sugar       [==========================] 12 times               |
|  Coffee      [======================    ]  9 times               |
|  Bread       [==================        ]  7 times               |
|  Dairy       [===============           ]  6 times               |
|  Chicken     [============              ]  5 times               |
|  Olive Oil   [==========                ]  4 times               |
|                                                                  |
+------------------------------------------------------------------+
```

#### 2.5.3 CorrelationMatrix

```typescript
interface CorrelationMatrixProps {
  /** Correlation values between ingredients and symptoms */
  data: {
    ingredient: string;
    symptom: string;
    value: number;  // -1 to 1
  }[];
  /** Ingredients to show (rows) */
  ingredients: string[];
  /** Symptoms to show (columns) */
  symptoms: string[];
  /** Loading state */
  loading?: boolean;
}
```

```
CORRELATION MATRIX (Heatmap):
+------------------------------------------------------------------+
|                                                                  |
|  Ingredient-Symptom Correlations                                 |
|                                                                  |
|              Energy  Bloating  Focus   Mood   Sleep              |
|            +-------+--------+-------+------+-------+             |
|  Sugar     |  -0.3 |  +0.7  | -0.4  | -0.2 | -0.5  |             |
|            | [yel] | [red]  | [org] | [yel]| [org] |             |
|            +-------+--------+-------+------+-------+             |
|  Dairy     |  -0.1 |  +0.5  | -0.2  | -0.1 | -0.3  |             |
|            | [gry] | [org]  | [yel] | [gry]| [yel] |             |
|            +-------+--------+-------+------+-------+             |
|  Turmeric  |  +0.4 |  -0.3  | +0.3  | +0.2 | +0.3  |             |
|            | [ltg] | [grn]  | [ltg] | [ltg]| [ltg] |             |
|            +-------+--------+-------+------+-------+             |
|  Caffeine  |  +0.5 |  +0.1  | +0.6  | +0.3 | -0.4  |             |
|            | [grn] | [gry]  | [grn] | [ltg]| [org] |             |
|            +-------+--------+-------+------+-------+             |
|                                                                  |
|  Color Scale: -1 [green] ... 0 [gray] ... +1 [red]              |
|  (For bloating: +correlation = worse)                            |
|                                                                  |
+------------------------------------------------------------------+
```

#### Chart Color Scales

**Correlation Colors (for symptoms where higher = worse, like bloating):**
| Value | Color | Meaning |
|-------|-------|---------|
| -1.0 to -0.5 | `success-600` | Strong negative (beneficial) |
| -0.5 to -0.2 | `success-400` | Weak negative |
| -0.2 to 0.2 | `gray-400` | No correlation |
| 0.2 to 0.5 | `warning-500` | Weak positive (concerning) |
| 0.5 to 1.0 | `danger-500` | Strong positive (problematic) |

**Correlation Colors (for symptoms where higher = better, like energy):**
| Value | Color | Meaning |
|-------|-------|---------|
| -1.0 to -0.5 | `danger-500` | Strong negative (problematic) |
| -0.5 to -0.2 | `warning-500` | Weak negative |
| -0.2 to 0.2 | `gray-400` | No correlation |
| 0.2 to 0.5 | `success-400` | Weak positive (beneficial) |
| 0.5 to 1.0 | `success-600` | Strong positive (beneficial) |

---

### 2.6 Base Components

#### 2.6.1 Button

```typescript
interface ButtonProps {
  /** Button variant */
  variant: 'primary' | 'secondary' | 'ghost' | 'danger';
  /** Button size */
  size: 'sm' | 'md' | 'lg';
  /** Full width button */
  fullWidth?: boolean;
  /** Icon before text */
  iconLeft?: ReactNode;
  /** Icon after text */
  iconRight?: ReactNode;
  /** Loading state */
  loading?: boolean;
  /** Disabled state */
  disabled?: boolean;
  /** Click handler */
  onClick?: () => void;
  /** Button type */
  type?: 'button' | 'submit' | 'reset';
  /** Button contents */
  children: ReactNode;
}
```

```
BUTTON VARIANTS:

Primary (filled):
+------------------+    +------------------+    +------------------+
|   Get Started    |    |   Get Started    |    |   Get Started    |
|   [cyan-600]     |    |   [cyan-700]     |    |   [cyan-600/50]  |
+------------------+    +------------------+    +------------------+
     DEFAULT              HOVER/FOCUS            DISABLED

Secondary (outlined):
+------------------+    +------------------+    +------------------+
|   Learn More     |    |   Learn More     |    |   Learn More     |
|   [border/text]  |    |   [bg-gray-50]   |    |   [opacity-50]   |
+------------------+    +------------------+    +------------------+
     DEFAULT              HOVER/FOCUS            DISABLED

Ghost (text only):
+------------------+    +------------------+    +------------------+
|   Cancel         |    |   Cancel         |    |   Cancel         |
|   [text-gray]    |    |   [bg-gray-100]  |    |   [opacity-50]   |
+------------------+    +------------------+    +------------------+
     DEFAULT              HOVER/FOCUS            DISABLED

Danger (destructive):
+------------------+    +------------------+    +------------------+
|   Delete Log     |    |   Delete Log     |    |   Delete Log     |
|   [red-600]      |    |   [red-700]      |    |   [red-600/50]   |
+------------------+    +------------------+    +------------------+
     DEFAULT              HOVER/FOCUS            DISABLED

BUTTON SIZES:

Small (sm):   h-8, px-3, text-sm
Medium (md):  h-10, px-4, text-base (default)
Large (lg):   h-12, px-6, text-lg

LOADING STATE:
+------------------+
|  [spinner] ...   |
|  [disabled bg]   |
+------------------+
```

#### 2.6.2 Input

```typescript
interface InputProps {
  /** Input type */
  type: 'text' | 'email' | 'password' | 'number' | 'date' | 'search';
  /** Input label */
  label?: string;
  /** Placeholder text */
  placeholder?: string;
  /** Current value */
  value: string;
  /** Change handler */
  onChange: (value: string) => void;
  /** Error message */
  error?: string;
  /** Help text */
  helpText?: string;
  /** Disabled state */
  disabled?: boolean;
  /** Required field */
  required?: boolean;
  /** Leading icon */
  iconLeft?: ReactNode;
  /** Trailing icon/action */
  iconRight?: ReactNode;
}
```

```
INPUT STATES:

Default:
+------------------------------------------------------------------+
|  Email Address                                                    |
|  +------------------------------------------------------------+  |
|  | you@example.com                                            |  |
|  +------------------------------------------------------------+  |
+------------------------------------------------------------------+

Focused:
+------------------------------------------------------------------+
|  Email Address                                                    |
|  +------------------------------------------------------------+  |
|  | you@example.com                              [cyan ring]   |  |
|  +------------------------------------------------------------+  |
+------------------------------------------------------------------+

Error:
+------------------------------------------------------------------+
|  Email Address                                      [red label]   |
|  +------------------------------------------------------------+  |
|  | invalid-email                                  [red border] |  |
|  +------------------------------------------------------------+  |
|  ! Please enter a valid email address             [red text]     |
+------------------------------------------------------------------+

With Icon:
+------------------------------------------------------------------+
|  Search Ingredients                                               |
|  +------------------------------------------------------------+  |
|  | [search icon] Type to search...                [x clear]   |  |
|  +------------------------------------------------------------+  |
+------------------------------------------------------------------+

Disabled:
+------------------------------------------------------------------+
|  Email Address                                    [muted label]   |
|  +------------------------------------------------------------+  |
|  | disabled@example.com                      [gray bg, muted] |  |
|  +------------------------------------------------------------+  |
+------------------------------------------------------------------+
```

#### 2.6.3 Card

```typescript
interface CardProps {
  /** Card padding size */
  padding?: 'sm' | 'md' | 'lg';
  /** Add hover effect */
  hoverable?: boolean;
  /** Make card clickable */
  onClick?: () => void;
  /** Card header content */
  header?: ReactNode;
  /** Card footer content */
  footer?: ReactNode;
  /** Card body content */
  children: ReactNode;
}
```

```
CARD VARIANTS:

Default:
+------------------------------------------------------------------+
|                                                                  |
|  Card content goes here with p-6 (24px) padding                  |
|                                                                  |
|  - White background                                              |
|  - rounded-xl (12px)                                             |
|  - shadow-sm                                                     |
|  - border border-gray-100                                        |
|                                                                  |
+------------------------------------------------------------------+

With Header:
+------------------------------------------------------------------+
|  CARD TITLE                                         [Action]     |
+------------------------------------------------------------------+
|                                                                  |
|  Card body content                                               |
|                                                                  |
+------------------------------------------------------------------+

With Footer:
+------------------------------------------------------------------+
|                                                                  |
|  Card body content                                               |
|                                                                  |
+------------------------------------------------------------------+
|  Footer content                          [Secondary] [Primary]   |
+------------------------------------------------------------------+

Hoverable:
+------------------------------------------------------------------+
|                                                                  |
|  Clickable card content                                          |
|                                                                  |
|  On hover: shadow-md, border-primary-200                         |
|  cursor-pointer                                                  |
|                                                                  |
+------------------------------------------------------------------+
```

#### 2.6.4 Badge/Tag

```typescript
interface BadgeProps {
  /** Badge variant */
  variant: 'default' | 'primary' | 'success' | 'warning' | 'danger' | 'info';
  /** Badge size */
  size?: 'sm' | 'md';
  /** Pill shape (full rounded) */
  pill?: boolean;
  /** Optional icon */
  icon?: ReactNode;
  /** Remove button for tags */
  onRemove?: () => void;
  /** Badge text */
  children: ReactNode;
}
```

```
BADGE/TAG VARIANTS:

Default:    [gray-100 bg, gray-700 text]    "Default"
Primary:    [primary-100 bg, primary-700]   "Primary"
Success:    [success-50 bg, success-700]    "Success"
Warning:    [warning-50 bg, warning-700]    "Warning"
Danger:     [danger-50 bg, danger-700]      "Danger"
Info:       [blue-50 bg, blue-700]          "Info"

Removable Tag (Ingredient):
+---------------------------+
| [x] Sugar                 |  <- Click x to remove
+---------------------------+
```

---

## 3. Page Layouts

### 3.1 HomePage (Landing)

```
DESKTOP (> 1024px):
+------------------------------------------------------------------+
| [Logo: Aurea]                           [Log in] [Get Started >] |
+------------------------------------------------------------------+
|                                                                  |
|                                                                  |
|              Discover What Your                                  |
|              INGREDIENTS Really Do                               |
|                                                                  |
|        Track what you eat, understand how ingredients            |
|        affect your body, and get personalized insights.          |
|                                                                  |
|              [Start Free Trial]  [Log In]                        |
|                                                                  |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  +------------------+  +------------------+  +------------------+ |
|  |    [Search]      |  |    [Activity]    |  |     [Brain]      | |
|  |                  |  |                  |  |                  | |
|  | Search Any       |  | Track Your       |  | AI-Powered       | |
|  | Ingredient       |  | Symptoms         |  | Insights         | |
|  |                  |  |                  |  |                  | |
|  | Get instant      |  | Log daily        |  | Our ML model     | |
|  | health scores... |  | energy, bloat... |  | learns your...   | |
|  +------------------+  +------------------+  +------------------+ |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|                      How It Works                                |
|                                                                  |
|      (1)              (2)              (3)              (4)      |
|   Log Your Food    Rate Your Day   See Patterns   Get Predictions|
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  (c) 2026 Aurea. Your personal health companion.                 |
|                                                                  |
+------------------------------------------------------------------+

MOBILE (< 640px):
+--------------------------------+
| [Logo]              [hamburger]|
+--------------------------------+
|                                |
| Discover What Your             |
| INGREDIENTS                    |
| Really Do                      |
|                                |
| Track what you eat...          |
|                                |
| [Start Free Trial]             |
| [Log In]                       |
|                                |
+--------------------------------+
| +----------------------------+ |
| |   [icon] Feature 1        | |
| +----------------------------+ |
| +----------------------------+ |
| |   [icon] Feature 2        | |
| +----------------------------+ |
| +----------------------------+ |
| |   [icon] Feature 3        | |
| +----------------------------+ |
+--------------------------------+
| How It Works                   |
|                                |
| (1) Log Your Food              |
| (2) Rate Your Day              |
| (3) See Patterns               |
| (4) Get Predictions            |
+--------------------------------+
| (c) 2026 Aurea                 |
+--------------------------------+
```

### 3.2 LoginPage / SignupPage

```
DESKTOP & TABLET (centered card):
+------------------------------------------------------------------+
| [Logo: Aurea]                                                    |
+------------------------------------------------------------------+
|                                                                  |
|               +----------------------------------+                |
|               |                                  |                |
|               |       Welcome Back               |                |
|               |   Log in to continue your        |                |
|               |   health journey                 |                |
|               |                                  |                |
|               | Email Address                    |                |
|               | [____________________________]   |                |
|               |                                  |                |
|               | Password                         |                |
|               | [____________________________]   |                |
|               |                                  |                |
|               | [x] Remember me    Forgot pass?  |                |
|               |                                  |                |
|               | [       Log In            ]      |                |
|               |                                  |                |
|               | Don't have an account? Sign up   |                |
|               |                                  |                |
|               +----------------------------------+                |
|                                                                  |
+------------------------------------------------------------------+

MOBILE (full width):
+--------------------------------+
| [Logo]                         |
+--------------------------------+
|                                |
| Welcome Back                   |
|                                |
| Log in to continue your        |
| health journey                 |
|                                |
| Email Address                  |
| [__________________________]   |
|                                |
| Password                       |
| [__________________________]   |
|                                |
| [x] Remember me                |
|                                |
| [         Log In         ]     |
|                                |
| Forgot password?               |
|                                |
| Don't have an account?         |
| Sign up                        |
|                                |
+--------------------------------+
```

### 3.3 DashboardPage

```
DESKTOP (> 1024px):
+------------------------------------------------------------------+
| +----------+ +---------------------------------------------------+|
| |          | |                                                   ||
| | [Logo]   | |  Welcome Back                                     ||
| |          | |                                                   ||
| | Dashboard| |  +---------------------+  +---------------------+ ||
| | Search   | |  | Quick Actions       |  | Your Stats          | ||
| | Logger   | |  |                     |  |                     | ||
| | Insights | |  | [Log Today's Meals] |  | [12] Total Logs     | ||
| | Settings | |  | [Search Ingredients]|  | [5]  This Week      | ||
| |          | |  +---------------------+  | [3.5] Avg Energy    | ||
| |          | |                           | [7]  Day Streak     | ||
| |          | |                           +---------------------+ ||
| |          | |                                                   ||
| |          | |  +---------------------------------------------+  ||
| |          | |  | Recent Logs                      [View all] |  ||
| | -------- | |  |                                             |  ||
| | [Avatar] | |  | Jan 19 | sugar, coffee | En:3 Bl:2 Mo:4    |  ||
| | user@... | |  | Jan 18 | dairy, wheat  | En:2 Bl:4 Mo:3    |  ||
| | [Logout] | |  | Jan 17 | turmeric      | En:4 Bl:1 Mo:4    |  ||
| +----------+ |  +---------------------------------------------+  ||
|              |                                                   ||
|              |  +---------------------------------------------+  ||
|              |  | Personal Insights                [See more] |  ||
|              |  |                                             |  ||
|              |  | [!] Sugar   [!] Dairy   [!] Wheat          |  ||
|              |  +---------------------------------------------+  ||
|              +---------------------------------------------------+|
+------------------------------------------------------------------+

MOBILE (< 1024px):
+--------------------------------+
| [hamburger] [Logo: Aurea]      |
+--------------------------------+
|                                |
| Welcome Back                   |
|                                |
| +----------------------------+ |
| | Quick Actions              | |
| | [Log Today's Meals    >]   | |
| | [Search Ingredients   >]   | |
| +----------------------------+ |
|                                |
| +----------------------------+ |
| | Your Stats                 | |
| | [12] Logs  [5] Week        | |
| | [3.5] Avg  [7] Streak      | |
| +----------------------------+ |
|                                |
| +----------------------------+ |
| | Recent Logs                | |
| | Jan 19 - sugar, coffee     | |
| | Jan 18 - dairy, wheat      | |
| +----------------------------+ |
|                                |
| +----------------------------+ |
| | Personal Insights          | |
| | [!] Sugar [!] Dairy        | |
| +----------------------------+ |
|                                |
+--------------------------------+
| [Dashboard] [Search] [Log] [+] |
+--------------------------------+

MOBILE SIDEBAR (when open):
+--------------------------------+
| [Logo]                     [X] |
+--------------------------------+
|                                |
| o Dashboard                    |
|   Search Ingredients           |
|   Daily Logger                 |
|   Insights                     |
|   Settings                     |
|                                |
| ----------------------------   |
|                                |
| [Avatar] user@example.com      |
| [Logout]                       |
|                                |
+--------------------------------+
```

### 3.4 Daily Logger Page

```
DESKTOP & TABLET:
+------------------------------------------------------------------+
|                                                                  |
|  Daily Logger                                                    |
|  Record what you ate and how you feel today                      |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | Date                                                        |  |
|  | [Calendar icon] [January 20, 2026        v]                |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | What did you eat?                                          |  |
|  |                                                            |  |
|  | [Type ingredient...                         ] [+ Add]      |  |
|  |                                                            |  |
|  | [x sugar] [x dairy] [x coffee] [x bread]                   |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | How do you feel?                                           |  |
|  |                                                            |  |
|  | Energy                                         Good (3)    |  |
|  | [emoji scale] [==========|==================]              |  |
|  | Very Low                                Excellent          |  |
|  |                                                            |  |
|  | Bloating                                       Mild (1)    |  |
|  | [emoji scale] [===|============================]           |  |
|  | None                                      Extreme          |  |
|  |                                                            |  |
|  | Focus                                         Good (3)     |  |
|  | [emoji scale] [==========|==================]              |  |
|  | Very Low                                Excellent          |  |
|  |                                                            |  |
|  | Mood                                          Great (4)    |  |
|  | [emoji scale] [==============|==============]              |  |
|  | Very Low                                Excellent          |  |
|  |                                                            |  |
|  | Sleep Quality                                 Good (3)     |  |
|  | [emoji scale] [==========|==================]              |  |
|  | Very Poor                               Excellent          |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | Cycle Phase (optional)                                     |  |
|  | Track your menstrual cycle for better insights             |  |
|  |                                                            |  |
|  | [-- Select phase --                          v]            |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  [            Save Daily Log                        ]            |
|                                                                  |
+------------------------------------------------------------------+

SUCCESS STATE:
+------------------------------------------------------------------+
|                                                                  |
|                    [check icon in circle]                        |
|                                                                  |
|                      Log Saved!                                  |
|                                                                  |
|     Your entry has been recorded. Keep tracking to               |
|     unlock insights!                                             |
|                                                                  |
+------------------------------------------------------------------+
```

### 3.5 Ingredient Search Page

```
+------------------------------------------------------------------+
|                                                                  |
|  Search Ingredients                                              |
|  Look up any ingredient to see its health impact scores          |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | [search icon] Search for an ingredient...         [loading]|  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  (RESULTS - see IngredientCard component)                        |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | TURMERIC                                           [85/100]|  |
|  | [i] Higher scores indicate better health impact            |  |
|  +------------------------------------------------------------+  |
|  | Health Impact Breakdown                                    |  |
|  |                                                            |  |
|  | Blood Sugar Impact                                    72   |  |
|  | [==========================================    ]            |  |
|  |                                                            |  |
|  | Inflammation Potential                                25   |  |
|  | [============                              ]                |  |
|  |                                                            |  |
|  | Gut Health Impact                                     88   |  |
|  | [==============================================]           |  |
|  |                                                            |  |
|  | Hormonal Relevance                                    65   |  |
|  | [====================================      ]                |  |
|  +------------------------------------------------------------+  |
|  | Evidence Quality: [HIGH CONFIDENCE]                        |  |
|  | Sources: PubMed, USDA FoodData Central                     |  |
|  +------------------------------------------------------------+  |
|                                                                  |
+------------------------------------------------------------------+

EMPTY STATE:
+------------------------------------------------------------------+
|                                                                  |
|                    [large search icon]                           |
|                                                                  |
|              Start typing to search for ingredients              |
|                                                                  |
+------------------------------------------------------------------+
```

### 3.6 Insights Page

```
+------------------------------------------------------------------+
|                                                                  |
|  Your Insights                                   [Refresh]       |
|                                                                  |
+------------------------------------------------------------------+
|                                                                  |
|  +------------------------------------------------------------+  |
|  | TOP TRIGGERS                                               |  |
|  |                                                            |  |
|  | Based on your logs, these ingredients may affect you:      |  |
|  |                                                            |  |
|  | +-------------+  +-------------+  +-------------+          |  |
|  | | [!] Sugar   |  | [!] Dairy   |  | [!] Wheat   |          |  |
|  | | Bloating    |  | Bloating    |  | Energy      |          |  |
|  | | +0.72       |  | +0.58       |  | -0.45       |          |  |
|  | | High conf.  |  | Med. conf.  |  | Med. conf.  |          |  |
|  | +-------------+  +-------------+  +-------------+          |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | WEEKLY TRENDS                                              |  |
|  |                                                            |  |
|  | [Tab: Energy] [Tab: Bloating] [Tab: Mood]                  |  |
|  |                                                            |  |
|  | [Line chart showing 7-day trend]                           |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | INGREDIENT FREQUENCY                                       |  |
|  |                                                            |  |
|  | [Horizontal bar chart - most logged ingredients]           |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | CORRELATION MATRIX                                         |  |
|  |                                                            |  |
|  | [Heatmap showing ingredient-symptom correlations]          |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | CYCLE PATTERNS (if enabled)                                |  |
|  |                                                            |  |
|  | [Phase comparison cards]                                   |  |
|  +------------------------------------------------------------+  |
|                                                                  |
+------------------------------------------------------------------+
```

### 3.7 Predictions Page

```
+------------------------------------------------------------------+
|                                                                  |
|  Get Predictions                                                 |
|  See how tomorrow might feel based on your planned meals         |
|                                                                  |
|  +------------------------------------------------------------+  |
|  | Select Ingredients for Tomorrow                            |  |
|  |                                                            |  |
|  | [Type ingredient...                         ] [+ Add]      |  |
|  |                                                            |  |
|  | [x sugar] [x dairy]                                        |  |
|  |                                                            |  |
|  | Cycle Phase (optional)                                     |  |
|  | [-- Select phase --                          v]            |  |
|  |                                                            |  |
|  | [            Generate Prediction             ]             |  |
|  +------------------------------------------------------------+  |
|                                                                  |
|  (RESULTS - see PredictionResult component)                      |
|                                                                  |
+------------------------------------------------------------------+
```

---

## 4. Interaction Patterns

### 4.1 Form Submission

```
1. User fills form
2. User clicks submit button
   - Button shows loading spinner
   - Button text changes to "Saving..." / "Loading..."
   - Button is disabled
   - Form inputs are disabled (optional, prevents editing during submit)
3. On success:
   - Success toast appears (top-right)
   - Form resets or redirects
   - Success state shows briefly (optional)
4. On error:
   - Error toast appears
   - Error message shows below relevant field or at form top
   - Button returns to normal state
   - Form remains filled for correction
```

### 4.2 Search Pattern

```
1. User types in search field
2. After 300-500ms debounce:
   - Loading indicator appears in input
   - Previous results fade slightly
3. Results load:
   - Loading indicator hides
   - Results animate in (fade + slide)
4. On no results:
   - Empty state message
5. On error:
   - Error state with retry button
```

### 4.3 Slider Interaction

```
1. User clicks/touches track or drags thumb
2. Value updates immediately (optimistic)
3. Visual feedback:
   - Thumb scales up slightly
   - Label updates in real-time
   - Track fill color may shift
4. On release:
   - Thumb returns to normal size
   - Optional haptic feedback on mobile
5. Keyboard interaction:
   - Arrow keys: +/- 1
   - Page Up/Down: +/- 2
   - Home: minimum value
   - End: maximum value
```

### 4.4 Tag/Pill Addition

```
1. User types in input field
2. User presses Enter or clicks Add button
3. Validation:
   - Check for duplicates (show toast if duplicate)
   - Check for valid input (non-empty)
4. On success:
   - New tag animates in (scale from 0 to 1)
   - Input clears
   - Focus returns to input
5. Tag removal:
   - User clicks X on tag
   - Tag animates out (scale to 0, then remove)
```

### 4.5 Navigation Transitions

```
Page transitions:
- Fade out current content (150ms)
- Fade in new content (150ms)
- Total: 300ms

Tab transitions within page:
- Cross-fade between tab panels (200ms)
- Active tab indicator slides to new position (200ms)

Sidebar (mobile):
- Backdrop fades in (200ms)
- Sidebar slides in from left (200ms ease-out)
- Content underneath does not scroll
```

### 4.6 Hover States

```
Interactive elements should have hover states:

Buttons:
- Background color shift (primary-600 -> primary-700)
- Subtle shadow increase
- Cursor: pointer

Cards (if clickable):
- Border color: gray-200 -> primary-200
- Shadow: shadow-sm -> shadow-md
- Optional: slight scale (1.01)

Links:
- Underline appears or color shifts
- Cursor: pointer

Icons (if interactive):
- Color shift (gray-400 -> gray-600)
- Optional: slight scale (1.1)
```

---

## 5. Animation Guidelines

### 5.1 Timing Functions

| Name | Value | Usage |
|------|-------|-------|
| `ease-out` | `cubic-bezier(0, 0, 0.2, 1)` | Elements entering (modals, toasts) |
| `ease-in` | `cubic-bezier(0.4, 0, 1, 1)` | Elements exiting |
| `ease-in-out` | `cubic-bezier(0.4, 0, 0.2, 1)` | Elements moving position |
| `spring` | `cubic-bezier(0.175, 0.885, 0.32, 1.275)` | Bouncy, playful elements |

### 5.2 Duration Scale

| Duration | Value | Usage |
|----------|-------|-------|
| `fast` | 100ms | Micro-interactions (hover, focus) |
| `normal` | 200ms | Standard transitions |
| `slow` | 300ms | Complex transitions, modals |
| `slower` | 500ms | Page transitions, loading states |

### 5.3 Animation Patterns

#### Fade In

```css
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
/* Duration: 200ms, ease-out */
```

#### Slide Up

```css
@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
/* Duration: 200ms, ease-out */
```

#### Scale In

```css
@keyframes scaleIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}
/* Duration: 200ms, ease-out */
```

#### Spin (Loading)

```css
@keyframes spin {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}
/* Duration: 1000ms, linear, infinite */
```

#### Pulse (Skeleton Loading)

```css
@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}
/* Duration: 2000ms, ease-in-out, infinite */
```

### 5.4 Reduced Motion

Always respect user preferences:

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

---

## 6. Accessibility Requirements

### 6.1 WCAG 2.1 AA Compliance Checklist

#### Perceivable

- [ ] **1.1.1 Non-text Content**: All images have alt text
- [ ] **1.3.1 Info and Relationships**: Semantic HTML used (headings, lists, landmarks)
- [ ] **1.3.2 Meaningful Sequence**: DOM order matches visual order
- [ ] **1.3.3 Sensory Characteristics**: Instructions don't rely solely on color/shape
- [ ] **1.4.1 Use of Color**: Color not sole means of conveying information
- [ ] **1.4.3 Contrast (Minimum)**: 4.5:1 for normal text, 3:1 for large text
- [ ] **1.4.4 Resize Text**: Text can be resized to 200% without loss of content
- [ ] **1.4.10 Reflow**: Content reflows at 320px width without horizontal scroll
- [ ] **1.4.11 Non-text Contrast**: UI components and graphics have 3:1 contrast
- [ ] **1.4.12 Text Spacing**: No loss of content with adjusted text spacing

#### Operable

- [ ] **2.1.1 Keyboard**: All functionality accessible via keyboard
- [ ] **2.1.2 No Keyboard Trap**: Focus can be moved away from all components
- [ ] **2.4.1 Bypass Blocks**: Skip link to main content available
- [ ] **2.4.2 Page Titled**: Descriptive page titles
- [ ] **2.4.3 Focus Order**: Focus order preserves meaning
- [ ] **2.4.4 Link Purpose**: Link purpose clear from link text
- [ ] **2.4.6 Headings and Labels**: Headings and labels are descriptive
- [ ] **2.4.7 Focus Visible**: Keyboard focus is visible
- [ ] **2.5.3 Label in Name**: Accessible name includes visible text

#### Understandable

- [ ] **3.1.1 Language of Page**: Page language is identified
- [ ] **3.2.1 On Focus**: No unexpected context change on focus
- [ ] **3.2.2 On Input**: No unexpected context change on input
- [ ] **3.3.1 Error Identification**: Errors are identified and described
- [ ] **3.3.2 Labels or Instructions**: Input fields have labels/instructions
- [ ] **3.3.3 Error Suggestion**: Error correction suggestions provided
- [ ] **3.3.4 Error Prevention**: Confirmation for important actions

#### Robust

- [ ] **4.1.1 Parsing**: Valid HTML
- [ ] **4.1.2 Name, Role, Value**: Custom components have proper ARIA

### 6.2 Keyboard Navigation

| Key | Action |
|-----|--------|
| `Tab` | Move focus to next focusable element |
| `Shift + Tab` | Move focus to previous focusable element |
| `Enter` | Activate button, submit form, follow link |
| `Space` | Activate button, toggle checkbox |
| `Escape` | Close modal, dropdown, sidebar |
| `Arrow Keys` | Navigate within component (tabs, sliders, menus) |

### 6.3 Focus Management

```
Focus styles:
- Outline: 2px solid primary-500
- Outline-offset: 2px
- Border-radius: inherit from element

Focus trapping:
- Modal dialogs trap focus within
- First focusable element receives focus on open
- Focus returns to trigger on close

Skip links:
- "Skip to main content" link at top of page
- Visible on focus
- Links to main content area
```

### 6.4 ARIA Usage Guidelines

```
Use ARIA only when necessary:

1. Native HTML elements preferred over ARIA
   - Use <button> not <div role="button">
   - Use <nav> not <div role="navigation">

2. Required ARIA for custom components:
   - Sliders: role="slider", aria-valuemin, aria-valuemax, aria-valuenow, aria-valuetext
   - Tabs: role="tablist", role="tab", role="tabpanel", aria-selected
   - Modals: role="dialog", aria-modal="true", aria-labelledby
   - Alerts: role="alert" or aria-live="polite"

3. Live regions for dynamic content:
   - Toast notifications: aria-live="polite"
   - Error messages: aria-live="assertive"
   - Loading states: aria-busy="true"
```

### 6.5 Screen Reader Announcements

```
Announce these changes:
- Form submission success/error
- Page/tab navigation
- Modal open/close
- Loading states beginning/ending
- Dynamic content updates (new results, etc.)

Methods:
- Use aria-live regions
- Move focus to relevant content
- Update document.title for page changes
```

---

## 7. Mobile Considerations

### 7.1 Breakpoints

| Name | Range | Target Devices |
|------|-------|----------------|
| `xs` | < 475px | Small phones |
| `sm` | 475px - 639px | Large phones |
| `md` | 640px - 767px | Small tablets |
| `lg` | 768px - 1023px | Large tablets, small laptops |
| `xl` | 1024px - 1279px | Laptops, desktops |
| `2xl` | >= 1280px | Large desktops |

### 7.2 Touch Targets

```
Minimum touch target: 44x44px (iOS) / 48x48dp (Android)

Spacing between targets: minimum 8px

Apply to:
- Buttons
- Links
- Input fields
- Checkboxes/radio buttons
- Slider thumbs
- Tag remove buttons
- Navigation items
```

### 7.3 Mobile-Specific Patterns

#### Bottom Navigation (Optional Alternative)

```
For mobile, consider bottom nav instead of hamburger:
+--------------------------------+
|                                |
|  [Content Area]                |
|                                |
+--------------------------------+
| [Home] [Search] [Log] [More]   |
+--------------------------------+
```

#### Pull-to-Refresh

```
On dashboard and insights pages:
- Pull down to refresh data
- Show loading indicator
- Update content on success
```

#### Swipe Actions

```
On log entries (optional):
- Swipe left to reveal delete button
- Swipe right to reveal edit button
```

### 7.4 Mobile-Specific UI Adjustments

```
1. Larger text sizes for readability
   - Body: 16px minimum (prevents iOS zoom)
   - Headings: scale proportionally

2. Full-width elements
   - Buttons: full width on mobile
   - Cards: full width with consistent padding
   - Inputs: full width

3. Stacked layouts
   - Multi-column grids become single column
   - Side-by-side elements stack vertically

4. Simplified navigation
   - Hamburger menu or bottom nav
   - Fewer visible options
   - Clear back buttons

5. Reduced animations
   - Simpler transitions
   - Respect reduced-motion preference

6. Touch-optimized inputs
   - Appropriate keyboard types (email, number)
   - Date pickers use native controls
   - Select dropdowns use native controls
```

### 7.5 Mobile Performance

```
Optimize for mobile networks:
- Lazy load images and charts
- Minimize JavaScript bundle size
- Use efficient CSS (avoid heavy shadows on scroll)
- Implement skeleton loading states
- Cache API responses appropriately
```

---

## 8. Implementation Notes

### 8.1 Tailwind Configuration Update

The current `tailwind.config.js` needs to be extended with the design system tokens:

```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#ECFEFF',
          100: '#CFFAFE',
          200: '#A5F3FC',
          300: '#67E8F9',
          400: '#22D3EE',
          500: '#06B6D4',
          600: '#0891B2',
          700: '#0E7490',
          800: '#155E75',
          900: '#164E63',
        },
        secondary: {
          50: '#F5F3FF',
          100: '#EDE9FE',
          200: '#DDD6FE',
          300: '#C4B5FD',
          400: '#A78BFA',
          500: '#8B5CF6',
          600: '#7C3AED',
          700: '#6D28D9',
          800: '#5B21B6',
          900: '#4C1D95',
        },
      },
      fontFamily: {
        sans: ['Inter', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
      },
      spacing: {
        // Additional spacing if needed beyond Tailwind defaults
      },
      animation: {
        'fade-in': 'fadeIn 200ms ease-out',
        'slide-up': 'slideUp 200ms ease-out',
        'scale-in': 'scaleIn 200ms ease-out',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { opacity: '0', transform: 'translateY(10px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        scaleIn: {
          '0%': { opacity: '0', transform: 'scale(0.95)' },
          '100%': { opacity: '1', transform: 'scale(1)' },
        },
      },
    },
  },
  plugins: [],
}
```

### 8.2 CSS Updates Needed

Update `index.css` to use new color tokens:

```css
@layer components {
  .btn-primary {
    @apply bg-primary-600 text-white px-4 py-2 rounded-lg font-medium
           hover:bg-primary-700 focus:outline-none focus:ring-2
           focus:ring-primary-500 focus:ring-offset-2
           transition-colors disabled:opacity-50 disabled:cursor-not-allowed;
  }

  .btn-secondary {
    @apply bg-white text-gray-700 px-4 py-2 rounded-lg font-medium
           border border-gray-300 hover:bg-gray-50
           focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2
           transition-colors;
  }

  .btn-danger {
    @apply bg-red-600 text-white px-4 py-2 rounded-lg font-medium
           hover:bg-red-700 focus:outline-none focus:ring-2
           focus:ring-red-500 focus:ring-offset-2
           transition-colors disabled:opacity-50 disabled:cursor-not-allowed;
  }

  .input-field {
    @apply w-full px-3 py-2 border border-gray-300 rounded-lg
           focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent
           disabled:bg-gray-100 disabled:text-gray-500;
  }

  .card {
    @apply bg-white rounded-xl shadow-sm border border-gray-100 p-6;
  }

  .card-hoverable {
    @apply card hover:shadow-md hover:border-primary-200
           cursor-pointer transition-all duration-200;
  }
}
```

### 8.3 Component Migration Path

1. **Phase 1: Design Tokens**
   - Update Tailwind config
   - Update global CSS
   - Replace indigo with primary cyan throughout

2. **Phase 2: Base Components**
   - Create Button component with variants
   - Create Input component with states
   - Create Card component with options
   - Create Badge/Tag component

3. **Phase 3: Feature Components**
   - Enhance SymptomSlider with emojis and better accessibility
   - Create standalone IngredientCard component
   - Build InsightsPanel with sub-components
   - Build PredictionResult component

4. **Phase 4: Chart Components**
   - Implement WeeklyTrendChart
   - Implement IngredientFrequencyChart
   - Implement CorrelationMatrix

5. **Phase 5: Page Updates**
   - Update HomePage with new tokens
   - Update DashboardPage layout
   - Build full Insights page
   - Build Predictions page

### 8.4 Testing Checklist

Before considering a component complete:

- [ ] All visual states implemented (default, hover, focus, active, disabled, loading, error)
- [ ] Responsive at all breakpoints
- [ ] Keyboard accessible
- [ ] Screen reader tested
- [ ] Color contrast verified
- [ ] Touch targets verified on mobile
- [ ] Animations respect reduced-motion
- [ ] Error states handle gracefully
- [ ] Loading states implemented
- [ ] Empty states designed

---

## Appendix A: Color Contrast Reference

| Foreground | Background | Ratio | WCAG Level |
|------------|------------|-------|------------|
| gray-900 | white | 17.4:1 | AAA |
| gray-700 | white | 9.1:1 | AAA |
| gray-600 | white | 5.7:1 | AA |
| gray-500 | white | 4.0:1 | AA Large |
| primary-600 | white | 4.5:1 | AA |
| primary-700 | white | 5.9:1 | AA |
| danger-600 | white | 4.6:1 | AA |
| success-600 | white | 4.5:1 | AA |
| warning-600 | gray-900 | 4.1:1 | AA Large |

---

## Appendix B: Icon Reference

Using Lucide React icons throughout. Key icons:

| Icon | Usage |
|------|-------|
| `Home` | Dashboard nav |
| `Search` | Search nav, search input |
| `Calendar` | Logger nav, date picker |
| `TrendingUp` | Insights nav, trends |
| `Settings` | Settings nav |
| `LogOut` | Logout action |
| `Plus` | Add actions |
| `X` | Close, remove |
| `Check` | Success, completion |
| `AlertTriangle` | Warnings, triggers |
| `AlertCircle` | Info, notices |
| `Info` | Help text |
| `Loader2` | Loading spinner (animate-spin) |
| `Eye` / `EyeOff` | Password visibility |
| `ArrowRight` | Navigation, CTAs |
| `Menu` | Mobile hamburger |
| `Brain` | AI/ML features |
| `Activity` | Symptom tracking |

---

*Document Version: 1.0.0*
*Last Updated: January 20, 2026*
*Author: UI/UX Design Specialist*
