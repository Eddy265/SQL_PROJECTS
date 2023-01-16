CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
	address VARCHAR (25) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
	food_type VARCHAR (255) NOT NULL,
	pizza_place VARCHAR(255) NOT NULL,
  order_date TIMESTAMP NOT NULL,
	restaurant_location VARCHAR (255)NOT NULL,
  total_amount NUMERIC(10,2) NOT NULL
);

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


INSERT INTO orders (customer_id, food_type, pizza_place, order_date, restaurant_location, total_amount) VALUES
(1, 'Pizza', 'Dominos', '2022-01-01 12:00:00', 'New York', 15.99),
(1, 'Pasta', 'Olive Garden', '2022-01-02 12:00:00', 'New York', 20.99),
(2, 'Burger', 'McDonalds', '2022-01-03 12:00:00', 'Chicago', 12.99),
(3, 'Sandwich', 'Subway', '2022-01-04 12:00:00', 'Los Angeles', 18.99),
(4, 'Wings', 'Buffalo Wild Wings', '2022-01-05 12:00:00', 'Dallas', 14.99)
(5, 'Sushi', 'Sakura', '2022-01-06 12:00:00', 'San Francisco', 25.99),
(6, 'Tacos', 'Taco Bell', '2022-01-07 12:00:00', 'Houston', 8.99),
(7, 'Steak', 'Outback Steakhouse', '2022-01-08 12:00:00', 'Philadelphia', 35.99),
(8, 'Seafood', 'Red Lobster', '2022-01-09 12:00:00', 'Seattle', 45.99),
(9, 'Indian', 'Taj Mahal', '2022-01-10 12:00:00', 'Boston', 20.99)
(10, 'Pizza', 'Dominos', '2022-01-11 12:00:00', 'New York', 15.99),
(11, 'Pizza', 'Pizza Hut', '2022-01-12 12:00:00', 'Los Angeles', 20.99),
(12, 'Pizza', 'Dominos', '2022-01-13 12:00:00', 'Chicago', 12.99),
(13, 'Pizza', 'Pizza Hut', '2022-01-14 12:00:00', 'Houston', 18.99),
(14, 'Pizza', 'Dominos', '2022-01-15 12:00:00', 'Bremen', 25.99)
(15, 'Pizza', 'Dominos', NOW() - INTERVAL '3 DAYS', 'New York', 15.99),
(16, 'Burger', 'McDonalds', NOW() - INTERVAL '2 DAYS', 'Los Angeles', 8.99),
(17, 'Sandwich', 'Subway', NOW() - INTERVAL '1 DAY', 'Chicago', 5.99),
(18, 'Tacos', 'Taco Bell', NOW(), 'Houston', 7.99),
(19, 'Seafood', 'Red Lobster', NOW() - INTERVAL '34 DAY', 'Chicago', 5.99),
(20, 'Sushi', 'Sakura', NOW() - INTERVAL '5 DAYS', 'San Francisco', 25.99),
(21, 'Steak', 'Outback Steakhouse', NOW() - INTERVAL '4 DAYS', 'Philadelphia', 35.99),
(22, 'Indian', 'Taj Mahal', NOW() - INTERVAL '3 DAYS', 'Boston', 20.99),
(23, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '2 DAYS', 'Dallas', 18.99),
(24, 'Pizza', 'Dominos', NOW() - INTERVAL '1 DAY', 'Houston', 14.99),
(25, 'Pizza', 'Dominos', NOW() - INTERVAL '9 DAYS', 'New York', 15.99),
(26, 'Burger', 'McDonalds', NOW() - INTERVAL '8 DAYS', 'Los Angeles', 8.99),
(27, 'Sandwich', 'Subway', NOW() - INTERVAL '7 DAYS', 'Chicago', 5.99),
(28, 'Tacos', 'Taco Bell', NOW() - INTERVAL '6 DAYS', 'Houston', 7.99),
(29, 'Seafood', 'Red Lobster', NOW() - INTERVAL '5 DAYS', 'Seattle', 25.99),
(30, 'Pizza', 'Dominos', NOW() - INTERVAL '9 DAYS', 'New York', 15.99),
(31, 'Burger', 'McDonalds', NOW() - INTERVAL '8 DAYS', 'Los Angeles', 8.99),
(32, 'Sandwich', 'Subway', NOW() - INTERVAL '7 DAYS', 'Chicago', 5.99),
(33, 'Tacos', 'Taco Bell', NOW() - INTERVAL '6 DAYS', 'Houston', 7.99),
(34, 'Seafood', 'Red Lobster', NOW() - INTERVAL '5 DAYS', 'Seattle', 25.99),
(35, 'Pizza', 'Dominos', NOW() - INTERVAL '9 DAYS', 'New York', 15.99),
(36, 'Burger', 'McDonalds', NOW() - INTERVAL '8 DAYS', 'Los Angeles', 8.99),
(37, 'Sandwich', 'Subway', NOW() - INTERVAL '7 DAYS', 'Chicago', 5.99),
(38, 'Tacos', 'Taco Bell', NOW() - INTERVAL '6 DAYS', 'Houston', 7.99),
(39, 'Seafood', 'Red Lobster', NOW() - INTERVAL '5 DAYS', 'Seattle', 25.99),
(40, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'New York', 15.99),
(41, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Los Angeles', 8.99),
(42, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Chicago', 5.99),
(43, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Houston', 7.99),
(44, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Seattle', 25.99),
(56, 20, 'Pizza', 'Dominos', NOW() - INTERVAL '13 DAYS', 'New York', 15.99),
(57, 21, 'Burger', 'McDonalds', NOW() - INTERVAL '12 DAYS', 'Los Angeles', 8.99),
(58, 22, 'Sandwich', 'Subway', NOW() - INTERVAL '11 DAYS', 'Chicago', 5.99),
(59, 23, 'Tacos', 'Taco Bell', NOW() - INTERVAL '10 DAYS', 'Houston', 7.99),
(60, 24, 'Seafood', 'Red Lobster', NOW() - INTERVAL '9 DAYS', 'Seattle', 25.99)
(61, 54, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'New York', 15.99),
(62, 50, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Los Angeles', 8.99),
(63, 53, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Chicago', 5.99),
(64, 49, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Houston', 7.99),
(65, 42, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Seattle', 25.99)
(66, 59, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'Paris', 15.99),
(67, 54, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Lyon', 8.99),
(68, 57, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Marseille', 5.99),
(69, 58, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Lille', 7.99),
(70, 55, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Bordeaux', 25.99),
(71, 64, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'Paris', 15.99),
(72, 63, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Lyon', 8.99),
(73, 62, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Marseille', 5.99),
(74, 62, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Lille', 7.99),
(75, 61, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Bordeaux', 25.99),
(76, 62, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'Paris', 15.99),
(77, 43, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Lyon', 8.99),
(78, 21, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Marseille', 5.99),
(79, 68, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Lille', 7.99),
(80, 62, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Bordeaux', 25.99),
(81, 64, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'Paris', 15.99),
(82, 7, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Lyon', 8.99),
(83, 7, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Marseille', 5.99),
(84, 48, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Lille', 7.99),
(85, 59, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Bordeaux', 25.99),
(86, 79, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'Paris', 15.99),
(87, 78, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Lyon', 8.99),
(88, 78, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Marseille', 5.99),
(89, 77, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Lille', 7.99),
(90, 76, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Bordeaux', 25.99),
(91, 84, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'Berlin', 15.99),
(92, 83, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Hamburg', 8.99),
(93, 82, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Munich', 5.99),
(94, 81, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Cologne', 7.99),
(95, 84, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Frankfurt', 44.5),
(96, 89, 'Pizza', 'Pizza Hut', NOW() - INTERVAL '11 DAYS', 'Berlin', 15.99),
(97, 88, 'Burger', 'McDonalds', NOW() - INTERVAL '10 DAYS', 'Hamburg', 8.99),
(98, 88, 'Sandwich', 'Subway', NOW() - INTERVAL '9 DAYS', 'Munich', 5.99),
(99, 84, 'Tacos', 'Taco Bell', NOW() - INTERVAL '8 DAYS', 'Cologne', 7.99),
(100, 87, 'Seafood', 'Red Lobster', NOW() - INTERVAL '7 DAYS', 'Bremen', 44.5);



SELECT * FROM customers ORDER BY customer_id DESC

select * from orders order by customer_id desc

select * from customers where name = 'Madison Anderson'

UPDATE customers SET name = 'Madukaogu Anderson' WHERE customer_id = 43

SELECT COUNT(DISTINCT(name)) from customers

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


--2. How many Customers ordered pizza from Dominos first before ordering from Pizza Hut
SELECT COUNT(DISTINCT customers.customer_id) as num_customers
FROM customers
JOIN orders as dominos_orders ON customers.customer_id = dominos_orders.customer_id
AND dominos_orders.pizza_place = 'Dominos'
WHERE NOT EXISTS (
    SELECT 1
    FROM orders as pizzahut_orders
    WHERE pizzahut_orders.customer_id = customers.customer_id
    AND pizzahut_orders.pizza_place = 'Pizza Hut'
    AND pizzahut_orders.order_date < dominos_orders.order_date
)

 
























































































