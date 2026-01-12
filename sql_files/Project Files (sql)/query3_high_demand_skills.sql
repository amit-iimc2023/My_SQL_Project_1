/*query3
Problem 3: Find top 10 most in-demand skills
i.e. top 10 skills associated with jobs with following criteria
- Job Role: 'Data Analyst'
- Work from home roles
- remove NUll values from salary_year_avg
*/

SELECT
    COUNT(job_postings_fact.job_id),
    skills,
    ROUND (avg (salary_year_avg),0)

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id= skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills     
ORDER BY  COUNT(job_postings_fact.job_id) DESC
LIMIT 10

-----------
-- Here sql =398 (e.g.) is count of sql among all the jobs that follow above criteria. not just top 10 jobs
-- Whereas query4 helps us find count of skills among only top 10 high paying jobs