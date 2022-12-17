--REPLACE NULL VALUES WITH SPECIFIED VALUES
--IN POSTGRESQL

--FOR THIS DEMO, WE WILL USE
--CASE STATEMENT
--COALESCE

--COALESCE-------

SELECT gnp_old, head_of_state, name from country;

SELECT COUNT(*) from country where gnp_old isnull

SELECT COUNT(*) from country where head_of_state isnull

select coalesce (head_of_state, 'not provided') as head_of_state,
    coalesce (gnp_old, '0') from country;
    

--CASE STATEMENT--

SELECT 
    CASE WHEN gnp_old isnull then '0' else gnp_old
    END,
    CASE WHEN head_of_state isnull then 'not available'
    ELSE head_of_state
    END
    from country;