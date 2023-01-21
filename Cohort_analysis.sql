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
1. What is the retention rate of customers who purchased in different age groups?*/
WITH customer_cohort AS (
    SELECT 
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
    GROUP BY age_group, cohort_month
), retention_rate AS (
    SELECT 
        age_group, 
        cohort_month, 
        total_customers,
        CEILING((SUM(total_customers) OVER (PARTITION BY age_group ORDER BY cohort_month) / total_customers) * 100) as retention_rate
    FROM customer_cohort
)
SELECT age_group, cohort_month, retention_rate
FROM retention_rate
ORDER BY age_group, cohort_month

--2. Average purchase value of customers who purchased by different gender over time:
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
    FROM customer_cohort
)
SELECT gender, cohort_month, avg_purchase_value
FROM avg_purchase_value
ORDER BY gender, cohort_month

--3. What is the retention rate of customers acquired in each month?
WITH customer_cohort AS (
    SELECT 
        DATE_TRUNC('month', date) as cohort_month,
        COUNT(DISTINCT user_id) as total_customers,
        SUM(CASE WHEN date >= date THEN 1 ELSE 0 END) as retained_customers
    FROM public.customer_seg
    GROUP BY cohort_month
)
SELECT 
    cohort_month,
    retained_customers / total_customers as retention_rate
FROM customer_cohort
ORDER BY cohort_month


--4. How does the average purchase value of customers vary over time within each cohort?
WITH customer_cohort AS (
    SELECT 
        DATE_TRUNC('month', date) as cohort_month,
        user_id,
        SUM(purchase_amount) as total_purchase_amount
    FROM public.customer_seg
    GROUP BY cohort_month, user_id
)
SELECT 
    cohort_month,
    AVG(total_purchase_amount) 
	FROM customer_cohort




























































































































































