-- データソース: orders テーブル（社内 DWH）
-- 月次売上の集計（地域別・前年同月比つき）
WITH monthly AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    region,
    SUM(amount) AS total_sales
  FROM orders
  GROUP BY 1, 2
),
with_last_year AS (
  SELECT
    *,
    LAG(total_sales, 12) OVER (PARTITION BY region ORDER BY month) AS last_year_sales
  FROM monthly
)
SELECT
  month,
  region,
  total_sales,
  total_sales / NULLIF(last_year_sales, 0) - 1 AS yoy_growth
FROM with_last_year
ORDER BY month, region;
