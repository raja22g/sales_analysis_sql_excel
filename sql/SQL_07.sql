-- Part A — Category Profitability Analysis

USE data_analytics;
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percentage
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Part B — Sub-Category Risk Analysis

SELECT 
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Profit;

-- Part C — Discount Impact on Profit

SELECT 
    ROUND(Discount*100,0) AS Discount_Percentage,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM orders
GROUP BY Discount_Percentage
ORDER BY Discount_Percentage;