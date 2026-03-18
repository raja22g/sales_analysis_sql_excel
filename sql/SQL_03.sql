-- PART D — Loss Analysis (Important)

-- Loss-making sub-categories (real losses):-
USE data_analytics;
SELECT Category, Sub_Category, SUM(Profit) AS total_profit
FROM orders
GROUP BY Category, Sub_Category
HAVING total_profit < 0
ORDER BY total_profit;

-- Top 5 loss-making products:-
SELECT Product_Name, SUM(Profit) AS total_loss
FROM orders
GROUP BY Product_Name
HAVING total_loss < 0
ORDER BY total_loss
LIMIT 5;


-- PART E — Business Insight (Mini Analysis)

-- Is high sales always high profit?
SELECT Product_Name,
	   SUM(Sales) AS Total_Sales,
       Sum(Profit) AS Total_Profit
From orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;