/*query2
Problem 2: Find the skills associated with High top 10 high paying jobs with follwoing criteria
- Job ROle: Data Analyst
- Work from home roles
- Remove Null values from salary_year_avg
*/

SELECT
    job_postings_fact.job_id,
    salary_year_avg,
    skills_dim.skills
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC



------------------------
