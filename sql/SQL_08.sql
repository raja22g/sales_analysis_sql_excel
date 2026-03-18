-- Part A — Overall Business Performance

USE data_analytics;
SELECT 
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(AVG(Sales),2) AS Avg_Order_Value,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Overall_Profit_Margin
FROM orders;

-- Part B — Top 10 Products by Sales
SELECT 
    Product_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Part C — Sales by Region
SELECT 
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Part D — Customer Concentration
SELECT 
    Customer_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;