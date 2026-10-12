/*
Question: What are the top skills based on salary?
-I looked at the average salary associated with each skill for Data Analyst positions
-I focused on roles with specified salaries,regardless of location
-why? To help reveal how different skills impact salary levels for Data Analysts and help identify the most financially rewarding skills to acquire or improve
*/

SELECT
      skills,
      ROUND(AVG(salary_year_avg),3) AS salary_per_skills
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
     job_title_short = 'Data Analyst'
     AND salary_year_avg IS NOT NULL
GROUP BY
        skills
ORDER BY
        salary_per_skills DESC
LIMIT 25;

/*
Here is the breakdown for the top paying skills
-High Demand for Big Data & ML Skills: Top salaries are commanded by analyst skilled in big Data
-Software Development & Deployment Proficiency
-Cloud Computing Expertise
*/


[
  {
    "skills": "svn",
    "salary_per_skills": "400000.000"
  },
  {
    "skills": "solidity",
    "salary_per_skills": "179000.000"
  },
  {
    "skills": "couchbase",
    "salary_per_skills": "160515.000"
  },
  {
    "skills": "datarobot",
    "salary_per_skills": "155485.500"
  },
  {
    "skills": "golang",
    "salary_per_skills": "155000.000"
  },
  {
    "skills": "mxnet",
    "salary_per_skills": "149000.000"
  },
  {
    "skills": "dplyr",
    "salary_per_skills": "147633.333"
  },
  {
    "skills": "vmware",
    "salary_per_skills": "147500.000"
  },
  {
    "skills": "terraform",
    "salary_per_skills": "146733.833"
  },
  {
    "skills": "twilio",
    "salary_per_skills": "138500.000"
  },
  {
    "skills": "gitlab",
    "salary_per_skills": "134126.000"
  },
  {
    "skills": "kafka",
    "salary_per_skills": "129999.163"
  },
  {
    "skills": "puppet",
    "salary_per_skills": "129820.000"
  },
  {
    "skills": "keras",
    "salary_per_skills": "127013.333"
  },
  {
    "skills": "pytorch",
    "salary_per_skills": "125226.200"
  },
  {
    "skills": "perl",
    "salary_per_skills": "124685.750"
  },
  {
    "skills": "ansible",
    "salary_per_skills": "124370.000"
  },
  {
    "skills": "hugging face",
    "salary_per_skills": "123950.000"
  },
  {
    "skills": "tensorflow",
    "salary_per_skills": "120646.833"
  },
  {
    "skills": "cassandra",
    "salary_per_skills": "118406.682"
  },
  {
    "skills": "notion",
    "salary_per_skills": "118091.667"
  },
  {
    "skills": "atlassian",
    "salary_per_skills": "117965.600"
  },
  {
    "skills": "bitbucket",
    "salary_per_skills": "116711.750"
  },
  {
    "skills": "airflow",
    "salary_per_skills": "116387.261"
  },
  {
    "skills": "scala",
    "salary_per_skills": "115479.534"
  }
]
        