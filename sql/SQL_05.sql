-- Part A — Performance & Efficiency

-- 1. Fastest vs Slowest Shipping Modes:-
USE data_analytics;
SELECT Ship_Mode, AVG(Delivery_Days) AS Avg_Delivery_Days
FROM orders
GROUP BY Ship_Mode
ORDER BY Avg_Delivery_Days;

-- 2. Late deliveries by ship mode (relative delays):-
SELECT Ship_Mode, COUNT(*) AS Late_Orders
FROM orders
WHERE Delivery_Days >= 6
GROUP BY Ship_Mode
ORDER BY Late_Orders DESC;

-- Part B: Loss-Driving Products & Categories

-- 1. Products that cause the highest losses:-
SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product_Name
HAVING Total_Profit < 0
ORDER BY Total_Profit
LIMIT 10;

-- 2. Categories with loss-heavy orders and percentage:-
SELECT 
  Category,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END) AS loss_orders,
  ROUND(
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS loss_percentage
FROM orders
GROUP BY Category;

-- Part C — Margin Intelligence
-- 1. Profit margin buckets (smart segmentation):-
SELECT
  CASE
    WHEN Profit_Margin < 0 THEN 'Loss'
    WHEN Profit_Margin < 0.10 THEN 'Low Margin'
    WHEN Profit_Margin < 0.30 THEN 'Medium Margin'
    ELSE 'High Margin'
  END AS Margin_Bucket,
  COUNT(*) AS Orders_Count
FROM orders
GROUP BY Margin_Bucket
ORDER BY Orders_Count DESC;