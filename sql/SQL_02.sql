-- PART C — CASE WHEN (Flags & Business Logic)

-- Profit/Loss Flag:-
-- Goal: Identify loss-making orders.
USE data_analytics;
SELECT Order_Id, Profit,
CASE
WHEN Profit < 0 THEN "Loss"
ELSE "Profit"
END AS Profit_Loss_Flag
FROM orders;

-- Margin Status (Low / Medium / High):-
SELECT Order_ID, Profit_Margin,
  CASE
    WHEN Profit_Margin < 0.10 THEN 'Low Margin'
    WHEN Profit_Margin BETWEEN 0.10 AND 0.30 THEN 'Medium Margin'
    ELSE 'High Margin'
  END AS Margin_Status
FROM orders;

-- Shipping Status (based on Delivery_Days):-
SELECT Order_ID, Order_Date, Ship_Date,
CASE
	WHEN Delivery_Days <= 3 THEN "Fast"
    WHEN Delivery_Days BETWEEN 4 AND 7 THEN "Normal"
    ELSE "Delayed/Late"
END AS Shipping_Status
From orders;