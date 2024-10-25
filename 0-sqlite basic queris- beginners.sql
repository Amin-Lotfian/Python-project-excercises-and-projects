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


