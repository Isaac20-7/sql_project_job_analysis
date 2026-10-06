--IN UNIONS NO DUPLICATE is INVOLVED

SELECT
       job_title_short,
       company_id,
       job_location
FROM
    january_jobs
UNION

SELECT
       job_title_short,
       company_id,
       job_location
FROM
    febraury_jobs

UNION ALL

SELECT
       job_title_short,
       company_id,
       job_location
FROM
     march_jobs;

--IN UNION ALL, DUPLICATES ARE INVOLVED

SELECT
       job_title_short,
       company_id,
       job_location
FROM
    january_jobs
UNION ALL

SELECT
       job_title_short,
       company_id,
       job_location
FROM
    febraury_jobs

UNION ALL

SELECT
       job_title_short,
       company_id,
       job_location
FROM
     march_jobs;


SELECT
       job_title_short,
       job_location,
       job_via,
       salary_year_avg
FROM
      job_postings_fact
WHERE
     EXTRACT(QUARTER FROM job_posted_date)=1
     AND salary_year_avg>70000
     AND job_title_short='Data Analyst'
ORDER BY salary_year_avg DESC;


