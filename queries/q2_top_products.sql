-- Q2. Top Products
SELECT
  v2ProductName,
  SUM(productQuantity) AS total_units_sold
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productQuantity IS NOT NULL
  AND transactionId IS NOT NULL
GROUP BY v2ProductName
ORDER BY total_units_sold DESC;
