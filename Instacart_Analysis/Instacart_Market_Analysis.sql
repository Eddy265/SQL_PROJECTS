CREATE TABLE IF NOT EXISTS aisles
(
    aisle_id integer NOT NULL,
    aisle character varying(255),
    CONSTRAINT aisles_pkey PRIMARY KEY (aisle_id)
);


CREATE TABLE department (
  department_id INT,
  department VARCHAR(255),
  PRIMARY KEY (department_id)
);


CREATE TABLE products (
  product_id INT,
  product_name VARCHAR(255),
  aisle_id INT,
  department_id INT,
  PRIMARY KEY (product_id),
  FOREIGN KEY (aisle_id) REFERENCES aisles(aisle_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);


CREATE TABLE orders (
  order_id BIGINT,
  user_id bigint,
  eval_set VARCHAR(255),
  order_number BIGINT,
  order_dow INT,
  order_hour_of_day INT,
  days_since_prior_order INT,
  PRIMARY KEY (order_id)
);

CREATE TABLE order_products_prior (
  order_id BIGINT,
  product_id BIGINT,
  add_to_cart_order INT,
  reordered VARCHAR(255),
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

ALTER TABLE products
ADD COLUMN order_id BIGINT,
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);



SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_products_train;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM aisles;
SELECT COUNT(*) FROM department;


--JOIN ALL 
SELECT *
FROM orders o
  JOIN order_products_train op ON o.order_id = op.order_id
  JOIN products p ON op.product_id = p.product_id
  JOIN aisles a ON p.aisle_id = a.aisle_id
  JOIN department d ON p.department_id = d.department_id;


--order and product
SELECT
  o.order_id,
  p.product_id,
  p.product_name,
  p.aisle_id,
  p.department_id
FROM
  orders o
  JOIN order_products_train op ON o.order_id = op.order_id
  JOIN products p ON op.product_id = p.product_id



--1. What are the top 10 most popular products by department?
SELECT
  d.department,
  p.product_name,
  COUNT(*) AS total_orders
FROM
  orders o
  JOIN order_products_train op ON o.order_id = op.order_id
  JOIN products p ON op.product_id = p.product_id
  JOIN department d ON p.department_id = d.department_id
GROUP BY
  d.department,
  p.product_name
ORDER BY
  d.department,
  total_orders DESC
LIMIT 10;


--2. What are the top 10 products that are most often reordered?
SELECT
  p.product_name,
  COUNT(*) AS total_reordered
FROM
  order_products_train op
  JOIN products p ON op.product_id = p.product_id
WHERE
  op.reordered = '1'
GROUP BY
  p.product_name
ORDER BY
  total_reordered DESC
LIMIT 10;


--3. What is the average time between orders for each user?
SELECT user_id, ROUND(AVG(days_since_prior_order)) AS avg_days_between_orders
FROM orders
GROUP BY user_id
ORDER BY avg_days_between_orders DESC;


--4. What is the distribution of orders by day of week and hour of day?
SELECT
  order_dow day_of_the_week,
  order_hour_of_day,
  COUNT(*) AS total_orders
FROM
  orders
GROUP BY
  order_dow,
  order_hour_of_day
ORDER BY total_orders desc;


SELECT DISTINCT(COUNT(user_id)) FROM orders

--5. What is the average basket size (number of items per order) for each department?
SELECT
  d.department,
  ROUND(AVG(op.add_to_cart_order)) AS avg_basket_size
FROM
  orders o
  JOIN order_products_train op ON o.order_id = op.order_id
  JOIN products p ON op.product_id = p.product_id
  JOIN department d ON p.department_id = d.department_id
GROUP BY
  d.department
ORDER BY avg_basket_size desc;


--6. What are the most popular products purchased by customers?

SELECT p.product_name, COUNT(*) as num_orders
FROM orders o
JOIN order_products_train opp ON o.order_id = opp.order_id
JOIN products p ON opp.product_id = p.product_id
GROUP BY p.product_name
ORDER BY num_orders DESC
LIMIT 10;


--7. How frequently do customers place orders on Instacart?
SELECT ROUND(AVG(days_since_prior_order)) as avg_days_since_order 
FROM orders;

--8. What is the average basket size (number of products per order) for Instacart customers?
SELECT ROUND(AVG(num_products)) as avg_basket_size 
FROM (SELECT order_id, COUNT(*) as num_products FROM order_products_train GROUP BY order_id) as baskets;


--9. What are the most common days of the week for orders to be placed?
SELECT order_dow, COUNT(*) as order_count
FROM orders
GROUP BY order_dow
ORDER BY order_count DESC;


--10. Retrieve the product names and their corresponding aisle names for products that have a unit price greater than the average unit price of all products in the database.
SELECT product_name, aisle, unit_price  
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
WHERE unit_price > (SELECT AVG(unit_price) FROM products);

--11. Retrieve the product name and unit price of the products with the highest unit price in each department.
SELECT department, product_name, unit_price
FROM products p
JOIN department d ON p.department_id = d.department_id
WHERE unit_price = (SELECT MAX(unit_price) FROM products WHERE department_id = p.department_id);

--12. Retrieve the user_id and total number of orders for users who have placed more than 10 orders.
SELECT user_id, COUNT(*) AS total_orders
FROM orders
WHERE user_id IN (SELECT user_id FROM orders GROUP BY user_id HAVING COUNT(*) > 10)
GROUP BY user_id;


--13. Write a query to retrieve the product name, aisle, and department name for all products with a unit price greater than the average unit price for all products.
SELECT p.product_name, a.aisle, d.department, p.unit_price
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
JOIN department d ON p.department_id = d.department_id
WHERE p.unit_price > (SELECT AVG(unit_price) FROM products);


--14. Write a query to retrieve the user IDs for all users who have placed at least one order with a product from aisle 1.
SELECT DISTINCT o.user_id
FROM orders o
WHERE EXISTS (SELECT 1 FROM products p WHERE p.aisle_id = 1 AND o.product_id = p.product_id);

--15. Write a query to retrieve the order IDs and order dates for all orders with a total quantity greater than the average total quantity for all orders.
SELECT o.order_id, o.order_date
FROM orders o
WHERE (SELECT SUM(quantity) FROM orders WHERE order_id = o.order_id) > (SELECT AVG(sum_qty) FROM (SELECT order_id, SUM(quantity) as sum_qty FROM orders GROUP BY order_id) as sq);


--16. Write a query to retrieve the product name and unit price for all products that are sold in at least one order with a product from the same aisle and department.
SELECT p.product_name, p.unit_price
FROM products p
WHERE EXISTS (
  SELECT 1 
  FROM orders o 
  JOIN products p2 ON o.product_id = p2.product_id 
  WHERE p2.aisle_id = p.aisle_id AND p2.department_id = p.department_id
  AND o.order_status = 'Delivered');

--17. Find all products that belong to a department with at least one product that costs more than $50:
SELECT *
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM products
    WHERE department_id = p.department_id
    AND unit_price = 45
);


--18. Return a list of users who have made at least 5 orders, along with the total number of orders they've made and the average number of days between orders.
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

--19. Create a CTE that shows the top 5 products by sales for the month of April 2023.
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


--20. What is the average number of days between orders for users who have made at least 10 orders?
WITH user_avg_days_between_orders AS (
  SELECT user_id, AVG(days_since_prior_order) AS avg_days_between_orders
  FROM orders
  GROUP BY user_id
  HAVING COUNT(*) >= 10
)
SELECT ROUND(AVG(avg_days_between_orders))::text || ' ' || 'days' AS overall_avg_days_between_orders
FROM user_avg_days_between_orders;

--21. What are the top 5 best-selling products in each department for the last month?
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







