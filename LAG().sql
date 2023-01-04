/* USE cases of Lag() function*/

CREATE TABLE overall_sales(
        month int, 
		year int,
		sales int,
		branch VARCHAR(50)
	);

INSERT INTO overall_sales VALUES(1,'2021-01-01', 2362150,'Hamburg')
INSERT INTO overall_sales VALUES(2,'2021-02-01', 2165431,'Hamburg')
INSERT INTO overall_sales VALUES(3,'2021-03-01', 3168352,'Hamburg')
INSERT INTO overall_sales VALUES(4,'2021-04-01', 2125791,'Hamburg')
INSERT INTO overall_sales VALUES(5,'2021-05-01', 1987634,'Hamburg')
INSERT INTO overall_sales VALUES(6,'2021-06-01', 4981234,'Hamburg')
INSERT INTO overall_sales VALUES(7,'2021-07-01', 2125634,'Hamburg')
INSERT INTO overall_sales VALUES(8,'2021-08-01', 3271625,'Hamburg')
INSERT INTO overall_sales VALUES(9,'2021-09-01', 2987265,'Hamburg')
INSERT INTO overall_sales VALUES(10,'2021-10-01', 1678376,'Hamburg')
INSERT INTO overall_sales VALUES(11,'2021-11-01', 3256524,'Hamburg')
INSERT INTO overall_sales VALUES(12,'2021-12-01', 2189876,'Hamburg')
INSERT INTO overall_sales VALUES(1,'2021-01-01', 2363650,'Bremen')
INSERT INTO overall_sales VALUES(2,'2021-02-01', 3164431,'Bremen')
INSERT INTO overall_sales VALUES(3,'2021-03-01', 2868352,'Bremen')
INSERT INTO overall_sales VALUES(4,'2021-04-01', 1455791,'Bremen')
INSERT INTO overall_sales VALUES(5,'2021-05-01', 2987634,'Bremen')
INSERT INTO overall_sales VALUES(6,'2021-06-01', 3981234,'Bremen')
INSERT INTO overall_sales VALUES(7,'2021-07-01', 1345634,'Bremen')
INSERT INTO overall_sales VALUES(8,'2021-08-01', 2275221,'Bremen')
INSERT INTO overall_sales VALUES(9,'2021-09-01', 2187265,'Bremen')
INSERT INTO overall_sales VALUES(10,'2021-10-01', 1978376,'Bremen')
INSERT INTO overall_sales VALUES (11,'2021-11-01', 3616314,'Bremen')
INSERT INTO overall_sales VALUES (12,'2021-12-01', 1289211,'Bremen')
INSERT INTO overall_sales VALUES(1,'2021-01-01', 3363650,'Hannover')
INSERT INTO overall_sales VALUES(2,'2021-02-01', 1164231,'Hannover')
INSERT INTO overall_sales VALUES(3,'2021-03-01', 1876542,'Hannover')
INSERT INTO overall_sales VALUES(4,'2021-04-01', 2455721,'Hannover')
INSERT INTO overall_sales VALUES(5,'2021-05-01', 3927124,'Hannover')
INSERT INTO overall_sales VALUES(6,'2021-06-01', 1981234,'Hannover')
INSERT INTO overall_sales VALUES(7,'2021-07-01', 1845634,'Hannover')
INSERT INTO overall_sales VALUES(8,'2021-08-01', 3275221,'Hannover')
INSERT INTO overall_sales VALUES(9,'2021-09-01', 4087265,'Hannover')
INSERT INTO overall_sales VALUES(10,'2021-10-01', 3918110,'Hannover')
INSERT INTO overall_sales VALUES(11,'2021-11-01', 1926644,'Hannover')
INSERT INTO overall_sales VALUES(12,'2021-12-01', 2289551,'Hannover')
INSERT INTO overall_sales VALUES(1,'2021-01-01', 2363650,'Berlin')
INSERT INTO overall_sales VALUES(2,'2021-02-01', 3164231,'Berlin')
INSERT INTO overall_sales VALUES(3,'2021-03-01', 4872542,'Berlin')
INSERT INTO overall_sales VALUES(4,'2021-04-01', 3455921,'Berlin')
INSERT INTO overall_sales VALUES(5,'2021-05-01', 2922144,'Berlin')
INSERT INTO overall_sales VALUES(6,'2021-06-01', 2981204,'Berlin')
INSERT INTO overall_sales VALUES(7,'2021-07-01', 1545634,'Berlin')
INSERT INTO overall_sales VALUES(8,'2021-08-01', 3243920,'Berlin')
INSERT INTO overall_sales VALUES(9,'2021-09-01', 4183215,'Berlin')
INSERT INTO overall_sales VALUES(10,'2021-10-01', 3511290,'Berlin')
INSERT INTO overall_sales VALUES(11,'2021-11-01', 2916024,'Berlin')
INSERT INTO overall_sales VALUES(12,'2021-12-01', 1982193,'Berlin')



WITH cte_sales AS (
	SELECT 
		month,
		branch,
		sales,
		LAG(sales) OVER (
			PARTITION BY branch
			ORDER BY month
		) previous_sales
	FROM 
		overall_sales
)
SELECT 
	month, 
	branch,
	sales, 
	previous_sales,
	CONCAT(
		(sales - previous_sales)  / previous_sales, '%'
		
	) vs_previous_month
FROM
	cte_sales;
    



SELECT branch,month, sales, 
       LAG(sales) OVER(PARTITION BY branch ORDER BY month) AS previous_amount,
       sales - LAG(sales) OVER(PARTITION BY branch ORDER By month) as difference
FROM overall_sales;