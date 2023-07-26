
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


/*Based on these findings, I recommended that the company take appropriate actions to improve the quality of these products and also incentivize customers to continue
purchasing them. For example, the company can consider providing discounts or loyalty points to customers who continue to purchase these products despite their low 
satisfaction levels.

Overall, this project helped the company identify the least performing products and understand the reasons behind the low customer satisfaction levels. The NPS 
framework provided a quantitative measure of customer satisfaction and helped in prioritizing the products that require immediate attention.*/




