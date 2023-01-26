

CREATE TABLE website_traffic (
id INT,
date DATE PRIMARY KEY NOT NULL,
page_views INT NOT NULL,
unique_visitors INT NOT NULL,
bounce_rate FLOAT NOT NULL,
time_on_site FLOAT NOT NULL
);


CREATE TABLE engagement_metrics (
id INT PRIMARY KEY NOT NULL,
date DATE NOT NULL,
comments INT NOT NULL,
shares INT NOT NULL,
likes INT NOT NULL,
dislikes INT NOT NULL,
FOREIGN KEY (date) REFERENCES website_traffic(date)
);

INSERT INTO website_traffic (id, date, page_views, unique_visitors, bounce_rate, time_on_site)
VALUES (1, '2022-01-01', 1000, 800, 0.2, 5),
(2, '2022-01-02', 1200, 900, 0.15, 7),
(3, '2022-01-03', 800, 600, 0.25, 4),
(4, '2022-01-04', 900, 700, 0.3, 6),
(5, '2022-01-05', 1100, 900, 0.1, 8),
(6, '2022-01-06', 1300, 1000, 0.05, 10),
(7, '2022-01-07', 1000, 800, 0.2, 5),
(8, '2022-01-08', 1200, 900, 0.15, 7),
(9, '2022-01-09', 800, 600, 0.25, 4),
(10, '2022-01-10', 900, 700, 0.3, 6),
(11, '2022-01-11', 1100, 900, 0.1, 8),
(12, '2022-01-12', 1300, 1000, 0.05, 10),
(13, '2022-01-13', 1000, 800, 0.2, 5),
(14, '2022-01-14', 1200, 900, 0.15, 7),
(15, '2022-01-15', 800, 600, 0.25, 4),
(16, '2022-01-16', 900, 700, 0.3, 6),
(17, '2022-01-17', 1100, 900, 0.1, 8),
(18, '2022-01-18', 1300, 1000, 0.05, 10),
(19, '2022-01-19', 1000, 800, 0.2, 5),
(20, '2022-01-20', 1200, 900, 0.15, 7);
(21, '2022-01-21', 1122 80, 0.2, 2.5),
(22, '2022-01-22', 1111 90, 0.15, 2.8),
(23, '2022-01-23', 1112 95, 0.1, 3.0),
(24, '2022-01-24', 1421 100, 0.05, 3.2),
(25, '2022-01-25', 1512 110, 0.02, 3.5),
(26, '2022-01-26', 110 115, 0.01, 3.7),
(27, '2022-01-27', 1722 120, 0.03, 4.0),
(28, '2022-01-28', 1422, 125, 0.04, 4.2),
(29, '2022-01-29', 190, 130, 0.06, 4.5),
(30, '2022-01-30', 200, 140, 0.08, 4.8),
(31, '2022-01-31', 210, 145, 0.1, 5.0),
(32, '2022-02-01', 220, 150, 0.12, 5.2),
(33, '2022-02-02', 230, 155, 0.14, 5.5),
(34, '2022-02-03', 240, 160, 0.16, 5.8),
(35, '2022-02-04', 250, 165, 0.18, 6.0),
(36, '2022-02-05', 260, 170, 0.2, 6.2),
(37, '2022-02-06', 270, 175, 0.22, 6.5),



--INSERT INTO engagement_metrics
insert into engagement_metrics values (1, '2022-01-01', 15, 12, 25, 2),
 (2, '2022-01-02', 20, 15, 30, 5),
 (3, '2022-01-03', 18, 14, 27, 3),
 (4, '2022-01-04', 12, 10, 20, 1),
 (5, '2022-01-05', 14, 11, 23, 2),
(6, '2022-01-06', 16, 13, 25, 3),
(7, '2022-01-07', 17, 14, 28, 4),
 (8, '2022-01-08', 19, 16, 30, 5),
 (9, '2022-01-09', 21, 18, 32, 6),
 (10, '2022-01-10', 23, 20, 34, 7),
(11, '2022-01-11', 25, 22, 36, 8),
(12, '2022-01-12', 27, 24, 38, 9),
(13, '2022-01-13', 27, 24, 38, 56),
	(14, '2022-01-14', 78, 32, 564, 43),
	(15, '2022-01-15', 35, 24, 38, 22),
	(16, '2022-01-16', 56, 32, 454, 25),
	(17, '2022-01-17', 79, 23, 179, 56),
	(18, '2022-01-18', 121, 22, 138, 12),
	(19, '2022-01-12', 256, 89, 128, 4),
	(20, '2022-01-12', 23, 22, 321, 2);



SELECT * FROM engagement_metrics
RIGHT JOIN website_traffic
ON engagement_metrics.date = website_traffic.date;

SELECT * FROM engagement_metrics

SELECT * FROM website_traffic


/* QUESTIONS

1. What was the total number of unique visitors for a specific date range?*/
SELECT SUM(unique_visitors) FROM website_traffic WHERE date BETWEEN '2022-02-07' AND '2022-02-09';

/* 2. What was the average bounce rate for a specific date range?*/
SELECT AVG(bounce_rate) FROM website_traffic WHERE date BETWEEN '2022-01-01' AND '2022-02-09';

/* 3. What is the average time spent on the website by visitors? */
SELECT CONCAT(FLOOR(AVG(time_on_site)), ' minutes') as Avg_time_spent_on_web 
FROM website_traffic;

/* 4. What was the engagement rate between january and 9th feb 2022?*/
WITH engagement AS (
  SELECT date, SUM(comments) + SUM(likes) + SUM(shares) AS engagement
  FROM engagement_metrics
  WHERE date BETWEEN '2022-01-01' AND '2022-02-09'
  GROUP BY date)
SELECT e.date, ROUND(SUM(engagement) / SUM(w.page_views), 2) as engagement_rate, 
CONCAT(ROUND(SUM(engagement) / SUM(w.page_views)*100, 2), '%') as engagement_rate_percent
FROM engagement e
JOIN website_traffic w
ON e.date = w.date
GROUP BY e.date;


/* 5. Which 3 days has more engagement?*/
WITH engagement AS (
  SELECT date, SUM(comments) + SUM(likes) + SUM(shares) AS engagement
  FROM engagement_metrics
  WHERE date BETWEEN '2022-01-01' AND '2022-02-09'
  GROUP BY date)
SELECT e.date, ROUND(SUM(engagement) / SUM(w.page_views), 2) as engagement_rate, 
CONCAT(ROUND(SUM(engagement) / SUM(w.page_views)*100, 2), '%') as engagement_rate_percent
FROM engagement e
JOIN website_traffic w
ON e.date = w.date
GROUP BY e.date
ORDER BY engagement_rate DESC
LIMIT 3;

/*6. What is the total engagement (comments, likes, shares) by day?*/
SELECT date, SUM(comments) + SUM(likes) + SUM(shares) as engagement
FROM engagement_metrics
GROUP BY date
ORDER BY engagement desc;

/*7. What is the total engagement by day of the week?*/
WITH engagement AS ( SELECT date, SUM(comments) + SUM(likes) + SUM(shares) 
AS engagement FROM engagement_metrics GROUP BY date )
SELECT
CASE
WHEN DATE_PART('dow', e.date) = 1 THEN 'Monday'
WHEN DATE_PART('dow', e.date) = 2 THEN 'Tuesday'
WHEN DATE_PART('dow', e.date) = 3 THEN 'Wednesday'
WHEN DATE_PART('dow', e.date) = 4 THEN 'Thursday'
WHEN DATE_PART('dow', e.date) = 5 THEN 'Friday'
WHEN DATE_PART('dow', e.date) = 6 THEN 'Saturday'
WHEN DATE_PART('dow', e.date) = 0 THEN 'Sunday'
END as day_of_week, SUM(engagement) as total_engagement 
FROM engagement e GROUP BY day_of_week
ORDER BY total_engagement desc;

/*8. What is the average engagement per unique visitor?*/

WITH engagement AS (SELECT date, SUM(comments) + SUM(likes) + SUM(shares) 
AS engagement FROM engagement_metrics GROUP BY date)
SELECT ROUND (AVG(e.engagement/w.unique_visitors), 2) as average_engagement_per_unique_visitor
FROM website_traffic w
JOIN engagement e ON w.date = e.date;


/*9. What is the average bounce rate for days with more than 1000 unique visitors?*/
SELECT AVG(bounce_rate) as average_bounce_rate FROM website_traffic 
WHERE unique_visitors > 1000;

/* 10. What is the total number of unique visitors for days with a bounce rate above 20%?*/
SELECT SUM(unique_visitors) as total_unique_visitors 
FROM website_traffic WHERE bounce_rate > 0.2;


/* 11. How many days have a bounce rate above the average bounce rate?*/
WITH avg_bounce_rate AS (SELECT AVG(bounce_rate) as avg_bounce_rate FROM website_traffic)
SELECT CONCAT (COUNT(*), ' ', 'days') as number_of_days FROM website_traffic w
JOIN avg_bounce_rate a ON w.bounce_rate > a.avg_bounce_rate;











































