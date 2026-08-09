# 🚗 Uber Driver Bonus Scheme Analysis

### 🚀 Executive Summary
**Goal:** Decide which of two driver bonus structures gets more cars on the road for a high-demand Saturday, at the lower cost.
**Role:** Data Analyst.
**Tools:** SQL (filtering, conditional aggregation, subqueries, type casting).

---

## 📖 The Story
Demand is forecast to spike on an upcoming Saturday and Uber needs significantly more drivers online than the previous week. Two incentive schemes are on the table, and they reward completely different behaviour: one pays a flat sum for meeting a quality bar, the other pays per trip for volume.

Operations needed to know the cost of each, and who each one leaves out.

**Option 1 — flat $50** per driver who, in the time frame:
* works at least **8 supply hours**
* accepts at least **90%** of requests
* completes at least **10 trips**
* holds a rating of **4.7 or better**

**Option 2 — $4 per completed trip** for every driver who:
* completes at least **12 trips**
* holds a rating of **4.7 or better**

---

## 🔍 Key Questions & Approach

### 1. What does Option 1 cost?
* **The Approach:** Counted drivers clearing all four conditions and multiplied by the $50 flat rate.
* **Result:** <!-- payout --> across <!-- n --> qualifying drivers.

### 2. What does Option 2 cost?
* **The Approach:** Summed `trips_completed * 4` across drivers meeting the trip and rating thresholds — the payout scales with volume rather than headcount.
* **Result:** <!-- payout --> across <!-- n --> qualifying drivers.

### 3. Who wins under Option 1 but loses under Option 2?
* **The Approach:** Isolated drivers completing 10 or 11 trips who met the acceptance, hours and rating bars — the group that clears the quality bar but not the volume bar.
* **Result:** <!-- n --> drivers.
* **Why it matters:** These are exactly the drivers Option 2 alienates. They're doing everything asked of them on quality and getting nothing.

### 4. How many drivers are high-rated but low-engagement?
* **The Approach:** Calculated the share of drivers completing fewer than 10 trips *and* accepting under 90% of requests while still holding a 4.7+ rating, using explicit `CAST` to `FLOAT` so integer division didn't silently zero the result.
* **Result:** <!-- % --> of drivers online.
* **Why it matters:** Good drivers who aren't engaged are the largest addressable pool — neither bonus currently reaches them.

---

## ✅ Findings & Recommendation

| | Option 1 (flat $50) | Option 2 ($4/trip) |
|---|---|---|
| **Total payout** | <!-- $ --> | <!-- $ --> |
| **Drivers paid** | <!-- n --> | <!-- n --> |
| **Cost per driver** | $50 (fixed) | <!-- $ --> (variable) |
| **Rewards** | Quality + availability | Raw volume |
| **Excludes** | High-volume drivers with low acceptance | Quality drivers at 10–11 trips |

**Recommendation:** <!-- One or two sentences: which option, and why — cost, coverage, or behaviour it drives. -->

**The trade-off in one line:** Option 1 buys *reliability* — it pays for acceptance rate and hours online, which is what keeps riders from waiting. Option 2 buys *throughput* — it pays for completed trips regardless of how many requests were declined to get there. On a surge Saturday, the question is whether the constraint is cars on the road or trips completed per car.

---

## 🛠️ Technical Skills Demonstrated
* **Multi-condition filtering:** Compound `WHERE` clauses translating business rules directly into logic.
* **Conditional aggregation:** `COUNT` and `SUM` over filtered populations to price each scheme.
* **Type casting:** Explicit `CAST(... AS FLOAT)` to avoid integer division returning 0 — a silent failure that would have made the percentage look correct and be wrong.
* **Subqueries:** Nested aggregate over a filtered subset divided by the full population to produce a share.

---

## 🗂️ Dataset Schema
Queries run against `uber_dataset`:

| Column | Description |
|---|---|
| `Driver_ID` | Unique identifier for each driver |
| `Supply_Hours` | Total hours the driver was online |
| `Trips_Completed` | Number of successfully finished trips |
| `Acceptance_percentage` | Percentage of trip requests accepted |
| `Rating` | The driver's average rating |

---

## ▶️ Reproducing
1. Load `uber_dataset.csv` into your SQL environment as a table named `uber_dataset`.
2. Run `Uber Partner Business Modeling.sql` top to bottom — each query is preceded by the question it answers.

---

## 📊 Future Improvements
* **Model a hybrid:** A smaller flat bonus at 10 trips plus a per-trip rate above 12 would cover both groups. Worth pricing.
* **Sensitivity analysis:** Vary the trip threshold from 8 to 15 and plot payout against drivers reached to find the efficient point.
* **Estimate the behavioural response:** Cost is only half the decision — the scheme that pays less but converts fewer drivers isn't the cheaper one.

---

### 👋 About Me
Data Analyst based in **Manchester, UK**, working in **SQL, Excel, Tableau and Power BI**.
[LinkedIn](https://www.linkedin.com/in/ibomeno-basiekanem/) · [Portfolio](https://thelordbass.github.io/)
