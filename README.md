# Commodity Price Analysis in Gaza: Before & After the War

## Overview
An end-to-end data analysis project examining how the prices of essential goods
and services in the Gaza Strip changed from before the war through its extended
months. Behind every price change are people struggling to secure basic needs —
this project turns official statistics into evidence for humanitarian response.

## Problem Statement
What are the underlying causes of the drastic surge in commodity prices in Gaza
during the war, and which categories and items were hit hardest?

## Data
| Metric | Value |
|:---|:---|
| Source | Palestinian Central Bureau of Statistics (PCBS) |
| Commodities analyzed | 46 |
| Time period | September 2023 – August 2026 |
| Data type | Monthly prices + monthly % change |
| Privacy | Aggregated official statistics — no personal data |

## Methodology (MEAL Framework)
- **Shock Change %** — immediate price jump after October 7, 2023
- **Cumulative Change %** — total change over the full period
- **Peak Price** — highest price reached by each commodity
- Category mapping: Water / Fuel / Staple Food / Other Food / Non-Essential

## Repository Structure
```
gaza-commodity-price-analysis/
├── data/
│   └── gaza_prices_clean.csv       # cleaned dataset (PCBS public data)
├── sql/
│   └── analysis_queries.sql        # exploratory & analytical queries
├── dashboard/
│   └── dashboard_overview.png      # Power BI dashboard screenshot
├── reports/
│   └── Gaza_Commodity_Prices_Report.pdf
└── README.md
```

## Key Findings

### 1. Transportation: The Sharpest Shock
| Commodity | Immediate Shock |
|:---|:---|
| Transport (North -> Central Gaza) | +2400% |
| Transport (North -> South Gaza) | +1775% |
| Diesel | +208% |
| Gasoline | +199% |

Driven by the shortage of vehicle spare parts, severe fuel scarcity under
blockade, and the collapse of the functioning vehicle fleet.

### 2. The Silent Water Crisis (Cumulative Change)
| Commodity | Cumulative Change |
|:---|:---|
| Trucked water (1000L) | +522% |
| Trucked water (500L) | +407% |
| Trucked water (250L) | +365% |

Destroyed desalination infrastructure, repeated displacement, and fuel-driven
pumping/transport costs compounded the crisis.

### 3. Fuel Leads Category-Level Change
Fuel recorded the highest average change, with a cascading effect on nearly
every other sector of daily life.

## Dashboard (Power BI)
- 4 KPI cards — max shock %, water items count, average fuel change, total items
- Bar chart — top commodities by price shock
- Bar chart — average change by category
- Scatter plot — price before vs. after the war
- Donut chart — distribution by category
- Detailed table — full figures per commodity
- Interactive slicer — filter by category

## Data Limitations
Four commodities (Egyptian rice, Basmati rice, Egyptian flour 25kg/50kg) had no
recorded pre-war price — substitute imports that entered the market only after
the crisis began. Percentage change could not be calculated for these items;
treated as a methodological limitation, not a data flaw.

## Recommendations
1. Facilitate the entry of essential goods through coordinated humanitarian
   channels, prioritizing items with the highest price shock (fuel, basic food).
2. Advocate for the entry of fuel and vehicle spare parts — the main driver of
   transportation costs with cascading effects across all sectors.
3. Support rehabilitation of water infrastructure, including well-drilling
   materials and reopening desalination plants.

## Tools
SQL (exploratory analysis) | Power BI (dashboard) | Excel (data cleaning)

## Author
**Mahmoud Algoul** — Data Analyst
[LinkedIn](https://www.linkedin.com/in/mahmoud-algoul-0306b2249/) | [GitHub](https://github.com/YOUR-USERNAME)
