--CountRows

SELECT 
    COUNT(*)
FROM job_postings_fact;

--CountRows Window Function

SELECT 
    job_id,
    COUNT(*) OVER()
FROM job_postings_fact;



SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER(
        PARTITION BY job_title_short
    )
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY RANDOM()
LIMIT 10;

SELECT 
    job_id,
    job_title_short,
    company_id,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER(
        PARTITION BY job_title_short,company_id
    )
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY RANDOM()
LIMIT 10;

--ORDER BY
SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER(
        ORDER BY salary_hour_avg DESC
    )AS rank_hourly_salary
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
LIMIT 10;


--PARTITION E ORDER BY
SELECT 
    job_posted_date,
    job_title_short,
    company_id,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER(
        PARTITION BY job_title_short
        ORDER BY job_posted_date
    )AS running_avg_hourly_by_title
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY 
    job_title_short,
    job_posted_date
LIMIT 10;