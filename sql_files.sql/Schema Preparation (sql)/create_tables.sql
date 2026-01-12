
-- Table No. 1
-- Create table with company details.
-- company_id is Primary Key

CREATE TABLE company_dim
    (
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    google_link TEXT,
    thumbnail TEXT
    );
----------------------------------------------------
-- Table No. 2
-- Create table with skills details- id, skill name, type

CREATE TABLE skills_dim
    (
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT
    );
-----------------------------------------------------------
-- Table No.3 
-- Create a fact table with all major details of job
-- job_id will be Primary Key as it has unique values 
-- Company Id will be Foreign key as it is coming from company_dim

CREATE TABLE job_postings_fact
    (
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short TEXT,
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_scheduled_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
   FOREIGN KEY (company_id) REFERENCES company_dim (company_id)
   
    );
-------------------------------------------------------------
-- Table No.4 skills_job_dim
-- contains skill ids required for each job id
-- Neither job_id nor skills_id is a Primary Key
-- Since Primary key is not present- We need composite key

CREATE TABLE skills_job_dim
    (
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id,skill_id),
    FOREIGN KEY (job_id) REFERENCES job_postings_fact (job_id),
    FOREIGN KEY (skill_id) REFERENCES skills_dim (skill_id)
    )

