
/* CUSTOMER BEHAVIOUR ANALYSIS
The LAG function in PostgreSQL allows you to access the value of a column in a previous row 
in relation to the current row. This function can be useful in performing various types of analysis 
such as trend analysis, demographic analysis and income analysis. By comparing values of a column in
the current row to the previous row, you can identify patterns and trends in the data. In the examples 
provided above, we demonstrated how the LAG function can be used to perform trend analysis by looking 
at the difference in purchase amount, demographic analysis by looking at the difference in age with the 
same gender and income analysis by looking at the difference in salary with the same age. These are just
a few examples of how the LAG function can be used to gain insights from the data, depending on the data 
and the business problem, there can be different ways to use the LAG function to perform analysis.

QUESTIONS

1. Compare the purchase amount of a customer in the current row to their purchase amount in the previous row
The query below compares the purchase amount of a customer in the current row to 
their purchase amount in the previous row can be used to perform trend analysis. By looking at the difference 
in purchase amount between each customer's current and previous row, you can identify if a customer's purchase 
amount is increasing, decreasing or staying the same over time.*/

SELECT user_id, date, purchase_amount,
       purchase_amount - LAG(purchase_amount) OVER (PARTITION BY user_id ORDER BY date) as amount_difference
FROM public.customer_seg;

/* 2. Customer retention rate (cohort analysis).
 This information is useful for businesses to understand how well they are retaining customers over time and identify any patterns
 or trends in customer retention. This can help businesses make informed decisions about their marketing and retention strategies, 
 and identify areas for improvement. Additionally, by analyzing customer retention by acquisition month, businesses can also identify
 any seasonality in customer retention rates. This can help them plan for the future and make necessary adjustments to their
 strategies and resources accordingly.*/

WITH customer_data AS (
SELECT user_id, purchased, date,
EXTRACT(MONTH FROM date) as acquisition_month
FROM public.customer_seg)
SELECT acquisition_month, COUNT(DISTINCT user_id) as cohort_size,
COUNT(DISTINCT CASE WHEN purchased = 1 THEN user_id END) as retained_customers,
FLOOR((COUNT(DISTINCT CASE WHEN purchased = 1 THEN user_id END) / COUNT(DISTINCT user_id)::float) * 100) || '%' as retention_rate
FROM customer_data
GROUP BY acquisition_month
ORDER BY acquisition_month;


/* 3. Which Age bracket makes the most and least purchase?
This analysis is important for targeting specific customer age groups: 
Businesses can identify specific age groups that have a higher or lower purchase and target their 
marketing and sales efforts accordingly. For example, if an age group has a high purchase, it may 
indicate that these customers are more likely to make repeat purchases, and businesses can target them with 
loyalty programs or other incentives to encourage repeat purchases.*/

WITH customer_data AS (SELECT user_id, 
           CASE
                WHEN age BETWEEN 0 and 18 THEN '0-18'
                WHEN age BETWEEN 19 and 25 THEN '19-25'
                WHEN age BETWEEN 26 and 35 THEN '26-35'
                WHEN age BETWEEN 36 and 45 THEN '36-45'
                WHEN age BETWEEN 46 and 55 THEN '46-55'
                WHEN age > 55 THEN '56+'
           END as age_group, purchased
    FROM public.customer_seg
    WHERE purchased = 1)
SELECT age_group, SUM(purchased) as total_purchases, 'max' as type
FROM customer_data
GROUP BY age_group
HAVING SUM(purchased) = (SELECT MAX(total_purchases) FROM 
(SELECT age_group, SUM(purchased) as total_purchases FROM customer_data 
 GROUP BY age_group) as max_purch)
UNION
SELECT age_group, SUM(purchased) as total_purchases, 'min' as type
FROM customer_data
GROUP BY age_group
HAVING SUM(purchased) = (SELECT MIN(total_purchases) FROM 
(SELECT age_group, SUM(purchased) as total_purchases FROM customer_data 
GROUP BY age_group) as min_purch)
ORDER BY total_purchases DESC;


/*4. How does the average purchase value of customers vary over time within each 
cohort in the year 2021?

This kind of analysis can help businesses understand how customer behavior changes over time, 
specifically in relation to the initial acquisition of the customer. By analyzing the average 
purchase value of customers within each cohort, businesses can gain insights into the purchasing 
patterns of customers acquired in different months, and potentially identify trends or changes in
customer behavior that may be impacting their purchase value. For example, if the average purchase 
value of a cohort acquired in January is significantly higher than a cohort acquired in June, this
could indicate that customers acquired in January are more valuable or engaged than those acquired
in June. By focusing on a specific year, such as 2021, businesses can also better identify any patterns
or changes in customer behavior that have occurred within that specific time frame. This analysis can help
businesses to make more informed decisions about their marketing and sales strategies, as well as identify
areas where they can improve customer retention and engagement.*/

WITH customer_cohort AS (SELECT
DATE_TRUNC('month', date) as cohort_month,user_id,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg WHERE date >= '2021-01-01' AND date < '2022-01-01'
GROUP BY cohort_month, user_id)
SELECT
cohort_month,
EXTRACT(MONTH FROM cohort_month) as cohort_month_only,
FLOOR (AVG(total_purchase_amount)) AS Average_purchase
FROM customer_cohort
GROUP BY cohort_month order by cohort_month_only asc;


/* 5. Compare the average purchase value in 2021 and 2022
This kind of analysis can help businesses understand how their customer behavior and purchase habits change 
over time. By comparing the average purchase value of customers between two different years, businesses can 
identify trends and make informed decisions on how to improve their marketing strategies and target specific 
customer groups.*/
WITH customer_cohort AS (SELECT
DATE_TRUNC('month', date) as cohort_month,
EXTRACT(YEAR FROM DATE_TRUNC('month', date)) as cohort_year,
user_id,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg
GROUP BY cohort_month, user_id)
SELECT
cohort_year,
FLOOR (AVG(total_purchase_amount)) AS Average_purchase
FROM customer_cohort
WHERE cohort_year IN (2021,2022)
GROUP BY cohort_year
ORDER BY cohort_year;


/* 6. Compare the average purchase value over time in 2021 and 2022
This kind of analysis can help businesses understand how their customer behavior and purchase habits change 
over time. By comparing the average purchase value of customers between two different years, businesses can 
identify trends and make informed decisions on how to improve their marketing strategies and target specific 
customer groups.*/
WITH customer_cohort_2021 AS (SELECT
DATE_TRUNC('month', date) as cohort_month, user_id,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg
WHERE date >= '2021-01-01' AND date < '2022-01-01'
GROUP BY cohort_month, user_id),
customer_cohort_2022 AS (SELECT
DATE_TRUNC('month', date) as cohort_month,user_id,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg
WHERE date >= '2022-01-01' AND date < '2023-01-01'
GROUP BY cohort_month, user_id) SELECT cohort_month,
FLOOR (AVG(total_purchase_amount)) AS avg_purchase_2021,
FLOOR (AVG(total_purchase_amount)) AS avg_purchase_2022
FROM customer_cohort_2021
GROUP BY cohort_month
UNION
SELECT cohort_month,
NULL as avg_purchase_2021,
FLOOR (AVG(total_purchase_amount)) AS avg_purchase_2022
FROM customer_cohort_2022
GROUP BY cohort_month;


--OR


WITH customer_cohort_2021 AS (
SELECT DATE_TRUNC('month', date) as cohort_month,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg
WHERE date >= '2021-01-01' AND date < '2022-01-01'
GROUP BY cohort_month),
customer_cohort_2022 AS (
SELECT DATE_TRUNC('month', date) as cohort_month,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg
WHERE date >= '2022-01-01' AND date < '2023-01-01'
GROUP BY cohort_month)
SELECT
cohort_month,
FLOOR (AVG(CASE WHEN cohort_month = customer_cohort_2021.cohort_month THEN total_purchase_amount END)) AS avg_purchase_2021,
FLOOR (AVG(CASE WHEN cohort_month = customer_cohort_2022.cohort_month THEN total_purchase_amount END)) AS avg_purchase_2022
FROM customer_cohort_2021
FULL JOIN customer_cohort_2022
ON customer_cohort_2021.cohort_month = customer_cohort_2022.cohort_month
GROUP BY cohort_month;


/* 7. Average purchase value over time in 2019*/
WITH customer_cohort AS (
SELECT
DATE_TRUNC('month', date) as cohort_month,
user_id,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg
WHERE date_part('year', date) IN (2019, 2021)
GROUP BY cohort_month, user_id)
SELECT
cohort_month,
DATE_PART('year', cohort_month) as year,
FLOOR (AVG(total_purchase_amount)) as average_purchase
FROM customer_cohort
GROUP BY cohort_month, year
ORDER BY cohort_month, year


/* 8. Check if there is any customer who earned more than 150k*/

SELECT EXISTS (SELECT FROM public.customer_seg WHERE salary > 150000)






--DATA ADDITIONS

INSERT INTO public.customer_seg VALUES (425, 'Female', 20, 36000, 1, current_date-32, 1070)

SELECT * FROM public.customer_seg where user_id = 5

































































































