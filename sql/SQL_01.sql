USE data_analytics;

-- PART B
-- SECTION 01 (Get Comfortable with the Table):-

SHOW TABLES;

DESCRIBE orders;

SELECT * FROM orders
LIMIT 10;

-- SECTION 02 (SELECT + WHERE):-

-- Select only useful columns:-
SELECT Order_ID, Order_Date, Sales, Profit
FROM orders;

-- Filter: orders with negative profit:-
SELECT Order_ID, Sales, Profit
FROM orders
WHERE Profit < 0;

-- Filter by year (2015):-
SELECT Order_ID, Order_Date, Sales
FROM orders
WHERE Order_Year = 2015;
/* OR
WHERE year(str_to_date(order_date,"%d-%m-%Y")) = 2015; */

-- Multiple conditions:-
SELECT Order_ID, Region, Sales, Profit
FROM orders
WHERE Order_Year = 2015
  AND Region = 'Western Europe';
  
-- Section 03 (Aggregations):-

-- Total Sales:-
SELECT SUM(Sales) AS total_sales
FROM orders;

-- Total profit (negative check):-
SELECT SUM(Profit) AS total_profit
FROM orders;

-- Debugging rows count (if mysql imported rows != excel rows)
SELECT product_name
FROM orders;

SET sql_safe_updates= 0;

UPDATE orders
SET product_name = TRIM(BOTH '"' FROM product_name);

UPDATE orders
SET product_name = REPLACE(product_name, '""', '"');

SELECT product_name FROM orders;

/* For verification...
SELECT product_name
FROM orders
WHERE product_name LIKE '%""%' LIMIT 5; This should return 0 rows... */

-- Total Orders:-
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- Orders with negative profit:-
SELECT COUNT(*) AS negative_profit_orders
FROM orders
WHERE Profit < 0;

-- SECTION 4 — (GROUP BY):-

-- Sales by Region:-
SELECT Region, SUM(Sales) AS total_sales
FROM orders
GROUP BY Region;

-- Profit by Category:-
SELECT Category, SUM(Profit) AS total_profit
FROM orders
GROUP BY Category;

-- Average profit margin by region:-
SELECT Region, AVG(Profit_Margin) AS Average_Profit_Margin
FROM orders
GROUP BY Region;


-- SECTION 5 — (ORDER BY + LIMIT):-

-- Top 5 profitable regions:-
SELECT Region, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC
LIMIT 5;

-- Worst 5 regions:-
SELECT Region, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit ASC
LIMIT 5;