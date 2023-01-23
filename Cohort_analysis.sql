/* COHORT ANALYSIS
Cohort analysis is a powerful tool used to understand customer behavior and identify patterns in customer 
behavior over time. It helps to segment customers based on their acquisition date or any other relevant 
criteria and then track their behavior over time. This type of analysis is particularly useful for businesses 
that have a recurring revenue model, such as subscription-based services, and it can be used to identify key 
metrics such as customer retention, lifetime value, and churn rate.

The main goal of cohort analysis is to identify trends and patterns in customer behavior, which can then be used 
to inform marketing, product development, and customer service strategies. For example, if a business finds that 
customers who joined in a certain month have higher retention rates than those who joined in other months, they 
might focus their marketing efforts on acquiring more customers in that month. Similarly, if they find that customers 
who join at a certain age have higher lifetime value than those who join at other ages, they might focus on targeting 
that age group in their marketing efforts.

Overall, the cohort analysis is a powerful tool to gain insights into customer behavior and improve the business 
performance. It can be used to identify patterns and trends in customer behavior over time, and then use that information 
to inform business decisions and improve the customer experience.


QUESTIONS

1. Average purchase value of customers who purchased by different gender over time*/
WITH customer_cohort AS (
    SELECT 
        gender,
        DATE_TRUNC('month', date) as cohort_month,
        SUM(purchase_amount) as total_purchase_amount,
        COUNT(DISTINCT user_id) as total_customers
    FROM public.customer_seg
    WHERE purchased = 1
    GROUP BY gender, cohort_month
), avg_purchase_value AS (
    SELECT 
        gender, 
        cohort_month, 
        total_purchase_amount,
        ROUND (total_purchase_amount / total_customers, 0) as avg_purchase_value
    FROM customer_cohort)
SELECT gender, cohort_month, avg_purchase_value
FROM avg_purchase_value
ORDER BY gender, cohort_month

/* 2. What is the retention rate of customers acquired in each month?
Customer retention rate (cohort analysis).
 This information is useful for businesses to understand how well they are retaining customers over time and identify any patterns
 or trends in customer retention. This can help businesses make informed decisions about their marketing and retention strategies, 
 and identify areas for improvement. Additionally, by analyzing customer retention by acquisition month, businesses can also identify
 any seasonality in customer retention rates. This can help them plan for the future and make necessary adjustments to their
 strategies and resources accordingly.*/ DEMO 35

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


/* 3. How does the average purchase value of customers vary over time within each 
cohort in the year 2021? DEMO 34

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

WITH customer_cohort AS (
SELECT
DATE_TRUNC('month', date) as cohort_month,
user_id,
SUM(purchase_amount) as total_purchase_amount
FROM public.customer_seg WHERE date >= '2021-01-01' AND date < '2022-01-01'
GROUP BY cohort_month, user_id)
SELECT
cohort_month,
EXTRACT(MONTH FROM cohort_month) as cohort_month_only,
FLOOR (AVG(total_purchase_amount)) AS Average_purchase
FROM customer_cohort
GROUP BY cohort_month order by cohort_month_only asc;


/* 4. What is the retention rate of customers who purchased in different age groups?*/
WITH customer_cohort AS (SELECT 
        CASE 
            WHEN age < 20 THEN 'Under 20'
            WHEN age >= 20 AND age < 30 THEN '20-29'
            WHEN age >= 30 AND age < 40 THEN '30-39'
            WHEN age >= 40 AND age < 50 THEN '40-49'
            WHEN age >= 50 THEN '50 or above'
            ELSE 'Unknown'
        END as age_group,
        DATE_TRUNC('month', date) as cohort_month,
        COUNT(DISTINCT user_id) as total_customers
    FROM public.customer_seg
    WHERE purchased = 1
    GROUP BY age_group, cohort_month), retention_rate AS (SELECT 
        age_group, 
        cohort_month, 
        total_customers,
        CEILING((SUM(total_customers) OVER (PARTITION BY age_group ORDER BY cohort_month) / total_customers) * 100) as retention_rate
    FROM customer_cohort)
SELECT age_group, cohort_month, retention_rate
FROM retention_rate
ORDER BY age_group, cohort_month





SELECT * FROM public.customer_seg















































































































































