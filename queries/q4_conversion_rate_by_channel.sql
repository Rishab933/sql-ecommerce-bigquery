-- Q4. Conversion rate by channel
SELECT
  channelGrouping,
  COUNT(DISTINCT CASE WHEN transactions >= 1 THEN CONCAT(fullVisitorId, '-', visitId) END) AS converting_sessions,
  COUNT(DISTINCT CONCAT(fullVisitorId, '-', visitId)) AS total_sessions,
  ROUND(
    COUNT(DISTINCT CASE WHEN transactions >= 1 THEN CONCAT(fullVisitorId, '-', visitId) END)
    / COUNT(DISTINCT CONCAT(fullVisitorId, '-', visitId)) * 100, 2
  ) AS conversion_rate_pct
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY channelGrouping
ORDER BY conversion_rate_pct DESC;
