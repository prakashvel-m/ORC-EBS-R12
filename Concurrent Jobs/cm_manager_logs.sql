--- All Manager Process logs

SELECT
    fcp.logfile_name AS "ICM Log",
    b.user_concurrent_queue_name AS "Concurrent Manager",
    b.manager_type,
    fcp.process_status_code,
    a.target_node AS "Server Node",
    a.running_processes AS "ACTUAL Processes",
    a.max_processes AS "TARGET Processes",
    DECODE(
        b.control_code,
        'D', 'Deactivating',
        'E', 'Deactivated',
        'N', 'Node unavailable',
        'A', 'Activating',
        'X', 'Terminated',
        'T', 'Terminating',
        'V', 'Verifying',
        'O', 'Suspending',
        'P', 'Suspended',
        'Q', 'Resuming',
        'R', 'Restarting'
    ) AS "Status"
FROM
    apps.fnd_concurrent_processes fcp
JOIN
    apps.fnd_concurrent_queues fcq
ON
    fcp.concurrent_queue_id = fcq.concurrent_queue_id
    AND fcp.queue_application_id = fcq.application_id
JOIN
    apps.fnd_concurrent_queues a
ON
    fcp.concurrent_queue_id = a.concurrent_queue_id
JOIN
    apps.fnd_concurrent_queues_vl b
ON
    a.concurrent_queue_id = b.concurrent_queue_id
WHERE
    --fcp.process_status_code = 'A'
     a.running_processes = a.max_processes
ORDER BY
    a.max_processes DESC;
SELECT * FROM apps.fnd_concurrent_processes;
