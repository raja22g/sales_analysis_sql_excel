-- Part A — Advanced Filtering & Date Logic
USE data_analytics;

-- 1. Orders by Year & Month (Date mastery):-
SELECT Order_Year, Order_Month, COUNT(*) AS total_orders
FROM orders
GROUP BY Order_Year, Order_Month
ORDER BY Order_year, Order_month;

-- 2. Orders shipped late (took more than 7 days) (real ops question):-
SELECT COUNT(*) AS delayed_orders
FROM orders
WHERE delivery_days > 7;


-- Part B — Ranking & Top-N Analysis

-- 1. Top 5 products by profit:-
SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 5;

-- 2. Bottom 5 products by profit (loss focus):-
SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product_Name
ORDER BY Total_Profit
LIMIT 5;


-- Part C — Business Segmentation using CASE WHEN

-- 1. High vs Low Sales orders:-
SELECT Order_ID, Product_Name, Sales,
CASE
	WHEN Sales >= 500 THEN "High Sales"
    ELSE "Low Sales"
    END AS Sales_Category
FROM orders;


-- Part D — Correlation Thinking

-- 1. Does high discount reduce profit?
SELECT Discount, AVG(Profit) AS avg_profit
FROM orders
GROUP BY Discount
ORDER BY Discount;