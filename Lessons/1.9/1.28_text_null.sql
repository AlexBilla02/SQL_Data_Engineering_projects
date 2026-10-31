SELECT
    LENGTH('SQL');
 
SELECT
    LOWER('SQL');
 
SELECT
    LEFT('SQL',2);   
SELECT
    RIGHT('SQL',2);   
--substring inizia a estrarre dal carattere del secondo campo
SELECT SUBSTRING('SQL',2,3); 

SELECT 'ciao' || ' SQL';

SELECT TRIM(' SQL ');

SELECT REPLACE('SQL','Q','k');

SELECT REGEXP_REPLACE('ciao@gmail.com','^*.*(@)','\1');




--NULL

SELECT NULLIF(10,20);


SELECT COALESCE(NULL,1,2,3);

SELECT
    salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg,salary_hour_avg*2080)
FROM
    job_postings_fact
WHERE salary_hour_avg OR salary_year_avg IS NOT NULL;