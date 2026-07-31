-- Q1: Which cities generated the highest total revenue?
SELECT
  country,
  city,
  SUM(totalTransactionRevenue) / 1000000 AS total_revenue_usd
FROM (
  SELECT DISTINCT
    fullVisitorId,
    visitId,
    country,
    city,
    totalTransactionRevenue
  FROM `data-to-insights.ecommerce.all_sessions`
)
GROUP BY country, city
ORDER BY total_revenue_usd DESC;
