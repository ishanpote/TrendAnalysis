# Corporate Sales Trend Analysis & Chronological Aggregation Pipeline

## 📌 Project Overview

This repository contains a high-performance **relational analytics platform** optimized to track timeline growth patterns, seasonal sales volume shifts, and macro transactional trends from historical corporate sales data. The system processes raw transactional records and synthesizes actionable business intelligence metrics through chronological aggregation.

The pipeline is implemented in **Python** with **SQLite** as the backend database engine, enabling fast queries and efficient data processing entirely within a local development environment.

---

## 🎯 Key Objectives

- **Track Sales Trends**: Analyze month-over-month and year-over-year revenue patterns
- **Identify Peak Performance**: Isolate top-performing periods to inform business strategy
- **Aggregate Metrics**: Compile operational KPIs including order volume, units shipped, and revenue growth
- **Enable Insights**: Provide stakeholders with clear visibility into transactional patterns and seasonal trends

---

## 🏗️ Core Database Architecture

The analytics engine processes historical transaction ledgers (`orders` table) to generate critical business intelligence dimensions:

### Data Transformation Pipeline

1. **Chronological Data Bucketing**
   - Uses SQL time-formatting expressions (`strftime('%Y-%m', order_date)`) to group raw transactional records into synchronized year/month cohorts
   - Eliminates data fragmentation across multiple time dimensions
   - Enables seamless month-to-month comparisons

2. **Key Metric Compilation**
   - **Order Volume**: `COUNT(DISTINCT transaction_id)` — Total transaction count per period
   - **Units Shipped**: `SUM(units_sold)` — Aggregate unit sales per period
   - **Revenue Growth**: Revenue trends and period-over-period variance analysis

3. **Performance Ranking**
   - Top-tier performers isolated using strict limiters (`LIMIT 3`)
   - Identifies peak earning periods to optimize logistics and inventory planning

---

## 📊 Analytical Capabilities

### Trend Analysis
- **Steady Volume Tracking**: Structured chronological timeline reveals consistent revenue streams
- **Seasonal Pattern Detection**: Identifies recurring seasonal fluctuations in sales volume
- **Growth Trajectories**: Monitors cumulative growth trends across the dataset

### Performance Metrics
- **Peak Performance Identification**: Pinpoints highest-earning calendar months
- **Revenue Patterns**: Visualizes revenue distribution across time periods
- **Comparative Analysis**: Month-over-month and year-over-year performance comparisons

---

## 📂 Repository Structure

```
TrendAnalysis/
├── data/
│   ├── Online Sales Data.csv       # Raw transactional data (CSV source)
│   └── online_sales.db             # Generated SQLite database
├── src/
│   ├── import_uploaded_sales.py    # Data ingestion and ETL script
│   └── analyze_trends.sql          # SQL analytical queries
└── README.md                       # Project documentation
```

---

## 🗄️ Database Schema

### `orders` Table
| Column | Type | Description |
|--------|------|-------------|
| `transaction_id` | INTEGER (PK) | Unique transaction identifier |
| `order_date` | DATE | Transaction date |
| `units_sold` | INTEGER | Quantity of units in transaction |
| `revenue` | DECIMAL | Transaction revenue amount |
| *additional fields* | — | Product, customer, and regional dimensions |

---

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- SQLite3
- pandas library

### Installation & Execution

1. **Clone the repository**
   ```bash
   git clone https://github.com/ishanpote/TrendAnalysis.git
   cd TrendAnalysis
   ```

2. **Install dependencies**
   ```bash
   pip install pandas sqlite3
   ```

3. **Run the data import script**
   ```bash
   python src/import_uploaded_sales.py
   ```
   This script will:
   - Read the CSV data from `data/Online Sales Data.csv`
   - Normalize column headers
   - Create/populate the SQLite database at `data/online_sales.db`

4. **Execute analytical queries**
   ```bash
   sqlite3 data/online_sales.db < src/analyze_trends.sql
   ```

---

## 📋 Sample Queries

### Monthly Revenue Aggregation
```sql
SELECT 
    strftime('%Y-%m', order_date) as year_month,
    COUNT(DISTINCT transaction_id) as order_count,
    SUM(units_sold) as total_units,
    SUM(revenue) as total_revenue
FROM orders
GROUP BY strftime('%Y-%m', order_date)
ORDER BY year_month DESC;
```

### Top 3 Peak Performing Months
```sql
SELECT 
    strftime('%Y-%m', order_date) as year_month,
    SUM(revenue) as monthly_revenue
FROM orders
GROUP BY strftime('%Y-%m', order_date)
ORDER BY monthly_revenue DESC
LIMIT 3;
```

---

## 🔍 Database Visualization

### SQLite Browser Output
<img width="706" height="859" alt="Screenshot 2026-06-08 233101" src="https://github.com/user-attachments/assets/bf8e4457-4870-480f-ba53-683b1d4a9721" />
<img width="560" height="839" alt="Screenshot 2026-06-08 233133" src="https://github.com/user-attachments/assets/bb1c9db1-2a34-49d5-a4fc-b23a6df322f9" />

You can visualize the database using:
- **SQLite Browser** (DB Browser for SQLite) - GUI tool for exploring database contents
- **sqlite3 CLI** - Command-line interface for executing queries
- **Python** - Using pandas to read and display results

---

## 📈 Project Insights

- **Consistent Performance**: Sales volume remains relatively stable across tracked periods
- **Seasonal Patterns**: Clear seasonal fluctuations observed in Q4 and Q1 cycles
- **Peak Months**: Historical top performers identified for strategic planning
- **Data Quality**: Clean, normalized dataset with comprehensive transaction coverage

---

## 🛠️ Technologies Used

| Component | Technology |
|-----------|-----------|
| Database | SQLite 3 |
| Data Processing | Python 3 + pandas |
| Query Language | SQL |
| Development Environment | VS Code |

---

## 👤 Author

**Ishan Pote**  
[GitHub Profile](https://github.com/ishanpote)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/ishanpote/TrendAnalysis/issues).

