/*query5 Method 1 (Without CTE)
Problem 5: Calculate the most optimal skill
skill with high demand and also high salary
*/

SELECT
    skills_dim.skills,
    skills_job_dim.skill_id,
    count(job_postings_fact.job_id),
    avg(salary_year_avg) :: INT
    

FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills,
    skills_job_dim.skill_id
ORDER BY
    count(job_postings_fact.job_id) DESC,
    avg(salary_year_avg) DESC