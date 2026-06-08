-- ====================================================================
-- SALES TREND ANALYSIS USING TIME-SERIES AGGREGATIONS
-- ====================================================================

-- Query 1: Full Historical Monthly Revenue and Order Volume Trend Analysis
SELECT 
    strftime('%Y', o.order_date) AS order_year,
    strftime('%m', o.order_date) AS order_month,
    COUNT(DISTINCT o.transaction_id) AS total_order_volume,
    SUM(o.units_sold) AS total_units_shipped,
    ROUND(SUM(o.amount), 2) AS total_monthly_revenue
FROM orders o
GROUP BY order_year, order_month
ORDER BY order_year ASC, order_month ASC;


-- Query 2: Executive Isolation: Extracting the Top 3 Peak Performing Months
-- Objective: Pinpoint historical seasonality spikes across the operational lifecycle
SELECT 
    strftime('%Y', o.order_date) AS order_year,
    strftime('%m', o.order_date) AS order_month,
    ROUND(SUM(o.amount), 2) AS peak_monthly_revenue
FROM orders o
GROUP BY order_year, order_month
ORDER BY peak_monthly_revenue DESC
LIMIT 3;