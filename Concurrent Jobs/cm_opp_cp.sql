SELECT
    a.CONCURRENT_REQUEST_ID,
    CASE 
        WHEN a.ACTION_TYPE = 1 THEN 'Printing'
        WHEN a.ACTION_TYPE = 2 THEN 'Notification'
        WHEN a.ACTION_TYPE = 4 THEN 'PLSQL procedure (11i only)'
        WHEN a.ACTION_TYPE = 6 THEN 'XML Publisher post-processing'
        WHEN a.ACTION_TYPE = 7 THEN 'Delivery'
        WHEN a.ACTION_TYPE = 8 THEN 'Bursting'
        ELSE 'Unknown Type'
    END AS ACTION_TYPE_DESCRIPTION,
    a.STATUS_S_FLAG,
    a.STATUS_W_FLAG,
    a.STATUS_F_FLAG,   r.actual_start_date,
    r.actual_completion_date,
    r.PHASE_CODE,
    r.STATUS_CODE,
    a.LAST_UPDATE_DATE,
    a.LAST_UPDATED_BY,
    u.USER_NAME AS LAST_UPDATED_BY_USER,
    a.CREATION_DATE,
    a.COMPLETED,
    a.ARGUMENT1,
    a.ARGUMENT2,
    a.ARGUMENT3,
    a.ARGUMENT4,
    a.ARGUMENT5,
    a.ARGUMENT6,
    a.ARGUMENT7,
    a.ARGUMENT8,
    a.ARGUMENT9,
    a.ARGUMENT10,
    a.PROCESSOR_ID,
    a.PUBLISHER_RETURN_RESULTS
FROM
    apps.fnd_conc_pp_actions a
LEFT JOIN
    apps.fnd_user u ON a.LAST_UPDATED_BY = u.USER_ID
LEFT JOIN
    apps.fnd_conc_req_summary_v r ON a.CONCURRENT_REQUEST_ID = r.REQUEST_ID
WHERE
    a.ACTION_TYPE = 7
    AND a.COMPLETED = 'Y'
ORDER BY
    a.LAST_UPDATE_DATE DESC;

-- Check the OPP Log 


SELECT fcpp.concurrent_request_id req_id, fcp.node_name, fcp.logfile_name
FROM apps.fnd_conc_pp_actions fcpp, apps.fnd_concurrent_processes fcp
WHERE fcpp.processor_id = fcp.concurrent_process_id
--AND fcpp.action_type = 6
AND fcpp.concurrent_request_id =379091379;
