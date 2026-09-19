WITH demand_for_skill AS (
    SELECT 
        skills_job_dim.skill_id,
        skills_dim.skills,
        COUNT(job_postings_fact.job_id) AS num_of_jobs
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id, skills_dim.skills
), 
salary_for_skills AS (
    SELECT 
        skills_job_dim.skill_id,
        skills_dim.skills,
        COUNT(job_postings_fact.job_id) AS num_of_jobs,
        ROUND(AVG(salary_year_avg), 0) AS salary_avg
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    GROUP BY skills_job_dim.skill_id, skills_dim.skills
)

SELECT
    demand_for_skill.skill_id,
    demand_for_skill.skills,
    demand_for_skill.num_of_jobs,
    salary_for_skills.salary_avg
FROM demand_for_skill
INNER JOIN salary_for_skills 
    ON demand_for_skill.skill_id = salary_for_skills.skill_id
ORDER BY num_of_jobs DESC, salary_avg DESC
/*
This query gives the number od jobs that demand the skills and orders them by this
demand and then by salary.
SQL, python and exccel are among the highest demand

*/