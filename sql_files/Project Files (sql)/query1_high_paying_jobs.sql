/*query1
Problem 1: What are the top 10 paying jobs for following criteria
- Job Role: Data Analyst
- Work From Home job postings
- Remove Null Values
- Include company name as well (from a different table)
*/

SELECT
    job_id,
    job_title_short AS Job_Role,
    job_location,
    salary_year_avg AS Average_Salary,
    company_dim.name AS Company_Name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
