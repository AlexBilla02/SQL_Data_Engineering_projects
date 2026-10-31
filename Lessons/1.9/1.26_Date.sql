SELECT  
    job_posted_date,
    EXTRACT(YEAR FROM job_posted_date) AS job_posted_year,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month
FROM job_postings_fact;


SELECT  
    COUNT(*) AS job_count,
    EXTRACT(YEAR FROM job_posted_date) AS job_posted_year,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
FROM job_postings_fact
WHERE job_title_short='Data Engineer'
GROUP BY 
    EXTRACT(YEAR FROM job_posted_date),
    EXTRACT(MONTH FROM job_posted_date)
ORDER BY 
    job_posted_year,
    job_posted_month;


SELECT  
    job_posted_date,
    DATE_TRUNC('month', job_posted_date) AS job_trunc_month
FROM job_postings_fact;

--Query uguale a quella di prima ma con date_trunc
SELECT  
    COUNT(*) AS job_count,
    DATE_TRUNC('month', job_posted_date) AS job_trunc_month
FROM job_postings_fact
WHERE job_title_short='Data Engineer'
    AND EXTRACT(YEAR FROM job_posted_date)=2024
GROUP BY 
    DATE_TRUNC('month', job_posted_date)
ORDER BY 
    job_trunc_month;


SELECT
    '2026-01-01 00:00:00+00'::TIMESTAMPTZ AT TIME ZONE 'EST';