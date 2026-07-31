-- Q5. Number of products which were added but not purchased
SELECT
  fullVisitorId,
  COUNT(DISTINCT visitId) AS sessions_with_cart_add
FROM `data-to-insights.ecommerce.all_sessions`
WHERE fullVisitorId IN (
  SELECT DISTINCT fullVisitorId
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE eCommerceAction_type = '3'
)
AND fullVisitorId NOT IN (
  SELECT DISTINCT fullVisitorId
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE eCommerceAction_type = '6'
)
GROUP BY fullVisitorId
ORDER BY sessions_with_cart_add DESC
--LIMIT 10;
