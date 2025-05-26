USE online_sales;

SELECT *
FROM ecommerce_sales_cleaned;

CREATE TABLE ecommerce_sales
LIKE ecommerce_sales_cleaned;

INSERT INTO ecommerce_sales
SELECT *
FROM ecommerce_sales_cleaned;

SELECT *
FROM ecommerce_sales;

# CHECK FOR DUPLICATE
SELECT *, ROW_NUMBER() OVER(PARTITION BY row_id, order_id, year, order_date, ship_date, ship_mode, customer_id, customer_name, segment, country, city, state, postal_code, region, product_id, category, sub_category, product_name, sales, quantity, total_sales) AS ROW_NUM
FROM ecommerce_sales;

WITH DUPLICATE_CTE AS (
  SELECT *, ROW_NUMBER() OVER(PARTITION BY row_id, order_id, year, order_date, ship_date, ship_mode, customer_id, customer_name, segment, country, city, state, postal_code, region, product_id, category, sub_category, product_name, sales, quantity, total_sales) AS ROW_NUM
FROM ecommerce_sales
)
SELECT *
FROM DUPLICATE_CTE
WHERE ROW_NUM > 1;

-- NO DUPLICATES

# STANDARDIZATION AND SPELL CHECK
SELECT DISTINCT ship_mode
FROM ecommerce_sales;

SELECT DISTINCT customer_name
FROM ecommerce_sales;

SELECT DISTINCT segment
FROM ecommerce_sales;

SELECT DISTINCT country
FROM ecommerce_sales;

SELECT DISTINCT city
FROM ecommerce_sales;

SELECT DISTINCT state
FROM ecommerce_sales;

SELECT DISTINCT region
FROM ecommerce_sales;

SELECT DISTINCT category 
FROM ecommerce_sales;

SELECT DISTINCT sub_category
FROM ecommerce_sales;

SELECT DISTINCT product_name
FROM ecommerce_sales;

# Null and Blank Value Checks
SELECT 
  COUNT(*) AS total_records,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN ship_date IS NULL THEN 1 ELSE 0 END) AS missing_ship_date,
    SUM(CASE WHEN customer_id IS NULL OR customer_id = '' THEN 1 ELSE 0 END) AS missing_customer_id,
	SUM(CASE WHEN category IS NULL OR category = '' THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN region IS NULL OR region = '' THEN 1 ELSE 0 END) AS missing_region,
    SUM(CASE WHEN sub_category IS NULL OR sub_category = '' THEN 1 ELSE 0 END) AS missing_sub_category,
    SUM(CASE WHEN product_id IS NULL OR product_id = '' THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN total_sales IS NULL THEN 1 ELSE 0 END) AS missing_total_sales
FROM ecommerce_sales;

# DATA TYPE CHECK
SELECT *
FROM ecommerce_sales;

SELECT order_date,
STR_TO_DATE(order_date, '%Y-%m-%d') 
FROM ecommerce_sales;


ALTER TABLE ecommerce_sales
MODIFY COLUMN order_date DATE;

ALTER TABLE ecommerce_sales
MODIFY COLUMN ship_date DATE;


USE online_sales;

SELECT *
FROM ecommerce_sales;

# KPI's
--  TOTAL SALES 
SELECT SUM(total_sales) as Revenue
FROM ecommerce_sales;

-- QUANTITY SOLD 
SELECT SUM(quantity) as Total_Quantity
FROM ecommerce_sales;

-- NO OF CATEGORIES
SELECT COUNT(Distinct category) as Category
FROM ecommerce_sales;

-- NO OF SUB CATEGORIES
SELECT COUNT(Distinct sub_category) as Sub_Category
FROM ecommerce_sales;

-- TOTAL NUMBER OF CUSTOMERS
SELECT COUNT(customer_id) as Customer_count
FROM ecommerce_sales;

-- TOTAL NUMBER OF DISTINCT CUSTOMERS
SELECT COUNT(DISTINCT customer_id) as Customer_count
FROM ecommerce_sales;

                # INSIGHTS
# WHICH REGION GENERATES THE MOST SALES 
-- And what is our customer distribution across each region  
SELECT region, COUNT(DISTINCT customer_id) as customer_cnt, SUM(total_sales) as Total_sales
FROM ecommerce_sales
GROUP BY 1
ORDER BY 3 DESC;

# WHICH CATEGORY AND SUB-CATEGORY HAVE THE HIGHEST TOTAL SALES ACROSS ALL TRANSACTIONS?
-- CATEGORY 
SELECT category, SUM(quantity) as Units, SUM(total_sales) as Total_sales
FROM ecommerce_sales
GROUP BY 1
ORDER BY 3 DESC ;

-- SUB-CATEGORY
SELECT sub_category, SUM(quantity) as Units, SUM(total_sales) as Total_sales
FROM ecommerce_sales
GROUP BY 1
ORDER BY 2 DESC ;


# WHICH PRODUCT CATEGORIES HAVE THE HIGHEST SALES IN EACH REGION?
SELECT region, category, SUM(quantity) as Units  #, SUM(total_sales) as total_sales
FROM ecommerce_sales
GROUP BY 1,2
ORDER BY 1, 2;

-- WHAT IS THE TOTAL REVENUE GENERATED EACH YEAR? 
SELECT `year`, SUM(total_sales) as Total_sales
FROM ecommerce_sales
GROUP BY 1
ORDER BY 2 DESC;

# WHAT IS THE TOTAL QUANTITY OF PRODUCTS SOLD EACH YEAR?
SELECT `year`, SUM(quantity) as Units
FROM ecommerce_sales
GROUP BY 1
ORDER BY 2 DESC;


# WHAT IS THE MONTHLY SALES TREND?
SELECT DATE_FORMAT(order_date, '%Y-%m') as MoM, SUM(quantity) as Total_unit, SUM(total_sales)
FROM ecommerce_sales
GROUP BY 1
ORDER BY 1 ASC;



# WHICH PRODUCTS ARE MOST FREQUENTLY REQUESTED FOR IMMEDIATE DELIVERY?
 -- Where order_date = ship_date
SELECT sub_category, Count(category) as Count , `year`
FROM ecommerce_sales
WHERE order_date = ship_date
GROUP BY 1 , 3
ORDER BY 2 DESC;


# WHAT IS THE COMPARATIVE USAGE AND PERFORMANCE OF VARIOUS SHIPPING MODES? 
SELECT ship_mode, COUNT(ship_mode) as count
FROM ecommerce_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

SELECT ship_mode, COUNT(ship_mode) AS CNT, SUM(total_sales) AS total_sales
FROM ecommerce_sales
GROUP BY 1
ORDER BY 2 DESC;

# WHAT IS THE AVERAGE QUANTITY OF PRODUCTS PER ORDER?
SELECT ROUND(AVG(quantity),0)
FROM ecommerce_sales;


SELECT *
FROM ecommerce_sales;