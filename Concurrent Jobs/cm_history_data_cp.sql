-- QUERY TO CHECK THE AVERGAE RUN TIME PER DAY IN PAST ONE WEEK 


SELECT 
    TRUNC(a.actual_start_Date) AS start_date, 
    a.program,a.requestor,a.ARGUMENT_TEXT,
    ROUND(AVG((NVL(actual_completion_Date,sysdate)-actual_start_Date)*24*60),3) AS avg_time_taken,
    COUNT(*) AS run_count
FROM 
    apps.fnd_conc_req_summary_v a 
WHERE 
    program LIKE '%Data extraction worker (Data extraction worker)'
    --and ARGUMENT_TEXT = 'ORDER ENTRY, , LOCATION, , N, Y'
    --and REQUESTOR = '502325254'
GROUP BY 
    TRUNC(a.actual_start_Date) , a.program ,a.requestor,a.ARGUMENT_TEXT
ORDER BY 
    start_date DESC, a.program;
	
-- QUERY TO CHECK THE AVERGAE RUN TIME PER 2 HOURS IN PAST ONE WEEK 	
	
SELECT      
    TRUNC(a.actual_completion_Date) + FLOOR(TO_CHAR(a.actual_completion_Date, 'HH24')/2)*2/24 AS start_date,      
    a.program,
    a.requestor,
    --a.ARGUMENT_TEXT,     
    ROUND(AVG((NVL(actual_completion_Date,sysdate)-actual_start_Date)*24*60),3) AS avg_time_taken,     
    COUNT(*) AS run_count 
FROM      
    apps.fnd_conc_req_summary_v a  
WHERE      
    program LIKE '%program%'
    --and ARGUMENT_TEXT = 'ORDER ENTRY, , LOCATION, , N, Y'     
    --and REQUESTOR = '502325254' 
GROUP BY      
    TRUNC(a.actual_completion_Date) + FLOOR(TO_CHAR(a.actual_completion_Date, 'HH24')/2)*2/24, a.program ,a.requestor--,a.ARGUMENT_TEXT 
ORDER BY      
    start_date DESC, a.program;
	
-- QUERY TO CHECK THE AVERGAE RUN TIME PER 1 HOURS IN PAST ONE WEEK 	

SELECT
    TO_CHAR(a.actual_completion_Date, 'Day') AS day,
    TRUNC(a.actual_completion_Date) + (FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24)) / 24 AS time_interval_start,
    TRUNC(a.actual_completion_Date) + ((FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24) + 1) / 24) AS time_interval_end,
    a.program,
    a.requestor,
    ROUND(AVG((NVL(a.actual_completion_Date, SYSDATE) - a.actual_start_Date) * 24 * 60), 3) AS avg_time_taken,
    ROUND(AVG((a.actual_start_Date - a.request_date) * 24 * 60), 3) AS avg_delay,
    COUNT(*) AS run_count
FROM
    apps.fnd_conc_req_summary_v a
WHERE
    a.program LIKE '%program%'
    AND DAY is not NULL
    --AND a.requestor = '515121729'
GROUP BY
    TO_CHAR(a.actual_completion_Date, 'Day'),
    TRUNC(a.actual_completion_Date) + (FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24)) / 24,
    TRUNC(a.actual_completion_Date) + ((FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24) + 1) / 24),
    a.program,
    a.requestor
ORDER BY
    day DESC,
    time_interval_start DESC,
    a.program;
	
-- QUERY TO CHECK THE AVERGAE RUN TIME PER 30 MINs HOURS IN PAST ONE WEEK
	
	
SELECT
    TRUNC(a.actual_completion_Date) + (FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30) / 1440 AS time_interval_start,
    TRUNC(a.actual_completion_Date) + ((FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30 + 30) / 1440) AS time_interval_end,
    a.program,
    a.requestor,
    ROUND(AVG((NVL(a.actual_completion_Date, SYSDATE) - a.actual_start_Date) * 24 * 60), 3) AS avg_time_taken,
    ROUND(AVG((a.actual_start_Date - a.request_date) * 24 * 60), 3) AS avg_delay,
    COUNT(*) AS run_count
FROM
    apps.fnd_conc_req_summary_v a
WHERE
    a.program LIKE '%program%'
    --AND a.requestor = '515121729'
GROUP BY
    TRUNC(a.actual_completion_Date) + (FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30) / 1440,
    TRUNC(a.actual_completion_Date) + ((FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30 + 30) / 1440),
    a.program,
    a.requestor
ORDER BY
    time_interval_start DESC,
    a.program;
	
	
-- HISTORY
	
SELECT
    TRUNC(a.actual_completion_Date) + (FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30) / 1440 AS time_interval_start,
    TRUNC(a.actual_completion_Date) + ((FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30 + 30) / 1440) AS time_interval_end,
    ROUND(AVG((NVL(a.actual_completion_Date, SYSDATE) - a.actual_start_Date) * 24 * 60), 3) AS avg_time_taken,
    COUNT(*) AS run_count
FROM
    apps.SP_CONCPHASE_HISTORY a
WHERE
    a.actual_completion_Date >= ADD_MONTHS(SYSDATE, -6)
GROUP BY
    TRUNC(a.actual_completion_Date) + (FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30) / 1440,
    TRUNC(a.actual_completion_Date) + ((FLOOR((CAST(a.actual_completion_Date AS DATE) - TRUNC(a.actual_completion_Date)) * 24 * 60 / 30) * 30 + 30) / 1440)
ORDER BY
    time_interval_start DESC;
	
	
	
-- QUERY TO CHECK THE COUNT OF PROGRAMS SUBMITTED EACH DAY FOR LAST X DAYS
	
	
SELECT TRUNC(ACTUAL_START_DATE), COUNT(*) 
FROM SP_CONCPHASE_HISTORY 
WHERE ACTUAL_START_DATE >= TRUNC(SYSDATE) - INTERVAL '180' DAY 
GROUP BY TRUNC(ACTUAL_START_DATE) 
ORDER BY TRUNC(ACTUAL_START_DATE) DESC;


SELECT
    TRUNC(a.actual_completion_Date) AS time_interval_start,
    TRUNC(a.actual_completion_Date) + 1 AS time_interval_end,
    ROUND(AVG((NVL(a.actual_completion_Date, SYSDATE) - a.actual_start_Date) * 24 * 60), 3) AS avg_time_taken,
    COUNT(*) AS run_count
FROM
    apps.SP_CONCPHASE_HISTORY a
WHERE
    a.actual_completion_Date >= ADD_MONTHS(SYSDATE, -6)
GROUP BY
    TRUNC(a.actual_completion_Date)
ORDER BY
    time_interval_start DESC;
