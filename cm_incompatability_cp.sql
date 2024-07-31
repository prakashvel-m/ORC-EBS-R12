SELECT
    fcr1.request_id AS w_request_id,
    fcr1.requested_start_date AS w_r_start,
    fcr1.actual_start_date AS w_a_start,
    ROUND((SYSDATE - fcr1.requested_start_date) * 24 * 60, 2) AS w_delay,
    fcpt1.user_concurrent_program_name AS w_program_name,
    fcr1.phase_code AS w_pc,
    fcr1.status_code AS w_sc,
    fu1.user_name AS w_requestor,
    fcr2.request_id AS c_request_id,
    fcr2.requested_start_date AS c_r_start,
    fcr2.actual_start_date AS c_a_start,
    ROUND((sysdate - fcr2.actual_start_date) * 24 * 60, 2) AS c_time_min,
    fcpt2.user_concurrent_program_name AS c_program_name,
    fcr2.phase_code AS c_pc,
    fcr2.status_code AS c_sc,
    fu2.user_name AS c_requestor
FROM
    fnd_concurrent_requests fcr1
JOIN
    fnd_concurrent_program_serial fcps ON fcr1.concurrent_program_id = fcps.to_run_concurrent_program_id
JOIN
    fnd_concurrent_requests fcr2 ON fcps.running_concurrent_program_id = fcr2.concurrent_program_id
    AND fcr2.phase_code = 'R' -- Running
JOIN
    fnd_concurrent_programs_tl fcpt1 ON fcr1.concurrent_program_id = fcpt1.concurrent_program_id
    AND fcpt1.language = 'US' -- Change this if you need a different language
JOIN
    fnd_concurrent_programs_tl fcpt2 ON fcr2.concurrent_program_id = fcpt2.concurrent_program_id
    AND fcpt2.language = 'US' -- Change this if you need a different language
JOIN
    fnd_user fu1 ON fcr1.requested_by = fu1.user_id
JOIN
    fnd_user fu2 ON fcr2.requested_by = fu2.user_id
WHERE
    fcr1.phase_code = 'P' -- Pending
    AND fcr1.concurrent_program_id != fcr2.concurrent_program_id -- Exclude same programs
    AND fcr1.requested_start_date < SYSDATE
ORDER BY
    fcr1.request_id;
