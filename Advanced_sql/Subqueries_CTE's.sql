SELECT
        company_id,
        job_no_degree_mention
FROM
       job_postings_fact
WHERE
       job_no_degree_mention=TRUE;

SELECT
      company_id,
      name AS company_name
FROM company_dim
WHERE company_id IN(
                    SELECT
                          company_id
                    FROM
                         job_postings_fact
                   WHERE
                        job_no_degree_mention=TRUE);

--CTE's
WITH job_postings_count AS(
SELECT
      company_id,
      COUNT(company_id) AS job_count
FROM  
      job_postings_fact
GROUP BY 
         company_id
ORDER BY company_id ASC
)
SELECT 
       name AS company_name,
       job_count
FROM
     company_dim
LEFT JOIN job_postings_count ON
          company_dim.company_id=job_postings_count.company_id
ORDER BY job_count DESC;


SELECT
      company_id
FROM  job_postings_fact
ORDER BY company_id ASC;

--Problem 1
WITH skill_required AS(
SELECT
      count(skill_id) AS skill_count,
      skill_id
FROM skills_job_dim
GROUP BY skill_id
ORDER BY skill_count DESC
LIMIT 5
)
SELECT
      skills_dim.skills AS skill_name,
      skill_required.skill_count
FROM skills_dim
JOIN skill_required ON
skill_required.skill_id=skills_dim.skill_id;

SELECT*
FROM skills_dim;

--Problem 2
WITH job_posted AS(
SELECT 
       COUNT(*) AS job_postings_count,
       company_id
FROM
    job_postings_fact
GROUP BY company_id
ORDER BY job_postings_count ASC
)
SELECT
      job_postings_count,
      CASE
          WHEN job_postings_count<10 THEN 'Small'
          WHEN job_postings_count<=50 THEN 'Medium'
          ELSE 'Large'
      END AS job_count
FROM job_posted; 

SELECT *
FROM job_postings_fact
WHERE job_location='Anywhere';

UPDATE job_postings_fact
SET job_location='Remote'
WHERE job_location='Anywhere';


WITH remote_job AS(
SELECT
      COUNT(job_postings_fact.*) AS job_count,
      skills_job_dim.skill_id AS skill_id
FROM job_postings_fact
JOIN skills_job_dim ON
job_postings_fact.job_id=skills_job_dim.job_id
WHERE job_location='Remote'AND
      job_postings_fact.job_title_short='Data Analyst'
GROUP BY
        skill_id
ORDER BY job_count DESC
)
SELECT 
      skills_dim.skill_id,
      skills_dim.skills AS skills,
      remote_job.job_count
FROM skills_dim
JOIN remote_job
ON skills_dim.skill_id=remote_job.skill_id
ORDER BY job_count DESC
LIMIT 5;


