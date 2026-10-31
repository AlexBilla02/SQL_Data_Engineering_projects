SELECT UNNEST([1,1,1,2])
UNION ALL
SELECT UNNEST([1,1,3]);

SELECT UNNEST([1,1,1,2])
INTERSECT ALL
SELECT UNNEST([1,1,3]);

SELECT UNNEST([1,1,1,2,2])
EXCEPT ALL
SELECT UNNEST([1,1,3]);



CREATE TEMP TABLE jobs_2023 AS
SELECT * EXCLUDE(job_id,job_posted_date)
FROM job_postings_fact
WHERE EXTRACT(YEAR from job_posted_date) = 2023;

SELECT * 
FROM jobs_2023;

CREATE TEMP TABLE jobs_2024 AS
SELECT * EXCLUDE(job_id,job_posted_date)
FROM job_postings_fact
WHERE EXTRACT(YEAR from job_posted_date) = 2024;

SELECT * 
FROM jobs_2024;

--Which unique job postings appeared in either 2023 or 2024?
SELECT *
FROM jobs_2023
UNION 
SELECT *
FROM jobs_2024;

SELECT *
FROM jobs_2023
UNION ALL
SELECT *
FROM jobs_2024;

-- WHich job postings appeared in 2023 but not in 2024?
SELECT *
FROM jobs_2023
EXCEPT
SELECT *
FROM jobs_2024;

SELECT *
FROM jobs_2023
INTERSECT
SELECT *
FROM jobs_2024;