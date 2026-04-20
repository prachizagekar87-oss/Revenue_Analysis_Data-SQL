create database revenue_analysis;

use revenue_analysis;

-- Viwed all data
SELECT * FROM revenue_analysis ;


## Show datatypes
describe revenue_analysis;

SELECT COUNT(*) AS total_rows FROM revenue_analysis;

-- Overall Business Performance 
-- Total Revenue of Company
SELECT SUM(revenue) AS total_revenue
FROM revenue_analysis;

--  Total Profit of a company
SELECT SUM(profit) AS total_profit
FROM revenue_analysis;

-- Total Cost of acompany
SELECT SUM(cost) AS total_cost
FROM revenue_analysis;

-- Total transaction
SELECT COUNT(*) AS total_transactions
FROM revenue_analysis;

-- Overall profit Margin of a company
SELECT 
    (SUM(profit) / SUM(revenue)) * 100 AS overall_profit_margin_percentage
FROM revenue_analysis;

--  Top Revenue Generating Product
-- Laptop Total Revenue
SELECT 
    SUM(revenue) AS laptop_revenue
FROM revenue_analysis
WHERE product_name = 'Laptop';

-- Tablet Total Revenue
SELECT 
    SUM(revenue) AS tablet_revenue
FROM revenue_analysis
WHERE product_name = 'Tablet';

-- Smart Phone total REvenue
SELECT 
    SUM(revenue) AS smartphone_revenue
FROM revenue_analysis
WHERE product_name = 'Smartphone';

--  Top 5 Rating product 
SELECT 
    product_name,
    SUM(revenue) AS total_revenue
FROM revenue_analysis
WHERE product_name IN ('Laptop','Tablet','Smartphone','Monitor','Printer')
GROUP BY product_name
ORDER BY total_revenue DESC;

-- Total revenue by categories
SELECT 
    category,
    SUM(revenue) AS total_revenue
FROM revenue_analysis
GROUP BY category
ORDER BY total_revenue DESC;

-- Top revenue by month
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(revenue) AS total_revenue
FROM revenue_analysis
GROUP BY YEAR(date), MONTH(date)
ORDER BY total_revenue DESC;

-- Revenue by region
SELECT 
    region,
    SUM(revenue) AS total_revenue
FROM revenue_analysis
GROUP BY region
ORDER BY total_revenue DESC;

--  Payment mode
SELECT 
    DATE_FORMAT(date, '%Y-%M') AS month_year,
    SUM(CASE WHEN sales_channel = 'Online' THEN 1 ELSE 0 END) AS online_transactions,
    SUM(CASE WHEN sales_channel = 'Retail Store' THEN 1 ELSE 0 END) AS offline_transactions,
    COUNT(*) AS total_transactions
FROM revenue_analysis
GROUP BY month_year
ORDER BY total_transactions DESC;


