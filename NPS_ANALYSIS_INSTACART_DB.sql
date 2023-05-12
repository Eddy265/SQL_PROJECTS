/*Project Title: Customer Satisfaction Analysis for Least Performing Products:

Project Description:

This project aimed to identify the 10 least performing products in terms of quantity ordered and analyze customer satisfaction for these products using the Net Promoter Score (NPS) framework.

First, I analyzed the sales data of the products from the Instacart database and identified the 10 products that had the lowest quantity of orders. I then prepared a customer survey with a question asking customers to rate their likelihood of recommending these products to a friend or colleague on a scale of 0-10.

I distributed the survey to a sample of customers from different segments and collected their responses. The survey form was created using google form that was connected to the database. Using the NPS framework, I calculated the percentage of promoters (customers who rated the product 9 or 10), detractors (customers who rated the product 0 to 6), and passives (customers who rated the product 7 or 8) for each of the 10 least performing products.

My analysis showed that the NPS scores for the 10 products ranged from -60% to 35.71%, indicating that most of the customers were dissatisfied with these products. I also found that the percentage of passive respondents for each product varied between 25% to 50%, indicating that these customers are not completely satisfied with the product and may switch to other products in the future.


Based on these findings, I recommended that the company take appropriate actions to improve the quality of these products and also incentivize customers to continue purchasing them. For example, the company can consider providing discounts or loyalty points to customers who continue to purchase these products despite their low satisfaction levels.

Overall, this project helped the company identify the least performing products and understand the reasons behind the low customer satisfaction levels. The NPS framework provided a quantitative measure of customer satisfaction and helped in prioritizing the products that require immediate attention.*/




--IDENTIFY THE 10 LEAST PERFORMING PRODUCTS FROM THE INSTACART DB
SELECT 
    p.product_id, 
    p.product_name, 
    SUM(o.quantity) AS total_quantity_ordered
FROM 
    products p
    JOIN orders o ON p.product_id = o.product_id
GROUP BY 
    p.product_id, 
    p.product_name
ORDER BY 
    total_quantity_ordered ASC
LIMIT 
    10;

--CREATE THE TABLE FOR THE CUSTOMER SURVEY DATA
CREATE TABLE nps_data (
  id SERIAL PRIMARY KEY,
  product_id INTEGER,
  nps_score INTEGER,
FOREIGN KEY (product_id) references products(product_id)
);



--CALCULATE THE NPS FOR THE 10 LEAST PERFORMING PRODUCTS

WITH nps_summary AS (
  SELECT 
    p.product_id, p.product_name, 
    COUNT(*) AS total_responses,
    SUM(CASE WHEN nps_score BETWEEN 0 AND 6 THEN 1 ELSE 0 END) AS detractors,
    SUM(CASE WHEN nps_score BETWEEN 7 AND 8 THEN 1 ELSE 0 END) AS passives,
    SUM(CASE WHEN nps_score BETWEEN 9 AND 10 THEN 1 ELSE 0 END) AS promoters
  FROM nps_data n
	JOIN products p on n.product_id = p.product_id
  GROUP BY 1, 2
)
SELECT 
  product_id,
  product_name,
  total_responses,
  detractors,
  passives,
  promoters,
  ROUND(100 * (promoters - detractors) / total_responses::numeric, 2) || '%' AS nps_score,
  ROUND(100 * passives / total_responses::numeric, 2) || '%' AS passive_respondents
FROM nps_summary;



