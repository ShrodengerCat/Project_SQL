SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS num_of_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON  skills_job_dim.skill_id= skills_dim.skill_id
WHERE
    job_title_short='Data Analyst'
GROUP BY skills
ORDER BY num_of_jobs DESC
LIMIT 5
/* 
This query was written to find the number of jobs that demand each
of the top skills. The analysis showed that sql, excel, and python
are the top skills in demand.
Here're the result in json format:
[
  {
    "skills": "sql",
    "num_of_jobs": "92628"
  },
  {
    "skills": "excel",
    "num_of_jobs": "67031"
  },
  {
    "skills": "python",
    "num_of_jobs": "57326"
  },
  {
    "skills": "tableau",
    "num_of_jobs": "46554"
  },
  {
    "skills": "power bi",
    "num_of_jobs": "39468"
  }
]

*/