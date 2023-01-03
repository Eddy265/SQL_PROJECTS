/*REPLACE NULL VALUES WITH SPECIFIED VALUES IN POSTGRESQL USING 
CASE STATEMENT AND COALESCE*/

SELECT * FROM country

SELECT COUNT(*) FROM country WHERE head_of_state isnull;
SELECT COUNT(*) FROM country WHERE gnp_old isnull;
SELECT COUNT(*) FROM country WHERE indep_year isnull

/*COALESCE*/

SELECT COALESCE (head_of_state, 'not provided') AS head_of_state,
    COALESCE (gnp_old, '0'),
    COALESCE (indep_year, '1900')  FROM country;
    
/*CASE STATEMENT*/

SELECT 
    CASE WHEN gnp_old isnull then '0' else gnp_old
    END,
    CASE WHEN head_of_state isnull then 'not available'
    ELSE head_of_state
    END,
    CASE WHEN indep_year isnull then '1900' 
    ELSE indep_year
    END
    FROM country;