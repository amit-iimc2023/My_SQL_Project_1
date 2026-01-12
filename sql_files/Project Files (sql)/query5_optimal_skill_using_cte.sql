
WITH high_demand_skill AS
(
SELECT
    skills_dim.skills,
    skills_job_dim.skill_id,
    COUNT(job_postings_fact.job_id)
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL

GROUP BY  skills_dim.skills, skills_job_dim.skill_id
ORDER BY COUNT(job_postings_fact.job_id) DESC
),
high_paying_jobs AS
(
SELECT
   skills_dim.skills,
   skills_job_dim.skill_id,
    avg(salary_year_avg)
   

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL

GROUP BY  skills_dim.skills,
   skills_job_dim.skill_id

ORDER BY avg(salary_year_avg) DESC
)

SELECT
high_demand_skill.skills,
high_demand_skill.count,
ROUND (high_paying_jobs.avg,0)

FROM high_demand_skill
LEFT JOIN high_paying_jobs ON high_demand_skill.skill_id = high_paying_jobs.skill_id

ORDER BY count DESC, avg DESC

