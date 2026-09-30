-- データソース: orders テーブル（社内 DWH）
-- 月次・地域別の売上合計
SELECT
  DATE_TRUNC('month', order_date) AS month,region,
  SUM(amount) AS total_sales
FROM orders
GROUP BY 1,2
ORDER BY 1,2;