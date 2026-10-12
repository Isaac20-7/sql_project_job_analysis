/*
Question:What are the 5 most sort after skills for a data analyst
*/
WITH skills_in_demand AS(
        SELECT 
            skill_id,
            COUNT(*) AS skill_count
        FROM
            skills_job_dim
        INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id=skills_job_dim.job_id
        WHERE
            job_title_short='Data Analyst'
        GROUP BY
                skill_id
        ORDER BY skill_count DESC
)
SELECT
      skills_in_demand.skill_id,
      skills_dim.skills AS Skill,
      skills_in_demand.skill_count
FROM skills_dim
JOIN skills_in_demand ON skills_dim.skill_id=skills_in_demand.skill_id
ORDER BY skill_count DESC
LIMIT 5;