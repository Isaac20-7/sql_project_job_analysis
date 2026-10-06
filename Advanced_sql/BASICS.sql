Create table january_jobs
AS 
SELECT
      job_id,
      job_title_short,
      job_title,
      EXTRACT(MONTH FROM job_posted_date) AS posted_date 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=1;

CREATE TABLE febraury_jobs
AS
SELECT
      job_id,
      job_title_short,
      job_title,
      EXTRACT(MONTH FROM job_posted_date) AS posted_date
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=2;

CREATE TABLE March_jobs 
AS
SELECT
      job_id,
      job_title_short,
      job_title,
      EXTRACT(MONTH FROM job_posted_date) AS posted_date
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=3;

/*
C-CREATE
R-READ
U-UPDATE
D-DELETE
*/

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
*/


SELECT DISTINCT
              job_location
FROM job_postings_fact
ORDER BY job_location DESC;

SELECT 
      job_id,
      job_title_short,
      job_location,
      job_via
FROM job_postings_fact
ORDER BY job_location DESC;

SELECT
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg
FROM job_postings_fact
WHERE job_title_short='Data Analyst';

SELECT
      job_title_short,
      job_title,
      job_location,
      salary_year_avg
FROM job_postings_fact
WHERE ((job_title_short='Data Analyst' AND salary_year_avg>100000) OR(job_title_short='Business Analyst' AND salary_year_avg>70000)) 
      AND(job_location IN('Boston,MA','Anywhere'))
ORDER BY salary_year_avg;

SELECT
      name
FROM company_dim
WHERE name LIKE '%Tech_';

SELECT
      job_id,
      job_title,
      job_posted_date
FROM job_postings_fact
WHERE job_title LIKE 'Engineer_';

SELECT
      job_title,
      job_location,
      salary_year_avg
FROM job_postings_fact
WHERE job_title NOT LIKE 'Senior%';

SELECT
 job_title
FROM job_postings_fact;

SELECT
      COUNT(*) AS issued_insurance
FROM job_postings_fact
WHERE job_health_insurance='true';

SELECT
      job_country,
      COUNT(job_id) AS jobs_per_country
FROM job_postings_fact
GROUP BY job_country
ORDER BY COUNT(job_id) DESC;

SELECT *
FROM skills_dim;

SELECT
      job_postings.job_id,
      job_postings.job_title_short AS title,
      companies.name AS company
FROM job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies
      ON job_postings.company_id= companies.company_id;

SELECT
     job_postings.job_title AS job,
     companies.name AS company_name
FROM job_postings_fact AS job_postings
INNER JOIN company_dim AS companies
ON companies.company_id=job_postings.company_id
WHERE job_postings.job_title_short='Data Scientist';


SELECT
     job_postings.job_title,
     Skills.skills
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim AS skills_job
ON skills_job.job_id=job_postings.job_id
INNER JOIN skills_dim AS Skills
ON Skills.skill_id=skills_job.skill_id
WHERE job_location='New York' AND job_health_insurance='true';

SELECT
     Skills.skills AS skill_name,
     COUNT(skills_job.job_id) AS Number_of_Jobs,
    AVG(job_postings.salary_year_avg) AS Average_Salary
FROM skills_dim AS Skills
LEFT JOIN skills_job_dim AS skills_job
ON Skills.skill_id=skills_job.skill_id
LEFT JOIN job_postings_fact AS job_postings
ON skills_job.job_id=job_postings.job_id
GROUP BY Skills.skills
HAVING AVG(job_postings.salary_year_avg) IS NOT NULL
ORDER BY AVG(job_postings.salary_year_avg) DESC;


