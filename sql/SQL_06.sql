-- Part A — Advanced SQL Patterns

-- 1. Top 5 customers by total profit:-
USE data_analytics;
SELECT
	Customer_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Profit DESC
LIMIT 5;

-- 2. Customers who place many orders but still cause losses:-
SELECT
	Customer_Name,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Customer_Name
HAVING Total_Orders >= 10 AND Total_Profit < 0
ORDER BY Total_Profit;

-- Part B — Window Functions

-- 1. Rank products by profit within each category...
SELECT
	Category,
    Product_Name,
    SUM(Profit) AS Total_Profit,
    ROW_NUMBER() OVER (
		PARTITION BY Category
        ORDER BY SUM(Profit) DESC ) AS Profit_Rank
FROM Orders
GROUP BY Category, Product_Name;

-- 2. Find top 3 products per category...
SELECT *
FROM (
	SELECT
		Category,
        Product_Name,
        SUM(Profit) AS Total_Profit,
        RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS Profit_Rank
	FROM orders
    GROUP BY Category, Product_Name
    ) t
    WHERE Profit_Rank <= 3;

-- Part C — Trend Comparison

-- 1. Year-over-year growth using window functions...
SELECT
	Order_Year,
    SUM(Sales) AS Total_Sales,
    LAG(SUM(Sales)) OVER (
		ORDER BY Order_Year) AS Prev_Year_Sales,
	ROUND(
    (SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY Order_Year)) 
    / LAG(SUM(Sales)) OVER (ORDER BY Order_Year) * 100,
    2
  ) AS Growth_Percentage
FROM orders
GROUP BY Order_Year;