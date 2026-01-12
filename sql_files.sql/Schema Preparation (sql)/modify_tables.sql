-- Contents (Rows) for company_dim to be taken from a CSV file, 
-- which has column Headers and the columns are seperated by delimiter ','

COPY company_dim
FROM 'C:\Program Files\PostgreSQL\18\sql_project 1\csv_files\company_dim.csv'
CSV HEADER DELIMITER ','
;

COPY skills_dim
FROM 'C:\Program Files\PostgreSQL\18\sql_project 1\csv_files\skills_dim.csv'
CSV HEADER DELIMITER ','
;

COPY job_postings_fact
FROM 'C:\Program Files\PostgreSQL\18\sql_project 1\csv_files\job_postings_fact.csv'
CSV HEADER DELIMITER ','
;

COPY skills_job_dim
FROM 'C:\Program Files\PostgreSQL\18\sql_project 1\csv_files\skills_job_dim.csv'
CSV HEADER DELIMITER ','

