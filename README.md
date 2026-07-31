# Ecommerce Sales Analysis — BigQuery SQL

## What it does
Analyzes real Google Analytics session data from the Google Merchandise Store
to answer business questions about revenue, traffic, and customer behavior.
Built as a portfolio project demonstrating SQL skills used in real data
analyst/data engineer work: aggregation, window-style session logic, 
subqueries, and data quality validation.

## Dataset
BigQuery Public Data: `data-to-insights.ecommerce.all_sessions`
Free to query via [console.cloud.google.com/bigquery](https://console.cloud.google.com/bigquery)
(1TB/month free tier)

## Key queries
All queries are in the `queries/` folder.

1. **Revenue by city** (`q1_revenue_by_city.sql`) — dedupes hit-level rows to
   session level before summing revenue, to avoid overcounting.
2. **Top products by units sold** (`q2_top_products.sql`) — see data quality
   note below.
3. **Overall conversion rate** (`q3_conversion_rate.sql`)
4. **Conversion rate by traffic channel** (`q4_conversion_by_channel.sql`)
5. **Cart abandoners with no purchase** (`q5_cart_abandonment.sql`)

## Data quality issue found and fixed
While writing the top-products query, I found `productQuantity` values as
high as 10^16 for some products, an obviously impossible result. Tracing it
back, these came from "add to cart" hits (`eCommerceAction_type = 3`) with
no `transactionId`, i.e. unvalidated client-side tracking data rather than
real purchases. Fixed by filtering to rows with a non-null `transactionId`,
which represent actual completed transactions. Final numbers dropped from
10^16 to realistic values in the tens of thousands.

## Dashboard
Live dashboard built in Looker Studio, connected directly to saved BigQuery
views (`v_revenue_by_city`, `v_top_products`, `v_conversion_by_channel`,
`v_cart_abandonment`):

🔗 [View live dashboard](https://datastudio.google.com/reporting/9aad36e9-54f8-4376-bddb-0c03c27d1da8)

![Dashboard screenshot](Ecommerce_Sales_Analysis_—_Google_Merch_Store.pdf)

## Key findings
- Referral traffic converts at 12.2%, far higher than any other channel,
  while Organic Search brings the most volume (255k sessions) but converts
  at just 1.59%.
- Overall site conversion rate is 4.57%.
- A small number of visitors account for 100+ cart-add sessions each with
  zero completed purchases, strong candidates for retention campaigns.

## Skills demonstrated
BigQuery SQL, aggregation, subqueries, session-level deduplication logic,
data quality investigation and validation, Looker Studio dashboarding
