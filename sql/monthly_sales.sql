-- 月次の売上合計
SELECT
  DATE_TRUNC('month', order_date) AS month,
  SUM(amount) AS total_sales
FROM orders
GROUP BY 1
ORDER BY 1;