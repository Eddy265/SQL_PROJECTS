CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
	address VARCHAR (25) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE restaurants (
  restaurant_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address_line1 VARCHAR(100) NOT NULL,
  address_line2 VARCHAR(100),
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code INT NOT NULL
);

CREATE TABLE menu_items (
  item_id SERIAL PRIMARY KEY,
  restaurant_id INTEGER REFERENCES restaurants(restaurant_id),
  item_name VARCHAR(255) NOT NULL,
  description TEXT,
  price NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  restaurant_id INTEGER REFERENCES restaurants(restaurant_id),
  order_date TIMESTAMP NOT NULL,
  total_amount NUMERIC(10,2) NOT NULL
);


CREATE TABLE order_items (
  item_id INTEGER REFERENCES menu_items(item_id),
  order_id INTEGER REFERENCES orders(order_id),
  quantity INTEGER NOT NULL);

SELECT* from orders

--INSERT INTO TABLES
INSERT INTO customers (name, address, email) VALUES
('John Smith', '123 Main St', 'johnsmith@gmail.com'),
('Jane Doe', '456 Park Ave', 'janedoe@gmail.com'),
('Bob Johnson', '789 Elm St', 'bobjohnson@gmail.com'),
('Amy Williams', '1011 Oak St', 'amywilliams@gmail.com'),
('Mike Thompson', '333 Maple St', 'mikethompson@gmail.com'),
('Sarah Johnson', '444 Pine St', 'sarahjohnson@gmail.com'),
('Chris Brown', '555 Cedar St', 'chrisbrown@gmail.com'),
('Emily Davis', '666 Birch St', 'emilydavis@gmail.com'),
('Edwin Smith', '19 Main St', 'edwinmith@gmail.com');
('Alex Rodriguez', '777 Elm St', 'alexrodriguez@gmail.com'),
('Rachel Green', '888 Oak St', 'rachelgreen@gmail.com'),
('David Brown', '999 Cedar St', 'davidbrown@gmail.com'),
('Karen Wilson', '1111 Birch St', 'karenwilson@gmail.com'),
('Jennifer Wilson', '1111 Birch St', 'jenwilson@gmail.com'),
('Tom Smith', '1234 Main St', 'tomsmith@gmail.com'),
('Jessica Johnson', '2345 Park Ave', 'jessicajohnson@gmail.com'),
('Jacob Wilson', '3456 Elm St', 'jacobwilson@gmail.com'),
('Emily Anderson', '4567 Oak St', 'emilyanderson@gmail.com'),
('Tani Anderson', '4007 Oak St', 'Tanianderson@gmail.com'),
('Lucas Smith', '1234 Elm St', 'lucassmith@gmail.com'),
('Mia Johnson', '2345 Oak St', 'miajohnson@gmail.com'),
('Olivia Wilson', '3456 Birch St', 'oliviawilson@gmail.com'),
('Ava Anderson', '4567 Maple St', 'avaanderson@gmail.com'),
('Ifeanyi Johnson', '2345 Oak St', 'Ifyhnson@gmail.com'),
('Ethan Smith', '1234 Pine St', 'ethansmith@gmail.com'),
('Isabella Johnson', '2345 Cedar St', 'isabellajohnson@gmail.com'),
('Sophia Wilson', '3456 Elm St', 'sophiawilson@gmail.com'),
('Mason Anderson', '4567 Oak St', 'masonanderson@gmail.com'),
('Ifeanyi Johnson', '2345 Oak St', 'Ifyhnson@gmail.com'),
('Ifeanyi Johnson', '2345 Oak St', 'Ifyhnson@gmail.com'),
('Okechukwu Smith', '4334 Pine St', 'ethansmith@gmail.com'),
('Isabella Johnson', '4345 Cedar St', 'isabellajohnson@gmail.com'),
('Sophia Okafor', '3453 Elm St', 'sophiawilson@gmail.com'),
('Godson Anderson', '4561 Oak St', 'masonanderson@gmail.com'),
('Tochukwu Johnson', '2325 Oak St', 'Tohnson@gmail.com'),
('Edwin Uzoefuna', '1634 Cedar St', 'edwinuzo@gmail.com'),
('Jacob Smith', '1244 Cedar St', 'jacobsmith@gmail.com'),
('Emily Johnson', '2345 Elm St', 'emilyjohnson@gmail.com'),
('Michael Wilson', '3456 Oak St', 'michaelwilson@gmail.com'),
('Madison Anderson', '4567 Pine St', 'madisonanderson@gmail.com'),
('Nicholas Smith', '1234 Maple St', 'nicholassmith@gmail.com'),
('Alyssa Johnson', '2345 Pine St', 'alyssajohnson@gmail.com'),
('William Wilson', '3456 Cedar St', 'williamwilson@gmail.com'),
('Hannah Anderson', '4567 Birch St', 'hannahanderson@gmail.com'),
('Sandra Okorie', '4567 Birch St', 'sandra@gmail.com'),
('Jacob Smith', '1234 Cedar St', 'jacobsmith@gmail.com'),
('Emily Johnson', '2345 Elm St', 'emilyjohnson@gmail.com'),
('Michael Wilson', '3456 Oak St', 'michaelwilson@gmail.com'),
('Madison Anderson', '4567 Pine St', 'madisonanderson@gmail.com'),
('Moyosola Tayo', '4247 Pine St', 'moyo@gmail.com'),
('Emilie Dupont', '1234 Cedar St', 'emiliedupont@gmail.com'),
('Marc Dubois', '2345 Elm St', 'marcdubois@gmail.com'),
('Sophie Martin', '3456 Oak St', 'sophiemartin@gmail.com'),
('Victor Hernandez', '4567 Pine St', 'victorhernandez@gmail.com'),
('Ikechukwu Hernandez', '4567 Pine St', 'hernandez@gmail.com'),
('Julie Moreau', '1234 Cedar St', 'juliemoreau@gmail.com'),
('Thomas Leroy', '2345 Elm St', 'thomasleroy@gmail.com'),
('Nathalie Durand', '3456 Oak St', 'nathaliedurand@gmail.com'),
('Pauline Rousseau', '4567 Pine St', 'paulinerousseau@gmail.com'),
('Frank Odaise', '4567 Pine St', 'Frank@gmail.com'),
('Lucie Bernard', '1234 Cedar St', 'luciebernard@gmail.com'),
('Maxime Nguyen', '2345 Elm St', 'maximenguyen@gmail.com'),
('Amelie Girard', '3456 Oak St', 'ameliegirard@gmail.com'),
('Benjamin Dufour', '4567 Pine St', 'benjamindufour@gmail.com'),
('Leo Messi', '4567 Argentina St', 'messi@gmail.com'),
('Antoine Garcia', '1234 Cedar St', 'antoinegarcia@gmail.com'),
('Emma Rodriguez', '2345 Elm St', 'emmarodriguez@gmail.com'),
('Julien Martinez', '3456 Oak St', 'julienmartinez@gmail.com'),
('Manon David', '4567 Pine St', 'manondavid@gmail.com'),
('Okafor Chinyere', '4567 Pine St', 'okafor@gmail.com'),
('Ikechuckwu Ozoeze', '4634 London St', 'Ike@gmail.com'),
('Jay Smother', '2849 London St', 'jay@gmail.com'),
('Bobby John', '3456 London St', 'bobjohnson@gmail.com'),
('Santa Bragentin', '4567 London St', 'Santa@gmail.com'),
('Queen Bragentin', '4567 London St', 'Queen@gmail.com'),
('Max Mustermann', 'Musterstraße 1', 'maxmustermann@gmail.com'),
('Anna Bauer', 'Bauergasse 2', 'annabauer@gmail.com'),
('Julia Schmidt', 'Schmidtsplatz 3', 'juliascmidt@gmail.com'),
('Lukas Meier', 'Meierweg 4', 'lukasmeier@gmail.com'),
('Henry Meka', 'Meierweg 67', 'meka@gmail.com'),
('Elizabeth Mustse', 'Musterstrasse 65', 'must@gmail.com'),
('Bauer Getezs', 'Bremenstrasse 43', 'bauer@gmail.com'),
('Schmidt Mako', 'Unibremen strasse 54', 'scmidt@gmail.com'),
('Lukas Martins', 'Meierweg 42', 'lukas@gmail.com'),
('Henry Thomas', 'Meierweg 42', 'Henry@gmail.com'),

-------
--RESTAURANTS
INSERT INTO restaurants (name, address_line1, address_line2, city, state, zip_code) VALUES
('Italiano Pizza', '123 Main St', NULL, 'New York City', 'New York', 10001),
('Breakfast Cafe', '456 Elm St', NULL, 'Boston', 'Massachusetts', 02110),
('Sushi House', '789 Oak Ave', NULL, 'Los Angeles', 'California', 90001),
('Taco Hut', '101 First St', NULL, 'San Antonio', 'Texas', 78205),
('Burger Joint', '2468 Mill Rd', NULL, 'Philadelphia', 'Pennsylvania', 19103),
('Thai Kitchen', '135 Seventh St', NULL, 'Seattle', 'Washington', 98101),
('The Steakhouse', '369 Second Ave', NULL, 'Chicago', 'Illinois', 60601),
('Mexican Grill', '802 Third St', NULL, 'Dallas', 'Texas', 75201),
('Indian Palace', '989 Fourth St', NULL, 'Houston', 'Texas', 77002),
('Chinese Garden', '147 Fifth St', NULL, 'San Francisco', 'California', 94102),
('Pizza Hut', '753 Hill St', NULL, 'Detroit', 'Michigan', 48201),
('Greek Taverna', '246 Fourth Ave', NULL, 'Miami', 'Florida', 33101),
('French Bistro', '578 Ninth St', NULL, 'St. Louis', 'Missouri', 63101),
('Peruvian Cuisine', '963 King St', NULL, 'Atlanta', 'Georgia', 30303),
('Japanese Fusion', '852 Queens Blvd', NULL, 'Charlotte', 'North Carolina', 28202),
('Brazilian Barbecue', '1590 Park Ave', NULL, 'Denver', 'Colorado', 80201),
('Vietnamese Pho', '446 Sixth St', NULL, 'Minneapolis', 'Minnesota', 55401),
('Korean BBQ', '890 Church St', NULL, 'Phoenix', 'Arizona', 85001),
('Mediterranean Deli', '114 Fifth Ave', NULL, 'Portland', 'Oregon', 97201),
('Bagel and Lox', '1002 Tenth Ave', NULL, 'Boston', 'Massachusetts', 02114);


------
--INSERT INTO MENU_ITEMS
INSERT INTO menu_items (restaurant_id, item_name, description, price) VALUES 
(1, 'Grilled Salmon', 'Fresh Atlantic salmon, seasoned and grilled to perfection. Served with a side salad and baked potato.', 15.99),
(1, 'BBQ Ribs', 'Fall-off-the-bone baby back ribs, basted in our signature BBQ sauce. Served with coleslaw and french fries.', 18.99),
(2, 'Margherita Pizza', 'Fresh tomato sauce, mozzarella cheese, and basil on a thin crust. Our most popular pizza!', 12.99),
(2, 'Meat Lover Pizza', 'Pepperoni, sausage, bacon, and ham piled high on a thick crust. This one is for the meat lovers!', 16.99),
(3, 'Bruschetta', 'Toasted baguette slices topped with diced tomatoes, fresh basil, and garlic. Drizzled with balsamic glaze.', 7.99),
(3, 'Chicken Alfredo', 'Fettuccine pasta smothered in a creamy alfredo sauce and topped with grilled chicken. Served with garlic bread.', 14.99),
(4, 'Jerk Chicken', 'Tender chicken marinated in our secret jerk seasoning, grilled to perfection, and served with your choice of side and plantains.', 16.99),
(4, 'Oxtail', 'Slow-cooked oxtail in a rich brown gravy, served with rice and peas and steamed vegetables.', 19.99),
(5, 'Shrimp Tacos', 'Grilled shrimp, avocado, cilantro, and lime crema on a soft corn tortilla. Comes with rice and beans.', 13.99),
(5, 'Carnitas Burrito', 'Slow-cooked pork, black beans, rice, and cheese wrapped in a flour tortilla. Smothered in enchilada sauce and topped with sour cream.', 11.99),
(6, 'Pad Thai', 'Thick noodles stir-fried with bean sprouts, egg, and peanuts in a sweet and savory sauce. Your choice of chicken, beef, or tofu.', 12.99),
(6, 'Green Curry', 'Thai-style curry in coconut milk with bamboo shoots, peppers, and your choice of meat or tofu. Served with rice.', 14.99),
(7, 'Philly Cheesesteak', 'Thinly sliced ribeye steak cooked with onions and peppers, topped with melted provolone cheese on a hoagie roll. Served with french fries.', 9.99),
(7, 'Chicken Parmesan', 'Breaded chicken breast, marinara sauce, and melted mozzarella cheese on a bed of spaghetti. Served with garlic bread.', 12.99),
(8, 'Fish and Chips', 'Battered cod fillet served with french fries, tartar sauce, and mushy peas.', 14.99),
(8, 'Shepherd Pie', 'Ground lamb, mixed vegetables, and gravy topped with mashed potatoes and cheddar cheese. Served with a side salad.', 12.99),
(9, 'Miso Soup', 'Traditional Japanese soup with tofu, seaweed, and scallions.', 3.99),
(9, 'Spicy Tuna Roll', 'Sushi roll with tuna, spicy mayo sauce, and green onions. Comes with ginger and wasabi.', 7.99),
(10, 'Pancakes', 'Fluffy pancakes served with butter and syrup. Your choice of plain, blueberry, or chocolate chip.', 5.99),
(10, 'French Toast', 'Thick slices of bread dipped in a rich egg batter and grilled to perfection. Served with bacon or sausage.', 6.99);

----
--INSERT INTO ORDERS
INSERT INTO orders (customer_id, restaurant_id, order_date, total_amount) VALUES 
(1, 1, current_timestamp, 25.50), 
(2, 2, current_timestamp, 10.99), 
(3, 1, current_timestamp, 45.00), 
(4, 3, current_timestamp, 60.00), 
(5, 2, current_timestamp, 15.67),
(6, 1, current_timestamp, 23.40),
(7, 3, current_timestamp, 12.30),
(8, 2, current_timestamp, 34.56),
(9, 1, current_timestamp, 19.99),
(10, 3, current_timestamp, 54.30),
(11, 2, current_timestamp, 14.99),
(12, 1, current_timestamp, 27.50),
(13, 3, current_timestamp, 51.00),
(14, 1, current_timestamp, 35.55),
(15, 2, current_timestamp, 17.77),
(16, 3, current_timestamp, 40.20),
(17, 1, current_timestamp, 30.00),
(18, 2, current_timestamp, 22.50),
(19, 3, current_timestamp, 16.80),
(20, 1, current_timestamp, 42.00),
(21, 2, current_timestamp, 18.90),
(22, 3, current_timestamp, 23.00),
(23, 1, current_timestamp, 32.75),
(24, 2, current_timestamp, 27.50),
(25, 3, current_timestamp, 38.99),
(26, 1, current_timestamp, 12.50),
(27, 2, current_timestamp, 21.30),
(28, 3, current_timestamp, 44.00),
(29, 1, current_timestamp, 67.99),
(30, 2, current_timestamp - INTERVAL '3 DAYS', 13.45),
(1, 2, '2022-06-01 12:30:00', 25.98),
(2, 3, '2022-06-02 14:05:23', 15.50),
(3, 1, '2022-06-03 17:10:51', 42.35),
(2, 2, '2022-06-08 19:45:30', 19.20),
(3, 3, '2022-06-09 21:15:00', 32.80),
(4, 1, '2022-06-12 16:55:13', 27.95),
(5, 2, '2022-06-15 18:30:00', 10.00),
(6, 3, '2022-06-20 10:15:00', 17.25),
(7, 1, '2022-06-22 13:00:57', 24.80),
(8, 2, '2022-06-25 11:45:00', 21.45),
(9, 3, '2022-06-29 14:30:00', 15.75),
(4, 1, '2022-07-02 17:20:00', 29.40),
(5, 2, '2022-07-05 21:00:00', 13.75),
(6, 3, '2022-07-07 18:10:45', 28.65),
(7, 1, '2022-07-10 15:45:00', 16.95),
(8, 2, '2022-07-13 12:30:00', 20.80),
(9, 3, '2022-07-16 19:00:00', 37.25),
(1, 1, '2022-07-20 21:15:00', 18.90),
(2, 2, '2022-07-22 10:45:38', 25.70),
(3, 3, '2022-07-26 13:25:00', 12.50),
(4, 1, '2022-07-30 17:00:00', 23.90),
(5, 2, '2022-08-03 18:35:00', 19.15),
(6, 3, '2022-08-07 20:15:00', 33.20),
(7, 1, '2022-08-11 11:40:00', 27.40),
(8, 2, '2022-08-14 19:25:00', 14.85),
(9, 3, '2022-08-18 14:00:16', 21.90),
(1, 1, '2022-08-22 16:00:00', 12.75),
(2, 2, '2022-08-25 21:15:00', 23.45),
(3, 3, '2022-08-30 13:40:00', 18.75),
(83, 4, '2023-01-02 12:30:00', 35.50),
(74, 1, '2023-01-05 18:45:00', 25.75),
(89, 2, '2023-01-10 13:15:00', 42.00),
(67, 3, '2023-01-17 19:00:00', 29.90),
(21, 5, '2023-01-22 21:30:00', 47.80),
(78, 1, '2023-01-24 12:00:00', 22.85),
(45, 6, '2023-02-04 16:15:00', 38.20),
(87, 2, '2023-02-06 18:30:00', 29.95),
(81, 4, '2023-02-11 14:45:00', 54.40),
(43, 3, '2023-02-15 20:00:00', 19.70),
(40, 1, '2023-02-20 22:30:00', 27.50),
(54, 5, '2023-02-23 11:45:00', 16.00),
(45, 4, '2023-02-26 20:15:00', 31.00),
(89, 6, '2023-02-28 17:30:00', 41.80),
(32, 1, '2023-02-28 12:00:00', 18.45),
(76, 3, '2023-02-28 19:45:00', 27.60),
(59, 2, '2023-02-28 21:00:00', 23.75),
(53, 5, '2023-02-28 13:15:00', 46.55),
(12, 6, '2023-02-28 18:30:00', 33.90),
(67, 4, '2023-02-28 20:00:00', 29.20);

--INSERT INTO ORDER_ITEMS
INSERT INTO order_items (item_id, order_id, quantity)
VALUES 
(1, 1, 2),
(2, 1, 1),
(3, 1, 3),
(1, 2, 1),
(4, 2, 2),
(5, 2, 1),
(6, 2, 1),
(1, 3, 2),
(2, 3, 1),
(7, 3, 2),
(8, 3, 1),
(1, 4, 3),
(3, 4, 2),
(9, 4, 1),
(2, 5, 1),
(4, 5, 3),
(6, 5, 2),
(10, 5, 2),
(4, 6, 1),
(8, 6, 2),
(9, 6, 1),
(11, 6, 1),
(12, 6, 1),
(13, 6, 1),
(11, 6, 1),
(12, 6, 2),
(1, 7, 1),
(7, 7, 1),
(8, 7, 3),
(9, 8, 2),
(2, 8, 1),
(1, 8, 1),
(2, 8, 2),
(3, 9, 2),
(6, 9, 1),
(11, 9, 3),
(4, 10, 1),
(5, 10, 2),
(6, 10, 2),
(7, 11, 1),
(5, 11, 1),
(1, 11, 2),
(7, 12, 1),
(8, 12, 1),
(4, 12, 2),
(9, 13, 2),
(3, 13, 1);



SELECT * from menu_items


SELECT * FROM customers ORDER BY customer_id DESC

select * from orders 

select * from customers where name = 'Madison Anderson'

SELECT* from order_items

SELECT* from menu_items


SELECT COUNT(DISTINCT(customer_id)) from customers

select count(*) from customers



/*Questions
1. How many customers live on "Elm St" and "Pine St"?*/
SELECT 'Pine St' as address, COUNT(*) as customer_count
FROM customers
WHERE address LIKE '%Pine St%'
UNION
SELECT 'Elm St' as address, COUNT(*) as customer_count
FROM customers
WHERE address LIKE '%Elm St%';


--2. What are the popular menu items for each restaurant?
SELECT mi.item_name, r.name restaurant, COUNT(*) as order_count 
FROM order_items oi 
JOIN menu_items mi ON oi.item_id = mi.item_id 
JOIN orders o ON oi.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY mi.item_name, r.name
ORDER BY order_count DESC;

--3. Which customer has placed the most number of orders and how many orders did they place?
SELECT c.name, COUNT(*) as order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY order_count DESC
LIMIT 1;

--4. Which restaurant has made the most sales and how much sales have they made?
SELECT r.name restaurant, SUM(oi.quantity*mi.price) as total_sales
FROM order_items oi 
JOIN menu_items mi ON oi.item_id = mi.item_id 
JOIN orders o ON oi.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.name
ORDER BY total_sales DESC
LIMIT 1;

--5 Which restaurant has the highest revenue per order on average?
SELECT r.name, COUNT(DISTINCT o.order_id) as order_count, SUM(oi.quantity*mi.price) as total_revenue, ROUND(AVG(oi.quantity*mi.price), 2) as avg_revenue
FROM order_items oi 
JOIN menu_items mi ON oi.item_id = mi.item_id 
JOIN orders o ON oi.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.name
ORDER BY avg_revenue DESC;

--6 How many orders were placed in a specific time period?
SELECT COUNT(*) as order_count
FROM orders
WHERE order_date BETWEEN '2022-06-01' AND '2022-09-01';

--7 What is the total revenue generated by a specific restaurant?
SELECT SUM(oi.quantity*mi.price) as total_revenue
FROM order_items oi 
JOIN menu_items mi ON oi.item_id = mi.item_id 
JOIN orders o ON oi.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE r.name = 'Italiano Pizza';

--8 What is the most popular menu item ordered from each restaurant?
WITH cte AS (
  SELECT 
    r.name, m.item_name, 
    ROW_NUMBER() OVER (PARTITION BY r.restaurant_id ORDER BY sum(oi.quantity) DESC) AS row_num
       FROM restaurants r 
       INNER JOIN orders o ON r.restaurant_id = o.restaurant_id 
       INNER JOIN order_items oi ON o.order_id = oi.order_id 
       INNER JOIN menu_items m ON oi.item_id = m.item_id 
  GROUP BY r.restaurant_id, m.item_id
)
SELECT name restaurant, item_name
FROM cte 
WHERE row_num = 1;

--9 How much revenue have we generated in the past week?
SELECT SUM(total_amount) AS revenue 
FROM orders 
WHERE DATE(order_date) >= NOW() - INTERVAL '7 day';

--10 What are the top 5 customers who have spent the most with us?
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c 
INNER JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.name 
ORDER BY total_spent DESC 
LIMIT 5;

--11 What is total revenue generated by each restaurant in the last month?
SELECT name restaurant_name, SUM(total_amount) AS total_revenue
FROM orders 
JOIN restaurants USING (restaurant_id)
WHERE order_date >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1' MONTH) AND order_date < DATE_TRUNC('month', CURRENT_DATE) 
GROUP BY restaurants.name, restaurant_id
ORDER BY total_revenue desc;

--12 Who are the top 10 customers who ordered the most items?
SELECT name customer_name, COUNT(*) AS total_ordered
FROM order_items 
JOIN orders USING (order_id)
JOIN customers USING (customer_id)
GROUP BY customers.name, customer_id 
ORDER BY total_ordered DESC 
LIMIT 10;

--13 Which restaurants have not received any orders in the last week?
SELECT 
    restaurant_id, name restaurant, address_line1
FROM 
    restaurants r
    LEFT JOIN orders USING (restaurant_id)
WHERE 
    order_date >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY 
    restaurant_id, name, address_line1, state, city, zip_code, address_line2
HAVING 
    COUNT(order_id) = 0;

--14 What is the average amount spent per order at each restaurant?
SELECT name restaurant, ROUND(AVG(total_amount), 2) AS avg_order_total
FROM orders 
JOIN restaurants USING (restaurant_id)
GROUP BY restaurants.name, restaurant_id
ORDER BY avg_order_total desc;

--15 Which menu items are most popular among customers?
SELECT mi.item_name, COUNT(oi.quantity) AS times_ordered 
FROM order_items oi
JOIN menu_items mi ON oi.item_id = mi.item_id
GROUP BY mi.item_name
ORDER BY times_ordered DESC
LIMIT 5;

--16 How many orders were placed by each customer this year?
SELECT c.name, COUNT(o.order_id) AS number_of_orders 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date >= '2023-01-01'
GROUP BY c.name
ORDER BY number_of_orders desc;

--17 What is the total revenue earned by each restaurant for a given time period?
SELECT r.name, SUM(o.total_amount) AS revenue
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.order_date BETWEEN '2022-07-21' AND '2023-01-21'
GROUP BY r.name;




SELECT * FROM menu_items

SELECT DISTINCT(name) from RESTAURANTS












































































































































