--DATABASE MODEL

CREATE TABLE IF NOT EXISTS aisles
(
    aisle_id integer NOT NULL,
    aisle character varying(255),
    CONSTRAINT aisles_pkey PRIMARY KEY (aisle_id)
);


CREATE TABLE IF NOT EXISTS department
(
    department_id integer NOT NULL,
    department character varying(255),
    CONSTRAINT department_pkey PRIMARY KEY (department_id)
);

CREATE TABLE IF NOT EXISTS products
(
    product_id bigint NOT NULL,
    product_name text,
    aisle_id bigint,
    department_id bigint,
    unit_price integer,
    unit_cost numeric,
    CONSTRAINT products_pkey PRIMARY KEY (product_id),
    CONSTRAINT products_aisle_id_fkey FOREIGN KEY (aisle_id)
        REFERENCES public.aisles (aisle_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT products_department_id_fkey FOREIGN KEY (department_id)
        REFERENCES public.department (department_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS orders
(
    order_id bigint NOT NULL,
    user_id bigint,
    order_dow integer,
    order_hour_of_day integer,
    days_since_prior_order integer,
    product_id bigint,
    quantity integer,
    order_date date,
    order_status character varying(25),
    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

--BUSINESS QUESTIONS

--1. What is the distribution of orders by day of week and hour of day?
SELECT 
    CASE 
        WHEN order_dow = 0 THEN 'Sunday'
        WHEN order_dow = 1 THEN 'Monday'
        WHEN order_dow = 2 THEN 'Tuesday'
        WHEN order_dow = 3 THEN 'Wednesday'
        WHEN order_dow = 4 THEN 'Thursday'
        WHEN order_dow = 5 THEN 'Friday'
        WHEN order_dow = 6 THEN 'Saturday'
    END AS day_of_week,
    order_hour_of_day,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_dow, order_hour_of_day
ORDER BY order_dow, order_hour_of_day;


--2. What is the average basket size for each department?
SELECT d.department_id, d.department, AVG(o.quantity) AS avg_basket_size
FROM department d
LEFT JOIN products p ON d.department_id = p.department_id
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY d.department_id, d.department
ORDER BY avg_basket_size DESC;


--3. What are the most popular products purchased by customers?

SELECT p.product_id, p.product_name, SUM(o.quantity) AS total_quantity_purchased
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_purchased DESC;


--4. How frequently do customers place orders on Instacart?
SELECT user_id, 
       ROUND(AVG(days_since_prior_order),2) AS avg_days_between_orders,
       COUNT(*) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY avg_days_between_orders;

--5. What is the average basket size for customers?
SELECT user_id, 
       ROUND(AVG(quantity),2) AS avg_basket_size
FROM orders
GROUP BY user_id
ORDER BY avg_basket_size DESC;


--6. What are the most common days of the week for orders to be placed?
SELECT 
    CASE 
        WHEN order_dow = 0 THEN 'Sunday'
        WHEN order_dow = 1 THEN 'Monday'
        WHEN order_dow = 2 THEN 'Tuesday'
        WHEN order_dow = 3 THEN 'Wednesday'
        WHEN order_dow = 4 THEN 'Thursday'
        WHEN order_dow = 5 THEN 'Friday'
        WHEN order_dow = 6 THEN 'Saturday'
    END AS day_of_week,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_dow
ORDER BY order_count DESC;


--7. Retrieve the product names and their corresponding aisle names for products that have a unit price greater than the average unit price of all products in the database.
WITH avg_unit_price AS (
    SELECT AVG(unit_price) AS avg_price
    FROM products
)
SELECT p.product_name, a.aisle
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
CROSS JOIN avg_unit_price
WHERE p.unit_price > avg_unit_price.avg_price;


--8. Retrieve the product name and unit price of the products with the highest unit price in each department.
WITH ranked_products AS (
    SELECT
        product_id,
        product_name,
        unit_price,
        department_id,
        ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY unit_price DESC) AS rank
    FROM products
)
SELECT product_name, unit_price, department_id
FROM ranked_products
WHERE rank = 1;

--9. Retrieve the user_id and total number of orders for users who have placed more than 10 orders.
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 10;

--10. Write a query to retrieve the product name, aisle, and department name for all products with a unit price greater than the average unit price for all products.
SELECT p.product_name, a.aisle, d.department, p.unit_price
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
JOIN department d ON p.department_id = d.department_id
WHERE p.unit_price > (SELECT AVG(unit_price) FROM products);


--11. Write a query to retrieve the user IDs for all users who have placed at least one order with a product from aisle 1.
SELECT DISTINCT o.user_id
FROM orders o
WHERE EXISTS (SELECT 1 FROM products p WHERE p.aisle_id = 1 AND o.product_id = p.product_id);

--12. Write a query to retrieve the order IDs and order dates for all orders with a total quantity greater than the average total quantity for all orders.
SELECT o.order_id, o.order_date
FROM orders o
WHERE (SELECT SUM(quantity) FROM orders WHERE order_id = o.order_id) > (SELECT AVG(sum_qty) FROM (SELECT order_id, SUM(quantity) as sum_qty FROM orders GROUP BY order_id) as sq);

--OR 

WITH avg_total_quantity AS (
    SELECT AVG(quantity) AS avg_quantity
    FROM orders
)
SELECT order_id, order_date
FROM orders
CROSS JOIN avg_total_quantity
WHERE quantity > avg_total_quantity.avg_quantity;

--13. Write a query to retrieve the product name and unit price for all products that are sold in at least one order with a product from the same aisle and department.
SELECT DISTINCT p.product_name, p.unit_price
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
WHERE EXISTS (
    SELECT 1
    FROM products p2
    INNER JOIN orders o2 ON p2.product_id = o2.product_id
    WHERE p2.aisle_id = p.aisle_id
      AND p2.department_id = p.department_id
);

--14. Find all products that belong to a department with at least one product that costs more than $50:
SELECT p.product_id, p.product_name, p.unit_price, p.department_id
FROM products p
WHERE p.department_id IN (
    SELECT department_id
    FROM products
    WHERE unit_price > 50
);

--15. Return a list of users who have made at least 5 orders, along with the total number of orders they've made and the average number of days between orders.
WITH user_order_counts AS (
  SELECT user_id, COUNT(DISTINCT order_id) AS num_orders
  FROM orders
  GROUP BY user_id
  HAVING COUNT(DISTINCT order_id) >= 5
),
user_avg_days_since_prior_order AS (
  SELECT user_id, AVG(days_since_prior_order) AS avg_days_since_prior_order
  FROM orders
  WHERE days_since_prior_order IS NOT NULL
  GROUP BY user_id
)
SELECT uoc.user_id, uoc.num_orders, uad.avg_days_since_prior_order
FROM user_order_counts uoc
JOIN user_avg_days_since_prior_order uad ON uoc.user_id = uad.user_id;

--16. Shows the top 5 products by sales for the month of April 2023.
WITH monthly_sales AS (
  SELECT p.product_name, SUM(p.unit_price * o.quantity) AS total_sales
  FROM products p
  JOIN orders o ON o.product_id = p.product_id
  WHERE o.order_date BETWEEN '2023-04-01' AND '2023-04-30'
  GROUP BY p.product_name
)
SELECT product_name, total_sales
FROM monthly_sales
ORDER BY total_sales DESC
LIMIT 5;


--17. What is the average number of days between orders for users who have made at least 10 orders?
WITH user_avg_days_between_orders AS (
  SELECT user_id, AVG(days_since_prior_order) AS avg_days_between_orders
  FROM orders
  GROUP BY user_id
  HAVING COUNT(*) >= 10
)
SELECT ROUND(AVG(avg_days_between_orders))::text || ' ' || 'days' AS overall_avg_days_between_orders
FROM user_avg_days_between_orders;

--18. What are the top 5 best-selling products in each department for the last month?
WITH last_month_orders AS (
    SELECT *
    FROM orders
    WHERE order_date = date_trunc('month', CURRENT_DATE - INTERVAL '1 month')
)
SELECT d.department, p.product_name, SUM(o.quantity) AS total_quantity
FROM last_month_orders o
JOIN products p ON o.product_id = p.product_id
JOIN department d ON p.department_id = d.department_id
GROUP BY d.department, p.product_name
ORDER BY d.department, total_quantity DESC
LIMIT 5;







