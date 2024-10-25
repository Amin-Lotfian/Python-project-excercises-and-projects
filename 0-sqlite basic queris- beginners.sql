/* Order of Write:
SELECT
FROM
JOIN
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

ORDER OF EXECUTION:
FROM/JOIN
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT/OFFSET
*/


QUERIES:
1.
SELECT job_postings_fact.job_title_short, 
  	   job_postings_fact.job_location
FROM job_postings_fact
LIMIT 7

2.
SELECT DISTINCT job_postings_fact.job_title_short 			
FROM job_postings_fact;
SELECT DISTINCT job_postings_fact.job_location
FROM job_postings_fact;

3.	
SELECT DISTINCT job_postings_fact.job_title_short, 
            		job_postings_fact.job_location
FROM job_postings_fact;

4.
SELECT			job_postings_fact.job_title_short,
            job_postings_fact.job_location,
            --job_postings_fact.job_via
				    job_postings_fact.salary_year_avg             
FROM job_postings_fact
WHERE job_postings_fact.salary_year_avg > 90000  -- THIS IS MY COMMENT
AND   job_postings_fact.job_title_short = 'Data Analyst' 
ORDER BY job_postings_fact.salary_year_avg  DESC 

5.	
SELECT 			      job_postings_fact.job_title_short,
                  job_postings_fact.job_title,	
                  job_postings_fact.job_location,
                  job_postings_fact.job_via,
				          job_postings_fact.salary_year_avg                
FROM job_postings_fact
WHERE   
job_postings_fact.job_title LIKE '%Business_Analyst%'


6.	SELECT 			  jpc.job_title_short AS title_short,
                  jpc.job_title as title,	
                  jpc.job_location as location,
                  jpc.job_via as via
                
FROM job_postings_fact as jpc       -- you can also remove as




7.	
SELECT			      job_postings_fact.job_title_short,
                  job_postings_fact.job_location,
                  job_postings_fact.job_title,
				          job_postings_fact.salary_year_avg                
FROM job_postings_fact
WHERE 
(job_title_short LIKE '%Data%' OR job_title_short LIKE '%Business%')
AND job_title_short LIKE '%Analyst%'
AND NOT job_title_short LIKE      '%Senior%'
AND job_postings_fact.salary_year_avg > 90000  
ORDER BY job_postings_fact.salary_year_avg  DESC ;



8.	SELECT *,
job_postings_fact.job_work_from_home + job_postings_fact.job_no_degree_mention AS FFF,
job_postings_fact.salary_hour_avg + 5 AS SALARY_HIKE,
job_postings_fact.salary_year_avg % 8 AS extra_salary
FROM job_postings_fact


9.	
SELECT	          job_postings_fact.job_title_short,
                  job_postings_fact.job_location,
                  job_postings_fact.job_title,
                  COUNT (salary_year_avg) AS COOO1,
                  COUNT (DISTINCT salary_year_avg) AS COOO2,
                  SUM(salary_year_avg) AS SOO,
	                AVG (salary_year_avg) AS VOO			                  
FROM job_postings_fact
ORDER BY job_postings_fact.salary_year_avg  DESC ;


10.	SELECT			  job_postings_fact.job_title_short,               
                  COUNT (salary_year_avg) AS COOO1,
                  COUNT (DISTINCT salary_year_avg) AS COOO2,
                  SUM(salary_year_avg) AS SOO,
	                AVG (salary_year_avg) AS VOO,
                  MIN (salary_year_avg) AS MOO,
                  MAX (salary_year_avg) AS XOO
                
FROM job_postings_fact
GROUP BY JOB_title_short
ORDER BY VOO  ;


11.	
SELECT			      job_title_short,               
                  COUNT (salary_year_avg) AS C1,
                  SUM(salary_year_avg) AS SOO,
	                AVG (salary_year_avg) AS VOO,
                  MIN (salary_year_avg) AS MOO,
                  MAX (salary_year_avg) AS XOO
FROM job_postings_fact
where job_work_from_home = 1 AND NOT
	    salary_year_avg = 'null'
Group by job_title_short
ORDER BY VOO  ;

12.	
SELECT	  job_title_short,
              SUM(salary_year_avg) AS SOO, 
              COUNT (salary_year_avg) AS C1   
FROM job_postings_fact
where job_work_from_home = 1 
AND salary_year_avg IS NOT NULL
Group by job_title_short

  
13.	
SELECT	    		  job_title_short,
                  COUNT (job_title_short) AS C1
FROM job_postings_fact
where job_health_insurance = 1 
Group by job_title_short

14.	
SELECT	    		  job_country,
                  COUNT (job_id) AS C1
FROM job_postings_fact
Group by job_country


15.	
SELECT 
      project_id,
      SUM (hours_spent * hours_rate) AS project_original_cost,
      SUM (hours_spent * (hours_rate + 5)) AS project_projected_cost  
FROM invoices_fact
Group by project_id








