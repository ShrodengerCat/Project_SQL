SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS num_of_jobs,
    Round(AVG(salary_year_avg), 0) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON  skills_job_dim.skill_id= skills_dim.skill_id
WHERE
    job_title_short='Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY salary_avg DESC
LIMIT 25
/*
This query was written to find the skills with the higher salaries. It's worth noting that the tools
topping the list are mostly software/ML/big data tools, which are more niche, so it does make since.




*/