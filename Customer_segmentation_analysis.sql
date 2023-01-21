/* Customer segmentation is the process of dividing customers into groups based on common characteristics, 
such as demographics, behavior, and purchase history. The goal of customer segmentation is to identify
high yield segments - that is, those segments that are likely to be the most profitable or that have 
growth potential - and to develop strategies to target these segments.

In this project, I used SQL to extract and analyze data from the customer_seg table. The table contains 
information about customers, such as their user_id, gender, age, salary, and purchase history (1 or 0) and date.

1. What is the breakdown of customers by gender? */
SELECT "gender", COUNT(DISTINCT "user_id") as num_customers
FROM public."customer_seg"
GROUP BY "gender"

--2. What is the breakdown of customers by age group?
WITH age_groups AS (
    SELECT 
        "user_id",
        CASE 
            WHEN "age" < 25 THEN 'Under 25'
            WHEN "age" BETWEEN 25 AND 34 THEN '25-34'
            WHEN "age" BETWEEN 35 AND 44 THEN '35-44'
            WHEN "age" BETWEEN 45 AND 54 THEN '45-54'
            WHEN "age" > 54 THEN 'Over 54'
        END as age_group
    FROM public.customer_seg
)
SELECT age_group, COUNT(DISTINCT "user_id") as num_customers
FROM age_groups
GROUP BY age_group

--3. What is the breakdown of customers by salary group?
WITH salary_groups AS (
    SELECT 
        "user_id",
        CASE 
            WHEN "salary" < 50000 THEN 'Under 50k'
            WHEN "salary" BETWEEN 50000 AND 75000 THEN '50k-75k'
            WHEN "salary" BETWEEN 75000 AND 100000 THEN '75k-100k'
            WHEN "salary" > 100000 THEN 'Over 100k'
        END as salary_group
    FROM public.customer_seg
)
SELECT salary_group, COUNT(DISTINCT user_id) as num_customers
FROM salary_groups
GROUP BY salary_group

--4. What is the breakdown of customers who have purchased and those who have not?
SELECT 
    CASE 
        WHEN purchased = 1 THEN 'Purchased'
        WHEN purchased = 0 THEN 'Not Purchased'
    END as purchase_status, 
    COUNT(DISTINCT user_id) as num_customers
FROM public.customer_seg
GROUP BY purchase_status

--5. What is the breakdown of customers by gender, age group and salary group?
WITH customer_segments AS (
    SELECT 
        *, 
        CASE 
            WHEN age < 25 THEN 'Under 25'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age > 54 THEN 'Over 54'
        END as age_group,
        CASE 
            WHEN salary < 50000 THEN 'Under 50k'
            WHEN salary BETWEEN 50000 AND 75000 THEN '50k-75k'
            WHEN salary BETWEEN 75000 AND 100000 THEN '75k-100k'
            WHEN salary > 100000 THEN 'Over 100k'
        END as salary_group
    FROM public.customer_seg
)
SELECT 
    gender, 
    age_group, 
    salary_group,
    COUNT(DISTINCT user_id) as num_customers
FROM customer_segments
GROUP BY gender, age_group, salary_group


--6. What is the average salary of customers who have purchased?
SELECT '$' || CEILING (AVG(salary))::text AS purchased_customers
FROM public.customer_seg
WHERE purchased = 1


--7. What is the average age of customers who have not purchased?
SELECT CEILING (AVG(age)) Age_with_no_purchase
FROM public.customer_seg
WHERE purchased = 0

--8. What is the percentage of customers who have purchased by age group?
WITH age_groups AS (
    SELECT 
        user_id,
		purchased,
        CASE 
            WHEN age < 25 THEN 'Under 25'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age > 54 THEN 'Over 54'
        END as age_group
    FROM public.customer_seg
)
SELECT 
    age_group, 
    COUNT(CASE WHEN "purchased" = 1 THEN 1 END)/COUNT(DISTINCT user_id) * 100 as percentage_purchased
FROM age_groups
GROUP BY age_group

--9. What is the average salary of customers by gender and age group?
WITH customer_segments AS (
    SELECT 
        gender, 
        CASE 
            WHEN age < 25 THEN 'Under 25'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age > 54 THEN 'Over 54'
        END as age_group,
        salary
    FROM public.customer_seg
)
SELECT 
    gender, 
    age_group,
    '$' || CEILING (AVG(salary))::text AS avg_salary
FROM customer_segments
GROUP BY gender, age_group

--10.  Which age group made the highest purchase?
WITH age_groups AS (
    SELECT 
        user_id,
		purchased,
        CASE 
            WHEN age < 25 THEN 'Under 25'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age > 54 THEN 'Over 54'
        END as age_group
    FROM public.customer_seg
)
SELECT 
    age_group, 
    SUM(purchased) as total_purchases
FROM age_groups
GROUP BY age_group
ORDER BY total_purchases DESC

--11. What is the percentage of customers by gender who made a purchase?

WITH gender_groups AS (
    SELECT 
        user_id,
        gender,
		purchased
    FROM public.customer_seg
)
SELECT 
    gender, 
    (COUNT(CASE WHEN purchased = 1 THEN 1 END)/COUNT(DISTINCT user_id)) * 100 as percentage_purchased
FROM gender_groups
GROUP BY gender
ORDER BY percentage_purchased DESC





































































































































