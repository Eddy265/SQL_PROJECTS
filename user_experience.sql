CREATE TABLE user_experience (
  id SERIAL PRIMARY KEY,
  catalog_id INTEGER NOT NULL,
  page_id INTEGER NOT NULL,
  clicks INTEGER NOT NULL,
  time_spent FLOAT NOT NULL,
  customer_feedback TEXT,
  FOREIGN KEY (catalog_id) REFERENCES catalog_info(catalog_id)
);

CREATE TABLE catalog_info (
  catalog_id INTEGER PRIMARY KEY,
  catalog_name VARCHAR(255) NOT NULL,
  publish_date DATE NOT NULL,
  total_products INTEGER NOT NULL,
  target_audience VARCHAR(255) NOT NULL,
  catalog_type VARCHAR(255) NOT NULL
);


INSERT INTO catalog_info (catalog_id, catalog_name, publish_date, total_products, target_audience, catalog_type)
VALUES
  (1, 'Summer Collection', '2022-06-01', 100, 'Women', 'Fashion'),
  (2, 'Men''s Grooming', '2022-05-01', 50, 'Men', 'Beauty'),
  (3, 'Home Decor', '2022-04-01', 150, 'Home Owners', 'Interior Design'),
  (4, 'Gadgets and Tech', '2022-03-01', 200, 'Tech Enthusiasts', 'Electronics'),
  (5, 'Outdoor Adventures', '2022-02-01', 75, 'Outdoor Enthusiasts', 'Sports and Outdoors'),
  (6, 'Winter Collection', '2021-12-01', 120, 'Women', 'Fashion'),
  (7, 'Holiday Gift Guide', '2021-11-01', 90, 'Everyone', 'Gifts'),
  (8, 'Kitchen Essentials', '2021-10-01', 175, 'Home Cooks', 'Kitchen'),
  (9, 'Beauty Must-Haves', '2021-09-01', 60, 'Women', 'Beauty'),
  (10, 'Car Accessories', '2021-08-01', 125, 'Car Owners', 'Automotive'),
  (11, 'Fitness and Wellness', '2021-07-01', 95, 'Fitness Enthusiasts', 'Sports and Outdoors'),
  (12, 'Pet Supplies', '2021-06-01', 50, 'Pet Owners', 'Pets'),
  (13, 'Summer Getaways', '2021-05-01', 80, 'Travelers', 'Travel'),
  (14, 'School Supplies', '2021-04-01', 70, 'Students and Parents', 'Education'),
  (15, 'Spring Cleaning', '2021-03-01', 150, 'Home Owners', 'Home Goods'),
  (16, 'Music and Entertainment', '2021-02-01', 100, 'Music and Movie Fans', 'Entertainment'),
  (17, 'Fashion Forward', '2021-01-01', 120, 'Women', 'Fashion'),
  (18, 'Healthy Living', '2020-12-01', 75, 'Health Enthusiasts', 'Health and Wellness'),
  (19, 'Office Supplies', '2020-11-01', 90, 'Office Workers', 'Office'),
  (20, 'Outdoor Living', '2020-10-01', 125, 'Outdoor Enthusiasts', 'Outdoor'),
  (21, 'Electronics', '2020-09-01', 200, 'Tech Enthusiasts', 'Electronics'),
  (22, 'Summer Fun', '2020-08-01', 95, 'Everyone', 'Summer'),
  (23, 'Travel Destinations', '2020-07-01', 120, 'Travelers', 'Travel'),
  (24, 'Beauty and Skincare', '2020-06-01', 60, 'Women', 'Beauty'),
  (25, 'Kids and Toys', '2020-06-01', 60, 'Women', 'Beauty'),
  (26, 'Home Decor Collection', '2022-05-06', 500, 'Home Owners', 'Furniture and Home Decor'),
  (27, 'Home Decor Collection', '2022-05-06', 500, 'Home Owners', 'Furniture and Home Decor'),
(28, 'Fashionista 2021', '2022-06-07', 1000, 'Fashion Enthusiasts', 'Fashion and Clothing'),
(29, 'Travel & Adventure', '2022-07-08', 800, 'Travelers', 'Travel Guides and Gear'),
(30, 'Pet Lovers Guide', '2022-08-09', 600, 'Pet Owners', 'Pet Care and Products'),
(31, 'Kids Fun & Games', '2022-09-10', 700, 'Parents and Kids', 'Toys and Games'),
(32, 'Health & Wellness', '2022-10-11', 800, 'Health Conscious', 'Health Products and Guides'),
(33, 'Food & Beverages', '2022-11-12', 500, 'Foodies', 'Food and Beverage Products'),
(34, 'Sports & Fitness', '2022-12-13', 600, 'Sports Enthusiasts', 'Sports and Fitness Products'),
(35, 'Electronics & Tech', '2023-01-14', 1000, 'Tech Savvy', 'Electronics and Technology'),
(36, 'Outdoor & Nature', '2023-02-15', 700, 'Outdoor Enthusiasts', 'Outdoor and Nature Products'),
(37, 'Beauty & Personal Care', '2023-03-16', 800, 'Beauty Conscious', 'Beauty and Personal Care Products'),
(38, 'Music & Entertainment', '2023-04-17', 700, 'Music and Entertainment Lovers', 'Music and Entertainment Products'),
(39, 'Art & Crafts', '2023-05-18', 500, 'Art and Craft Enthusiasts', 'Art and Craft Products'),
(40, 'Automotive & Transportation', '2023-06-19', 800, 'Auto Enthusiasts', 'Automotive and Transportation Products'),
(41, 'Finance & Business', '2023-07-20', 600, 'Business Professionals', 'Finance and Business Products'),
(42, 'Education & Learning', '2023-08-21', 700, 'Students and Educators', 'Education and Learning Products'),
(43, 'Gardening & Landscaping', '2023-09-22', 500, 'Gardeners and Landscapers', 'Gardening and Landscaping Products'),
(44, 'House & Home', '2023-10-23', 800, 'Home Owners', 'House and Home Products'),
(45, 'Pet Lovers Guide', '2023-11-24', 700, 'Pet Owners', 'Pet Care and Products'),
(46, 'Kids Fun & Games', '2023-12-25', 600, 'Parents and Kids', 'Toys and Games');
  

-- Inserting 20 rows of user experience data
INSERT INTO user_experience_data (catalog_id, page_id, clicks, time_spent, customer_feedback)
VALUES
  (1, 1, 10, 120, 'Easy to navigate and visually appealing'),
  (1, 2, 15, 180, 'Could use more product information on this page'),
  (1, 3, 20, 240, 'Really liked the interactive features'),
  (2, 1, 8, 90, 'Great user experience'),
  (2, 2, 12, 150, 'Product information could be more up-to-date'),
  (2, 3, 18, 210, 'Love the visual presentation of the products'),
  (3, 1, 9, 100, 'User-friendly interface'),
  (3, 2, 14, 170, 'Needs more product images'),
  (3, 3, 19, 220, 'Interactive features are a great touch'),
  (4, 1, 7, 80, 'Very easy to use'),
  (4, 2, 11, 140, 'Could use more product descriptions'),
  (4, 3, 16, 200, 'Visually appealing and well-designed'),
  (5, 1, 10, 120, 'Good user experience'),
  (5, 2, 15, 180, 'More product information needed'),
  (5, 3, 20, 240, 'Nicely presented and visually engaging'),
  (6, 1, 8, 90, 'Easy to navigate'),
  (6, 2, 12, 150, 'Needs more product images'),
  (6, 3, 18, 210, 'Interactive features are a plus'),
  (7, 1, 9, 100, 'Well-designed user interface');

  
  -- Inserting 20 more rows of user experience data
INSERT INTO user_experience_data (catalog_id, page_id, clicks, time_spent, customer_feedback)
VALUES
  (8, 1, 12, 130, 'Nice design and easy to use'),
  (8, 2, 18, 190, 'Could have more product information'),
  (8, 3, 24, 250, 'Interactive features add a lot of value'),
  (9, 1, 10, 110, 'Good user experience'),
  (9, 2, 15, 170, 'Could use more product images'),
  (9, 3, 20, 220, 'Visual presentation is appealing'),
  (10, 1, 8, 80, 'Ease of use is great'),
  (10, 2, 12, 140, 'More product descriptions would be helpful'),
  (10, 3, 16, 200, 'Visually appealing and well-designed'),
  (11, 1, 9, 100, 'User-friendly interface'),
  (11, 2, 14, 160, 'Product images could be better'),
  (11, 3, 19, 220, 'Interactive features add to the user experience'),
  (12, 1, 7, 70, 'Very easy to navigate'),
  (12, 2, 11, 120, 'More product information needed'),
  (12, 3, 16, 180, 'Visually engaging and nicely presented'),
  (13, 1, 8, 90, 'Good user experience'),
  (13, 2, 12, 150, 'More product images would be helpful'),
  (13, 3, 18, 210, 'Interactive features add value'),
  (14, 1, 10, 110, 'Nice design and easy to use');


-- Inserting 30 more rows of user experience data
INSERT INTO user_experience_data (catalog_id, page_id, clicks, time_spent, customer_feedback)
VALUES
  (15, 1, 11, 120, 'Good user experience'),
  (15, 2, 16, 180, 'More product descriptions would be helpful'),
  (15, 3, 21, 240, 'Visually appealing and easy to use'),
  (16, 1, 9, 100, 'Easy navigation'),
  (16, 2, 13, 160, 'Better product images would add value'),
  (16, 3, 17, 220, 'Interactive features are a plus'),
  (17, 1, 10, 110, 'Nice design and user-friendly'),
  (17, 2, 14, 170, 'More product information needed'),
  (17, 3, 18, 230, 'Visually engaging and nicely presented'),
  (18, 1, 8, 90, 'Good user experience'),
  (18, 2, 12, 150, 'More product images would be helpful'),
  (18, 3, 16, 210, 'Interactive features are a plus'),
  (19, 1, 9, 100, 'Easy to navigate'),
  (19, 2, 13, 160, 'Product descriptions could be better'),
  (19, 3, 17, 220, 'Visually appealing and well-designed'),
  (20, 1, 10, 110, 'Nice design and user-friendly'),
  (20, 2, 14, 170, 'More product information needed'),
  (20, 3, 18, 230, 'Interactive features add value'),
  (21, 1, 11, 120, 'Good user experience'),
  (21, 2, 16, 180, 'Product images could be better'),
  (21, 3, 21, 240, 'Visually engaging and nicely presented'),
  (22, 1, 9, 100, 'Easy navigation'),
  (22, 2, 13, 160, 'More product descriptions would be helpful'),
  (22, 3, 17, 220, 'Visually appealing and easy to use'),
  (23, 1, 10, 110, 'Nice design and user-friendly'),
  (23, 2, 14, 170, 'Product images could be better'),
  (23, 3, 18, 230, 'Interactive features are a plus'),
  (24, 1, 8, 90, 'Good user experience'),
  (24, 2, 12, 150, 'More product information needed'),
  (24, 3, 16, 210, 'Visually engaging and well-designed');

-- Inserting 30 more rows of user experience data
INSERT INTO user_experience_data (catalog_id, page_id, clicks, time_spent, customer_feedback)
VALUES
  (25, 1, 11, 120, 'Easy to use and navigate'),
  (25, 2, 16, 180, 'More product descriptions would be helpful'),
  (25, 3, 21, 240, 'Visually appealing and interactive'),
  (26, 1, 9, 100, 'Good user experience'),
  (26, 2, 13, 160, 'Better product images would add value'),
  (26, 3, 17, 220, 'Interactive features are a plus'),
  (27, 1, 10, 110, 'Nice design and user-friendly'),
  (27, 2, 14, 170, 'More product information needed'),
  (27, 3, 18, 230, 'Visually engaging and nicely presented'),
  (28, 1, 8, 90, 'Easy navigation'),
  (28, 2, 12, 150, 'More product images would be helpful'),
  (28, 3, 16, 210, 'Interactive features are a plus'),
  (29, 1, 9, 100, 'Nice design and user-friendly'),
  (29, 2, 13, 160, 'Product descriptions could be better'),
  (29, 3, 17, 220, 'Visually appealing and well-designed'),
  (30, 1, 10, 110, 'Good user experience'),
  (30, 2, 14, 170, 'Product images could be better'),
  (30, 3, 18, 230, 'Interactive features add value'),
  (31, 1, 11, 120, 'Easy to navigate'),
  (31, 2, 16, 180, 'Product descriptions could be better'),
  (31, 3, 21, 240, 'Visually engaging and nicely presented'),
  (32, 1, 9, 100, 'Nice design and user-friendly'),
  (32, 2, 13, 160, 'More product information needed'),
  (32, 3, 17, 220, 'Visually appealing and easy to use'),
  (33, 1, 10, 110, 'Good user experience'),
  (33, 2, 14, 170, 'More product images would be helpful'),
  (33, 3, 18, 230, 'Interactive features are a plus'),
  (34, 1, 8, 90, 'Easy navigation'),
  (34, 2, 12, 150, 'More product descriptions would be helpful'),
  (34, 3, 16, 210, 'Visually engaging and well-designed');

-- Inserting 30 more rows of user experience data
INSERT INTO user_experience_data (catalog_id, page_id, clicks, time_spent, customer_feedback)
VALUES
  (35, 1, 11, 120, 'Easy to use and navigate'),
  (35, 2, 16, 180, 'More product descriptions would be helpful'),
  (35, 3, 21, 240, 'Visually appealing and interactive'),
  (36, 1, 9, 100, 'Good user experience'),
  (36, 2, 13, 160, 'Better product images would add value'),
  (36, 3, 17, 220, 'Interactive features are a plus'),
  (37, 1, 10, 110, 'Nice design and user-friendly'),
  (37, 2, 14, 170, 'More product information needed'),
  (37, 3, 18, 230, 'Visually engaging and nicely presented'),
  (38, 1, 8, 90, 'Easy navigation'),
  (38, 2, 12, 150, 'More product images would be helpful'),
  (38, 3, 16, 210, 'Interactive features are a plus'),
  (39, 1, 9, 100, 'Nice design and user-friendly'),
  (39, 2, 13, 160, 'Product descriptions could be better'),
  (39, 3, 17, 220, 'Visually appealing and well-designed'),
  (40, 1, 10, 110, 'Good user experience'),
  (40, 2, 14, 170, 'Product images could be better'),
  (40, 3, 18, 230, 'Interactive features add value'),
  (41, 1, 11, 120, 'Easy to navigate'),
  (41, 2, 16, 180, 'Product descriptions could be better'),
  (41, 3, 21, 240, 'Visually engaging and nicely presented'),
  (42, 1, 9, 100, 'Nice design and user-friendly'),
  (42, 2, 13, 160, 'More product information needed'),
  (42, 3, 17, 220, 'Visually appealing and easy to use'),
  (43, 1, 10, 110, 'Good user experience'),
  (43, 2, 14, 170, 'More product images would be helpful'),
  (43, 3, 18, 230, 'Interactive features are a plus'),
  (44, 1, 8, 90, 'Easy navigation'),
  (44, 2, 12, 150, 'More product descriptions would be helpful'),
  (44, 3, 16, 210, 'Visually engaging and well-designed');
-- Inserting 50 more rows of user experience data
INSERT INTO user_experience_data (catalog_id, page_id, clicks, time_spent, customer_feedback)
VALUES
  (45, 1, 11, 120, 'Nice design and user-friendly'),
  (45, 2, 16, 180, 'Product images could be better'),
  (45, 3, 21, 240, 'Visually appealing and easy to use'),
  (46, 1, 9, 100, 'Good user experience'),
  (46, 2, 13, 160, 'More product descriptions would be helpful'),
  (46, 3, 17, 220, 'Interactive features are a plus'),
  (47, 1, 10, 110, 'Easy navigation'),
  (47, 2, 14, 170, 'More product information needed'),
  (47, 3, 18, 230, 'Visually engaging and nicely presented'),
  (48, 1, 8, 90, 'Nice design and user-friendly'),
  (48, 2, 12, 150, 'More product images would be helpful'),
  (48, 3, 16, 210, 'Interactive features add value'),
  (49, 1, 9, 100, 'Good user experience'),
  (49, 2, 13, 160, 'Product descriptions could be better'),
  (49, 3, 17, 220, 'Visually appealing and well-designed'),
  (50, 1, 10, 110, 'Easy to navigate'),
  (50, 2, 14, 170, 'Product images could be better'),
  (50, 3, 18, 230, 'Interactive features are a plus'),
  (51, 1, 11, 120, 'Nice design and user-friendly'),
  (51, 2, 16, 180, 'More product descriptions would be helpful'),
  (51, 3, 21, 240, 'Visually engaging and nicely presented'),
  (52, 1, 9, 100, 'Good user experience'),
  (52, 2, 13, 160, 'More product information needed'),
  (52, 3, 17, 220, 'Visually appealing and easy to use'),
  (53, 1, 10, 110, 'Easy navigation'),
  (53, 2, 14, 170, 'More product images would be helpful'),
  (53, 3, 18, 230, 'Interactive features are a plus'),
  (54, 1, 8, 90, 'Nice design and user-friendly'),
  (54, 2, 12, 150, 'Product descriptions could be better'),
  (54, 3, 16, 210, 'Visually appealing and well-designed'),
  (55, 1, 9, 100, 'Good user experience'),
  (55, 2, 13, 160, 'More product images would be helpful'),
  (55, 3, 17, 220, 'Interactive features add value'),
  (56, 1, 10, 110, 'Easy to navigate'),
  (56, 2, 14, 170, 'Product descriptions could be better'),
  (56, 3, 18, 230, 'Visually engaging and nicely presented'),
  (57, 1, 11, 120, 'Nice design and user-friendly'),
  (57, 2, 16, 180, 'Product images could be better');
  
  
SELECT * FROM catalog_info c
right JOIN user_experience u on c.catalog_id = c.catalog_id
 
  
-- 1. What is the average number of clicks per catalog?
SELECT catalog_info.catalog_id, catalog_info.catalog_name, 
FLOOR (AVG(user_experience.clicks)) avg_number_clicks
FROM user_experience
JOIN catalog_info ON user_experience.catalog_id = catalog_info.catalog_id
GROUP BY catalog_info.catalog_id
ORDER BY avg_number_clicks desc;


-- 2. What is the catalog with the highest average time spent per user?
SELECT catalog_info.catalog_name, AVG(user_experience.time_spent) avg_time_spent
FROM user_experience
JOIN catalog_info ON user_experience.catalog_id = catalog_info.catalog_id
GROUP BY catalog_info.catalog_id
ORDER BY AVG(user_experience.time_spent) DESC
LIMIT 1;


--3. How many users have provided feedback for each catalog?
SELECT catalog_id, COUNT(customer_feedback)
FROM user_experience
WHERE customer_feedback IS NOT NULL
GROUP BY catalog_id;


--4. What is the percentage of users who have provided feedback for each catalog?  
WITH total_users AS (
  SELECT catalog_id, COUNT(*)
  FROM user_experience
  GROUP BY catalog_id),
feedback_users AS (
  SELECT catalog_id, COUNT(*)
  FROM user_experience
  WHERE customer_feedback IS NOT NULL
  GROUP BY catalog_id)
SELECT feedback_users.catalog_id, ROUND((feedback_users.count * 100.0 / total_users.count), 0) AS feedback_percentage 
FROM total_users
JOIN feedback_users ON total_users.catalog_id = feedback_users.catalog_id;

--5. What is the most common customer feedback?
SELECT customer_feedback, COUNT(*)
FROM user_experience
WHERE customer_feedback IS NOT NULL
GROUP BY customer_feedback
ORDER BY COUNT(*) DESC;

--6. Which catalog has the most clicks?
SELECT c.catalog_name, u.catalog_id, SUM(clicks) AS total_clicks
FROM user_experience u
JOIN catalog_info c ON u.catalog_id = c.catalog_id
GROUP BY c.catalog_name,u.catalog_id
ORDER BY total_clicks DESC
LIMIT 1;

--7. What is the average time spent per click?
SELECT AVG(time_spent / clicks)
FROM user_experience;

--8. Which pages within each catalog receive the most clicks?
SELECT c.catalog_name, u.catalog_id, u.page_id, SUM(clicks) AS total_clicks
FROM user_experience u
JOIN catalog_info c ON u.catalog_id = c.catalog_id
GROUP BY u.catalog_id, c.catalog_name, u.page_id, c.catalog_name
ORDER BY total_clicks DESC;


select * from catalog_info

--9. Consolidate catalog names based on target audience for better market segmentation analysis

SELECT 
  target_audience, 
  string_agg(catalog_name, ', ') as concatenated_catalogs
FROM 
  catalog_info
GROUP BY 
  target_audience;
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
