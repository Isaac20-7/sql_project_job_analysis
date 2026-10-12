/*
Answer: What are the most optimal skills to learn (Is it in high demand and a high-paying skill)?
-I identified skills in high demand and associated with high average salaries for Data Analyst roles 
-I concentrated on remote positions with specified salaries 
-Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),to help offer strategic insights for career development in data analysis.
*/

--For Data Analyst working in remote jobs
WITH optimal_skill AS(
        SELECT
            skill_id,
            COUNT(skill_id) skill_count,
            ROUND(AVG(salary_year_avg),0) AS Avg_salary
        FROM skills_job_dim
        INNER JOIN job_postings_fact ON job_postings_fact.job_id=skills_job_dim.job_id
        WHERE
             job_title_short='Data Analyst' AND
            salary_year_avg IS NOT NULL AND
            job_work_from_home=TRUE
        GROUP BY
                skill_id
        ORDER BY skill_count DESC, Avg_salary DESC
)
SELECT 
      optimal_skill.*,
      skills_dim.skills AS skills
FROM skills_dim
JOIN optimal_skill ON optimal_skill.skill_id=skills_dim.skill_id;

-- For all jobs in general and from a remote perspective and with this the focus was more on the salaries involved 

WITH optimal_skill AS(
        SELECT
            skill_id,
            COUNT(skill_id) AS skill_count,
            ROUND(AVG(salary_year_avg),0) AS Avg_salary
        FROM skills_job_dim
        INNER JOIN job_postings_fact ON job_postings_fact.job_id=skills_job_dim.job_id
        WHERE
            salary_year_avg IS NOT NULL AND
            job_work_from_home=TRUE
        
        GROUP BY
                skill_id
)
SELECT 
      optimal_skill.*,
      skills_dim.skills AS skills
FROM skills_dim
JOIN optimal_skill ON optimal_skill.skill_id=skills_dim.skill_id
WHERE skill_count >10
ORDER BY Avg_salary DESC,skill_count DESC
LIMIT 25;



