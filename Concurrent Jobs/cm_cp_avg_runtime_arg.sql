SELECT 
    argument_text,
    COUNT(request_id) AS total_requests,
    ROUND(AVG((NVL(actual_completion_date, SYSDATE) - actual_start_date) * 24 * 60), 2) AS avg_time_taken_minutes
FROM 
    apps.fnd_conc_req_summary_v a
WHERE 
    program LIKE '%%'
    AND phase_code IN ('C') -- Only completed requests
    -- AND argument_text LIKE '%your_condition%' -- Uncomment and replace with specific condition if needed
GROUP BY 
    argument_text
ORDER BY 
    avg_time_taken_minutes DESC;
