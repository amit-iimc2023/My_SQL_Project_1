/*
Top skills among top 10 high paying jobs
*/

WITH top_job_id AS
(
SELECT 
    job_id,
    salary_year_avg
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)


SELECT
skills_dim.skills,
    COUNT(top_job_id.job_id),
    Round (avg(salary_year_avg),0)
FROM top_job_id
INNER JOIN skills_job_dim ON top_job_id.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY COUNT(top_job_id.job_id) DESC

-----------------------------------

/*query3 v/s query4
query3: Returns count of skills with following criteria
Data Analyst
Work from Home jobs
NO NUll Salary

query4: 
first- finds top 10 high paying jobs

second- finds all the skills associated with top 10 jobs

third- counts this set of








*/