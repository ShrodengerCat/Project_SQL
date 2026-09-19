SELECT 
    job_id, 
    job_location, 
    job_title,
    job_title_short, 
    job_schedule_type, 
    salary_year_avg, 
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
WHERE 
    job_location='Anywhere' AND 
    (job_title_short='Data Analyst' OR job_title_short='Data Scientist') AND 
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC    
LIMIT 10;
/*
This query was executed to find the highest 10 paying jobs titled as data analyst or data scientist, and specifying
that to the jobs that had salary_year_avg data. A left join was used to find the names of the companies from the other tables.
The json of the results of the query is as following:

[
  {
    "job_id": 226942,
    "job_location": "Anywhere",
    "job_title": "Data Analyst",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 40145,
    "job_location": "Anywhere",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1714768,
    "job_location": "Anywhere",
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "job_posted_date": "2023-09-01 19:24:02",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1131472,
    "job_location": "Anywhere",
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "job_id": 1742633,
    "job_location": "Anywhere",
    "job_title": "Head of Data Science",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "351500.0",
    "job_posted_date": "2023-07-12 03:07:31",
    "company_name": "Demandbase"
  },
  {
    "job_id": 547382,
    "job_location": "Anywhere",
    "job_title": "Director of Analytics",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "company_name": "Meta"
  },
  {
    "job_id": 551497,
    "job_location": "Anywhere",
    "job_title": "Head of Data Science",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "324000.0",
    "job_posted_date": "2023-05-26 22:04:44",
    "company_name": "Demandbase"
  },
  {
    "job_id": 126218,
    "job_location": "Anywhere",
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "company_name": "Teramind"
  },
  {
    "job_id": 1161630,
    "job_location": "Anywhere",
    "job_title": "Director of Data Science & Analytics",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "313000.0",
    "job_posted_date": "2023-08-23 22:03:48",
    "company_name": "Reddit"
  },
  {
    "job_id": 226011,
    "job_location": "Anywhere",
    "job_title": "Distinguished Data Scientist",
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  }
]


*/