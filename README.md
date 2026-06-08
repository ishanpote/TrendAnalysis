# Corporate Sales Trend Analysis & Chronological Aggregation Pipeline

## 📌 Project Overview
This repository contains a high-performance relational analytics matrix optimized to track timeline growth patterns, seasonal sales volume shifts, and macro transactional trends using an uploaded real-world retail sales dataset. By deploying structural date segment extractions and mathematical group boundaries, this engine aggregates individual invoice lines into clean, structured monthly performance summaries.

The pipeline is managed entirely within VS Code and utilizes an optimized **SQLite** engine architecture.

---

## 🏗️ Core Database Architecture & Aggregation Rules
The analytics script runs against historical transaction ledgers (`orders`) to synthesize vital operational dimensions simultaneously:
1. **Chronological Group Placement:** Uses string-formatting expressions (`strftime('%Y', order_date)`) to cleanly bundle raw data records into synchronized year/month columns, avoiding multi-year timeline cross-contamination.
2. **Key Metric Compilation:** Generates key business intelligence parameters per month, including total order volume (`COUNT(DISTINCT transaction_id)`), units shipped (`SUM(units_sold)`), and gross revenue (`SUM(amount)`).

---

## 📊 Analytical Script Discoveries & Takeaways
* **Steady Volume Trends:** Running the grouping queries against the dataset builds a structured, chronological timeline tracking monthly revenue streams, giving stakeholders clear visibility into seasonal demand shifts.
* **Top-Tier Peak Performance Metrics:** Utilizing strict limiters (`LIMIT 3`), the database engine isolates the highest-earning calendar months in company history, helping logistics teams optimize inventory stocking levels and supply chain capacity for future cycles.

---

## 📂 Repository File Structure
```text
├── data/
│   ├── Online Sales Data.csv       # Uploaded raw transactional source file
│   └── online_sales.db             # Generated relational SQLite database
├── src/
│   ├── import_uploaded_sales.py    # Python ingestion and header normalization script
│   └── analyze_trends.sql          # Time-series SQL analytical queries
└── README.md                       # Comprehensive analytical portfolio documentation