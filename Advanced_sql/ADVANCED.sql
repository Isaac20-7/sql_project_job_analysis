SELECT
      '2023-02-19'::DATE;

SELECT
      job_title,
      job_title_short,
      job_posted_date :: DATE AS date,
      EXTRACT(MONTH FROM job_posted_date) AS MONTH,
      EXTRACT(YEAR FROM job_posted_date) AS YEAR
FROM job_postings_fact
LIMIT 20;

SELECT
      COUNT(job_id) AS job_posted_count,
      EXTRACT(MONTH FROM job_posted_date) AS MONTH
FROM
    job_postings_fact
WHERE
     job_title_short='Data Analyst'
GROUP BY
       MONTH
ORDER BY 
        COUNT(job_id) DESC;

SELECT
      job_schedule_type,
      ROUND(AVG(salary_year_avg),2) AS Average_yearly_salary,
     ROUND(AVG(salary_hour_avg),2) AS Average_hourly_salary
FROM
    job_postings_fact
WHERE
     job_posted_date>'June 1,2023'
GROUP BY
        job_schedule_type
HAVING
       AVG(salary_year_avg) IS NOT NULL AND   
       AVG(salary_hour_avg) IS NOT NULL
ORDER BY
        Average_yearly_salary DESC;

SELECT
      COUNT(job_id) AS job_posted_count,
      EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month
FROM
    job_postings_fact
GROUP BY
       month
ORDER BY
       month DESC;

SELECT
      companies.name AS company_name,
      EXTRACT(MONTH FROM job_posted.job_posted_date) AS month
FROM 
     company_dim AS companies   
JOIN job_postings_fact AS job_posted
ON companies.company_id = job_posted.company_id
WHERE
      (EXTRACT(QUARTER FROM job_posted.job_posted_date)=2) AND
      (job_health_insurance='true');

DROP TABLE march_jobs;

CREATE TABLE january_jobs AS
     SELECT *
     FROM 
         job_postings_fact
    WHERE
         EXTRACT(MONTH FROM job_posted_date)=1;

CREATE TABLE febraury_jobs AS
    SELECT*
    FROM
        job_postings_fact
    WHERE
         EXTRACT(MONTH FROM job_posted_date)=2;

CREATE TABLE march_jobs
AS
   SELECT *
   FROM
       job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date)=3;

SELECT
     COUNT(job_id) AS job_count,
     CASE
          WHEN job_location='Anywhere' THEN 'Remote'
          WHEN job_location='New York' THEN 'Local'
          ELSE 'Onsite'
    END AS location_categories
FROM
    job_postings_fact
WHERE job_title_short='Data Analyst'
GROUP BY
        location_categories;


SELECT
      salary_year_avg,
      CASE
          WHEN salary_year_avg<=55000 THEN 'low salary'
          WHEN salary_year_avg<=75000 THEN 'standard salary'
          ELSE 'high salary'
     END AS salary_category
FROM job_postings_fact
WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY
        salary_year_avg DESC;



SELECT
     salary_year_avg
FROM job_postings_fact
WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL;






